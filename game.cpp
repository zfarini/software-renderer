#include "game.h"
#include "math.h"
#include <stdlib.h>
#include "utils.cpp"
#include "renderer.cpp"
#define STB_TRUETYPE_IMPLEMENTATION
#include "stb_truetype.h"

void read_vertex(char **line, int *f)
{
    int i = 0;
	f[0] = strtol(*line, line, 10);

	while (**line == '/')
	{
		*line = *line + 1;
        f[++i] = strtol(*line, line, 10);
	}
	*line = *line + 1;	
}

Mesh load_mesh(const char *filename, Texture *texture = 0)

{
	char *file = read_entire_file(filename);

	Mesh mesh = {};

	int max_vertices_count = 8192 * 128;
	int max_triangle_count = 8192 * 128;

    v2 *uvs = (v2 *)malloc(max_vertices_count * sizeof(*uvs));
    v3 *vns = (v3 *)malloc(max_vertices_count * sizeof(*uvs));

	v3 *vertices = (v3 *)malloc(max_vertices_count * sizeof(v3));
    int vertex_count = 0;

	mesh.triangles = (Triangle *)malloc(max_triangle_count * sizeof(*mesh.triangles));

    float max_abs = FLT_MIN;


    int uv_count = 0;
    int vn_count = 0;

	char *line = file;
	while (*line)
	{
		if (line[0] == 'v' && line[1] == ' ')
		{
			line += 2;
			v3 v;

			v.x = strtof(line, &line);
			line++;
			v.y = strtof(line, &line);
			line++;
			v.z = strtof(line, &line);


            max_abs = fmax(max_abs, fmax(v.x, fmax(v.y, v.z)));

			assert(vertex_count < max_vertices_count);
            vertices[vertex_count++] = v;
		}
		else if (line[0] == 'f' && line[1] == ' ')
		{
			line += 2;

            int f0[3] = {0};
            int f1[3] = {0};
            int f2[3] = {0};

			read_vertex(&line, f0);
			read_vertex(&line, f1);
			read_vertex(&line, f2);

			line--;

			assert(mesh.triangle_count < max_triangle_count);

			Triangle *t = &mesh.triangles[mesh.triangle_count++];
			assert(f0[0] > 0 && f1[0] > 0 && f2[0] > 0);

			t->p0 = vertices[f0[0] - 1];
			t->p1 = vertices[f1[0] - 1];
			t->p2 = vertices[f2[0] - 1];
            t->texture = texture;
            if (f0[1])
            {
                assert(f0[1] > 0 && f1[1] > 0 && f2[1] > 0);
                t->uv0 = V2(uvs[f0[1] - 1].x, uvs[f0[1] - 1].y);
                t->uv1 = V2(uvs[f1[1] - 1].x, uvs[f1[1] - 1].y);
                t->uv2 = V2(uvs[f2[1] - 1].x, uvs[f2[1] - 1].y);
            }
            if (f0[2])
            {
                assert(f0[2] > 0 && f1[2] > 0 && f2[2] > 0);
                t->n0 = vns[f0[2] - 1];
                t->n1 = vns[f1[2] - 1];
                t->n2 = vns[f2[2] - 1];
            }
            else
                t->n0 = t->n1 = t->n2 = noz(cross(t->p1 - t->p0, t->p2 - t->p0));

		}
		else if (line[0] == 'v' && line[1] == 't')
        {
            line += 3;

			float u = strtof(line, &line);
			line++;
			float v = strtof(line, &line);
 //           line++;
            uvs[uv_count++] = V2(u, v);
        }
        else if (line[0] == 'v' && line[1] == 'n')
        {
            line += 3;

            v3 *v = &vns[vn_count++];

			v->x = strtof(line, &line);
			line++;
			v->y = strtof(line, &line);
            line++;
			v->z = strtof(line, &line);

            *v = noz(*v);
        }
		while (*line && *line != '\n')
			line++;
		if (*line == '\n') line++;
	}

	printf("loaded %d triangles\n", mesh.triangle_count);


    float s = 1.f / max_abs;

    for (int i = 0; i < mesh.triangle_count; i++)
    {
        mesh.triangles[i].p0 *= s;
        mesh.triangles[i].p1 *= s;
        mesh.triangles[i].p2 *= s;
    }
    free(vertices);
    free(vns);
    free(uvs);
	return mesh;
}


extern "C" int game_thread_work(void *data)
{
#if 1
	Game *game = (Game *)data;

	int index = __sync_add_and_fetch(&game->next_thread_index, 1);

	printf("lanched thread %d\n", index);
	while (!game->thread_kill_yourself)
	{
		int tile = __sync_fetch_and_add(&game->next_tile_index, 1);

		if (tile >= TILES_COUNT)
		{
			//usleep(100); // TODO: better sleep
			continue;
		}
		render_tile(game->render_context, tile);
        __sync_fetch_and_add(&game->tiles_finished, 1);
	}
#endif

	return 0;
}

void load_animation(const char *dir, Mesh *out, int frame_count, Texture *texture)
{
    for (int i = 0; i < frame_count; i++)
    {
        char filename[64];

        char const *zero = "000";

        if (i + 1 >= 100)
            zero = "0";
        else if (i + 1 >= 10)
            zero = "00";

        snprintf(filename, sizeof(filename), "%s/frame%s%d.obj", dir, zero, i + 1);

        out[i] = load_mesh(filename, texture);
    }
}

extern "C" void game_update_and_render(Game *game)
{


	v3 cubes_offset = {-2, -1, -3};

	if (!game->is_initialized)
    {
        game->starwars_tex = load_texture("starwars.png");
		game->grass_tex = load_texture("grass.png");
		game->grass_top_tex = load_texture("grass_top.png");
		game->ground_tex = load_texture("ground.png");
		game->gun_tex = load_texture("gun_tex.png");

        load_animation("starwars_animation", game->starwars_animation, 116, &game->starwars_tex);

		{
			Texture *t = &game->checkerboard_tex;

			t->width = t->height = t->pitch = 2;
			t->pixels = (uint32_t *)calloc(4, sizeof(uint32_t));
			t->pixels[0] = t->pixels[3] = 0xffffffff;
			t->pixels[1] = t->pixels[2] = 0xff;
		}

        game->starwars_mesh = load_mesh("starwars.obj",  &game->starwars_tex);
		game->gun_mesh = load_mesh("gun.obj", &game->gun_tex);

        game->cow_mesh = load_mesh("cow.obj", &game->checkerboard_tex);

		for (int i = 0; i < game->cow_mesh.triangle_count; i++)
		{
			game->cow_mesh.triangles[i].uv0 *= 20;
			game->cow_mesh.triangles[i].uv1 *= 20;
			game->cow_mesh.triangles[i].uv2 *= 20;
		}

        game->monkey_mesh = load_mesh("monkey.obj");
		game->african_head_tex = load_texture("african_head.png");
		game->african_head_mesh = load_mesh("african_head.obj", &game->african_head_tex);

       game->camera_p = (v3){0, 0, 0};

		srand(time(0));

		for (int i = 0; i < CUBES_HEIGHT; i++)
		{
			for (int j = 0; j < CUBES_WIDTH; j++)
				game->cubes_height[i][j] = (float)rand() / RAND_MAX;
		}


		game->render_context = (Render_Context *)malloc(sizeof(*game->render_context));
		*game->render_context = new_render_context(game, game->framebuffer, 0.05f, 1000, 60, 1000000);

		{
			stbtt_fontinfo info;
    	    long size;
    	    unsigned char *font_contents = (unsigned char *)read_entire_file("liberation-mono.ttf");

    	    if (!stbtt_InitFont(&info, font_contents, 0))
    	        assert(0);
    	    int font_line_height = 1024;

    	    float scale = stbtt_ScaleForPixelHeight(&info, font_line_height);


    	    int ascent, descent, lineGap;
    	    stbtt_GetFontVMetrics(&info, &ascent, &descent, &lineGap);
    	    ascent = roundf(ascent * scale);
    	    descent = roundf(descent * scale);

			int chars_first = ' ';
			int chars_last = 127;
			int chars_count = chars_last - chars_first;

			Texture text_texture;

    	  	int ax;
    	    int lsb;


    	    stbtt_GetCodepointHMetrics(&info, 'A', &ax, &lsb);
			int font_advance_x = ceilf(ax * scale);

			text_texture.width = text_texture.pitch = font_advance_x * (chars_last - chars_first);
			text_texture.height = font_line_height;
			text_texture.pixels = (uint32_t *)malloc(text_texture.width * text_texture.height * sizeof(uint32_t));
			game->render_context->text_texture = text_texture;
			game->render_context->first_char = chars_first;
			game->render_context->last_char = chars_last;
			game->render_context->text_du = (float)font_advance_x / text_texture.width;			



			uint8_t *bitmap = (uint8_t *)malloc(font_line_height * font_advance_x);

    	    for (int c = chars_first; c < chars_last; c++)
    	    {
    	        /* how wide is this character */

    	        stbtt_GetCodepointHMetrics(&info, c, &ax, &lsb);
    	        /* (Note that each Codepoint call has an alternative Glyph version which caches the work required to lookup the character word[i].) */

    	        /* get bounding box for character (may be offset to account for chars that dip above or below the line) */
    	        int c_x1, c_y1, c_x2, c_y2;
    	        stbtt_GetCodepointBitmapBox(&info, c, scale, scale, &c_x1, &c_y1, &c_x2, &c_y2);

    	        /* compute y (different characters have different heights) */
    	        int y = ascent + c_y1;
    	        /* render character (stride and offset is important here) */
    	        int h = c_y2 - c_y1;
    	        int w = c_x2 - c_x1;

    	        //TOOD: changed this ceil for smaller fonts, we gonna need to do better
    	        assert((int)ceilf(ax * scale) == font_advance_x);
    	        //printf("%d %f\n", font_advance_x, ax * scale);
    	        //printf("%d %d %d %d\n", w, h, y, font_advance_x);
    	        int byteOffset = roundf(lsb * scale) + (y * font_advance_x);
				memset(bitmap, 0, font_line_height * font_advance_x);
    	        stbtt_MakeCodepointBitmap(&info, bitmap + byteOffset, w, h, font_advance_x, scale, scale, c);

	//			printf("%d %d %d %d\n", font_line_height, font_advance_x, w, h);
				
				for (int y = 0; y < font_line_height; y++)
				{
					for (int x = 0; x < font_advance_x; x++)
					{
						uint32_t b = bitmap[(font_line_height - y - 1) * font_advance_x + x];
						uint32_t color = 0xffffff00 | b;
						*(text_texture.pixels + y * text_texture.width + (c - chars_first) * font_advance_x + x) = color;
					}
				}
    	    }
    	    free(font_contents);
			free(bitmap);
		}




		game->is_initialized = 1;
    }
	//struct timespec time_start, time_end;
	//clock_gettime(CLOCK_MONOTONIC, &time_start);

	// update camera
	{
		game->camera_p  += game->camera_dp * DT;
		game->camera_inv_rotation_mat = x_rotation(-game->camera_rotation.x) *
						(y_rotation(-game->camera_rotation.y) * z_rotation(-game->camera_rotation.z));
		game->camera_rotation_mat = z_rotation(game->camera_rotation.z) *
					(y_rotation(game->camera_rotation.y) * x_rotation(game->camera_rotation.x));
		game->camera_z = game->camera_rotation_mat * V3(0, 0, -1);
		game->camera_x = game->camera_rotation_mat * V3(1, 0, 0);
		game->camera_y = game->camera_rotation_mat * V3(0, 1, 0);
	}

	float x = 3 * cos(game->time * 1.5);
	float z = -4 + 3 * sin(game->time * 1.5);
	v3 light_p = V3(3, 3, -1);//V3(x, 3, z);

	Render_Context *r = game->render_context;

	begin_render(r, game->camera_p, game->camera_rotation_mat,  V3(0.2, 0.2, 0.2), light_p);


#if 0
	{
		int w = 20;
		int h = 20;
		int d = 10;

		float space = (sinf(game->time) + 1) * 0.5f * 1;

		float a = game->time;
		float b = sinf(game->time * 2);
		float c = cosf(game->time * 1.5);

		for (int x = 0; x < w; x++)
		{
			for (int z = 0; z < h; z++)
			{
				for (int y = 0; y < d; y++)
				{
					if (x && y && z && (x != w - 1) && (z != h - 1) && (y != d - 1))
						continue ;
					if (y == d - 1)
						continue ;
					if (z == 0 && x >= 3 && x <= 6 && y <= 4)
						continue ;
					
					space = 0.1f;
					v3 p = V3(0, 2, -1) + V3(x, y , -z) + V3(space, space, -space) * V3(x, y, z);
					v3 radius = V3(0.5, 0.5, 0.5);
					v4 color = V4(1, 1, 1, 0.2);

					m3x3 rotation = z_rotation(a) * x_rotation(b) * y_rotation(c);

					v3 u = V3(1, 0, 0);
					v3 v = V3(0, 1, 0);
					v3 w = V3(0, 0, -1);
					
					//u = rotation * u;
					//v = rotation * v;
					//w = rotation * w;

					push_cube(r, p, u, v, w, radius, color, 0, 0);
				}
			}
		}
	}
#endif 

	float d = 1000;
	{
		Triangle t = {};

		t.p0 = V3(-d, -1, d);
		t.p1 = V3(d, -1, d);
		t.p2 = V3(d, -1, -d);
		t.uv0 = V2(0, 0);
		t.uv1 = V2(d, 0);
		t.uv2 = V2(d, d);
		t.color = V4(.6, .6, .6, 1);
		t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
		t.texture = &game->checkerboard_tex
			;
		push_triangle(r, &t);
	}
	{
		Triangle t = {};

		t.p0 = V3(-d, -1, d);
		t.p1 = V3(d, -1, -d);
		t.p2 = V3(-d, -1, -d);
		t.uv0 = V2(0, 0);
		t.uv1 = V2(d, d);
		t.uv2 = V2(0, d);
		t.color = V4(.6 , .6 ,.6, 1);
		t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
		t.texture = &game->checkerboard_tex;
		push_triangle(r, &t);
	}



	push_mesh(r, &game->monkey_mesh, V3(-1, 1, -3), V3(1, 1, 1), V3(game->time * 2, 0, 0), V4(0.5, 0.8, 0.2, 1));
    push_mesh(r, &game->cow_mesh, V3(1, 1.5, -5), V3(1, 1, 1), V3(game->time, game->time, game->time));
    push_mesh(r, &game->starwars_animation[(game->frame / 2) % 116], V3(0, -1, -5), V3(2, 2, 2));
    push_mesh(r, &game->african_head_mesh, V3(-2, 1, -5));
	push_cube(r, r->light_p, V3(1, 0, 0), V3(0, 1, 0), V3(0, 0, -1), V3(.1, .1, .1), V4(1, 1, 1, 1), 0, 0);


	char *s = read_entire_file(__FILE__);

	d = 0.2f;
	float yoffset = 0;
	float xoffset = 0;

	for (int i = 0; s[i]; i++)
	{
		if (s[i] == '\n')
		{
			yoffset += d;
			xoffset = 0;
			continue;
		}
		if (s[i] < game->render_context->first_char ||
			s[i] >= game->render_context->last_char)
		{
			xoffset += d;
			continue ;
		}


		float ux_min = (s[i] - game->render_context->first_char) * game->render_context->text_du;
		float ux_max = ux_min + game->render_context->text_du;

		v3  offset = V3(xoffset, 524 * d - yoffset, -2);


		{

			Triangle t = {};

			t.p0 = V3(0, 0, 0);
			t.p1 = V3(d, 0, 0);
			t.p2 = V3(d, d, 0);

			t.p0 += offset, t.p1 += offset, t.p2 += offset;

			t.uv0 = V2(ux_min, 0);
			t.uv1 = V2(ux_max, 0);
			t.uv2 = V2(ux_max, 1);
			t.color = V4(1, 1, 1, 1);
			t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
			t.texture = &game->render_context->text_texture;
			t.no_lighthing = 1;
			push_triangle(r, &t);
		}
		{
			Triangle t = {};

			t.p0 = V3(0, 0, 0);
			t.p1 = V3(d, d, 0);
			t.p2 = V3(0, d,  0);

			t.p0 += offset, t.p1 += offset, t.p2 += offset;
			t.uv0 = V2(ux_min, 0);
			t.uv1 = V2(ux_max, 1);
			t.uv2 = V2(ux_min, 1);
			t.color = V4(1, 1, 1, 1);
			t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
			t.texture = &game->render_context->text_texture;
			t.no_lighthing = 1;
			push_triangle(r, &t);
		}
		xoffset += d;
	}
	free(s);
	end_render(r);

	//clock_gettime(CLOCK_MONOTONIC, &time_end);
	//game->last_frame_time = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
	//if (game->frame)
	//	game->total_time += game->last_frame_time;
    game->time += DT;
	game->frame++;
}
