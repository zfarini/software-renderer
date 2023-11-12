#include "game.h"
#include "math.h"
#include <stdlib.h>
#include "utils.cpp"
#include "renderer.cpp"
#define STB_TRUETYPE_IMPLEMENTATION
#include "stb_truetype.h"


#define STB_IMAGE_IMPLEMENTATION 
#define STBI_ONLY_PNG
#include "stb_image.h"

Texture load_texture(Arena *arena, const char *filename)
{
    Texture tex;

    int w, h, n;
    unsigned char *pixels = stbi_load(filename, &w, &h, &n, 4);
    if (!pixels)
    {
        printf("failed to load %s\n", filename);
        assert(0);
    }
    assert(n == 3 || n == 4);
    tex.width = w;
    tex.height = h;
	tex.pitch = w;
	tex.pixels = push_array(arena, uint32_t, w * h);
    //pixels are 0xRRGGBBAA
    uint32_t *pixel = (uint32_t *)pixels;
    for (int y = 0; y < tex.height; y++)
    {
        for (int x = 0; x < tex.width; x++)
        {
            uint32_t p = *pixel;
            uint32_t r = (p >> 0)  & 0xFF;
            uint32_t g = (p >> 8)  & 0xFF;
            uint32_t b = (p >> 16) & 0xFF;
            uint32_t a = (p >> 24) & 0xFF;

			a = 255; // ??
			uint32_t *dest = tex.pixels + (h - y - 1) * tex.width + x;
			*dest = (r << 24) | (g << 16) | (b << 8) | a;

            pixel++;
        }
    }
    printf("loaded %s %d %d\n", filename, w, h);
    stbi_image_free(pixels);
    return tex;
}

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

Mesh load_mesh(Arena *arena, const char *filename, Texture *texture = 0)

{
	Mesh mesh = {};

	int max_vertices_count = 8192 * 128;
	int max_triangle_count = max_vertices_count;
    int vertex_count = 0;

	mesh.triangles = push_array(arena, Triangle, max_triangle_count);


	size_t arena_temp_begin = arena->used;

	char *file = read_entire_file(arena, filename);
	v2 *uvs = push_array(arena, v2, max_vertices_count);
	v3 *vns = push_array(arena, v3, max_vertices_count);
	v3 *vertices = push_array(arena, v3, max_vertices_count);

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
	arena->used = arena_temp_begin;
	arena->used -= (max_triangle_count - mesh.triangle_count) * sizeof(Triangle);
	return mesh;
}

#include <unistd.h>

extern "C" void *game_thread_work(void *data)
{
#if 1
	Game *game = (Game *)data;

	g_thread_info.id = __sync_add_and_fetch(&game->next_thread_index, 1);
	//printf("lanched %d %d\n", g_thread_info.id, g_thread_info.timed_blocks_stack_count);

	while (!game->thread_kill_yourself)
	{
		int tile = __sync_fetch_and_add(&game->next_tile_index, 1);


		if (tile >= TILES_COUNT)
		{
			// TODO: try to avoid this
			//
			// NOTE: this is done to avoid overflowing the tile index when we 
			// are pausing
			__sync_bool_compare_and_swap(&game->next_tile_index, tile, TILES_COUNT);
			continue;
		}
		render_tile(game->render_context, tile);
        __sync_fetch_and_add(&game->tiles_finished, 1);
	}
#endif

	return 0;
}

#if 0
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
#endif

extern "C" void game_update_and_render(Game *game, GameMemory *game_memory, GameInput *game_input)
{
	if (!game->is_initialized)
    {
		Arena global_arena;

		init_arena(&global_arena, game_memory->permanent_storage, game_memory->permanent_storage_size);

		init_arena(&game->scratch_arena, &global_arena, MEGABYTES(64));
		init_arena(&game->permanent_arena, &global_arena, MEGABYTES(64));
		init_arena(&game->assets_arena, &global_arena, MEGABYTES(256));
		init_arena(&game->renderer_arena, &global_arena, GIGABYTES(1));

        game->starwars_tex	= load_texture(&game->assets_arena, "data/starwars.png");
		game->grass_tex		= load_texture(&game->assets_arena, "data/grass.png");
		game->grass_top_tex = load_texture(&game->assets_arena, "data/grass_top.png");
		game->ground_tex	= load_texture(&game->assets_arena, "data/ground.png");
		game->gun_tex		= load_texture(&game->assets_arena, "data/gun_tex.png");

		{
			Texture *t = &game->checkerboard_tex;

			t->width = t->height = t->pitch = 2;
			t->pixels = push_array(&game->permanent_arena, uint32_t, t->width * t->height);

			for (int y = 0; y < t->height; y++)
			{
				for (int x = 0; x <t->width; x++)
					t->pixels[y * t->width + x] = (x + y)% 2 ? 0xffffffff : 0x222222ff;
			}
		}

        game->starwars_mesh = load_mesh(&game->assets_arena, "data/starwars.obj",  &game->starwars_tex);
		game->gun_mesh = load_mesh(&game->assets_arena, "data/gun.obj", &game->gun_tex);
        game->cow_mesh = load_mesh(&game->assets_arena, "data/cow.obj", &game->checkerboard_tex);

		for (int i = 0; i < game->cow_mesh.triangle_count; i++)
		{
			game->cow_mesh.triangles[i].uv0 *= 20;
			game->cow_mesh.triangles[i].uv1 *= 20;
			game->cow_mesh.triangles[i].uv2 *= 20;
		}

        game->monkey_mesh = load_mesh(&game->assets_arena, "data/monkey.obj");
		game->african_head_tex = load_texture(&game->assets_arena, "data/african_head.png");
		game->african_head_mesh = load_mesh(&game->assets_arena, "data/african_head.obj", &game->african_head_tex);

		game->camera_p = (v3){0, 0, 0};




		game->render_context = push_struct(&game->renderer_arena, Render_Context);
		*game->render_context = new_render_context(&game->renderer_arena, game, game->framebuffer, 0.05f, 100, 60, 500000);

		{
			stbtt_fontinfo info;
    	    long size;
    	    unsigned char *font_contents = (unsigned char *)read_entire_file(&game->scratch_arena, "data/liberation-mono.ttf");

    	    if (!stbtt_InitFont(&info, font_contents, 0))
    	        assert(0);
    	    int font_line_height = 256;

    	    float scale = stbtt_ScaleForPixelHeight(&info, font_line_height);


    	    int ascent, descent, lineGap;
    	    stbtt_GetFontVMetrics(&info, &ascent, &descent, &lineGap);
    	    ascent = roundf(ascent * scale);
    	    descent = roundf(descent * scale);

			int chars_first = ' ';
			int chars_last = 127;
			int chars_count = chars_last - chars_first;


    	  	int ax;
    	    int lsb;


    	    stbtt_GetCodepointHMetrics(&info, 'A', &ax, &lsb);
			int font_advance_x = ceilf(ax * scale);

			Texture text_texture;

			text_texture.width = text_texture.pitch = font_advance_x * (chars_last - chars_first);
			text_texture.height = font_line_height;
			text_texture.pixels = push_array(&game->renderer_arena, uint32_t, text_texture.width * text_texture.height);
			game->render_context->text_texture = text_texture;
			game->render_context->first_char = chars_first;
			game->render_context->last_char = chars_last;
			game->render_context->text_du = (float)font_advance_x / text_texture.width;			
			game->render_context->char_height_over_width = ((float)font_line_height / font_advance_x);


            // TODO: this is propably wrong for non square display?
            game->text_dx = (1.f / 80);
            game->text_dy = game->text_dx * ((float)font_line_height / font_advance_x);

			uint8_t *bitmap = push_array(&game->scratch_arena, uint8_t, font_line_height * font_advance_x);

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
			clear_arena(&game->scratch_arena);
		}
		game->is_initialized = 1;
    }
	struct timespec time_start, time_end;
	clock_gettime(CLOCK_MONOTONIC, &time_start);


	if (game_input->buttons[SDL_SCANCODE_P].is_down && !game_input->buttons[SDL_SCANCODE_P].was_down)
		game->pause_game = !game->pause_game;
	//game->pause_game = 1;
	if (game->pause_game)
		return ;
	if (game_input->buttons[SDL_SCANCODE_F1].is_down && !game_input->buttons[SDL_SCANCODE_F1].was_down)
		game->render_zbuffer = !game->render_zbuffer;
	// update camera
	{
		if (game_input->mouse_buttons[MouseButton_Left].is_down ||
			game_input->mouse_relative_mode)
		{
			int sign = game_input->mouse_relative_mode ? -1 : 1;
			game->camera_rotation.y += sign * game_input->mouse_rel_dp.x * (PI * DT * 50);
			game->camera_rotation.x += -sign * game_input->mouse_rel_dp.y * (PI * DT * 50);
		}

		game->camera_dp = V3(0, 0, 0);


		if (game_input->buttons[SDL_SCANCODE_W].is_down)
			game->camera_dp += game->camera_z;

		if (game_input->buttons[SDL_SCANCODE_A].is_down)
			game->camera_dp += -game->camera_x;
		if (game_input->buttons[SDL_SCANCODE_S].is_down)
			game->camera_dp += -game->camera_z;
		if (game_input->buttons[SDL_SCANCODE_D].is_down)
			game->camera_dp += game->camera_x;
		if (game_input->buttons[SDL_SCANCODE_Q].is_down)
			game->camera_dp += game->camera_y;
		if (game_input->buttons[SDL_SCANCODE_E].is_down)
		   game->camera_dp += -game->camera_y;

		if (game_input->buttons[SDL_SCANCODE_R].is_down)
		    game->camera_rotation.z += 0.01f * PI;
		if (game_input->buttons[SDL_SCANCODE_F].is_down)
		    game->camera_rotation.z -= 0.01f * PI;

		game->camera_dp = noz(game->camera_dp) * 8;
		game->camera_p += game->camera_dp * DT;

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

	float d = 10;
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

	push_mesh(r, &game->monkey_mesh, V3(-1, 1, -3), V3(1, 1, 1), V3(game->time * 2, 0, 0), V4(0.8, 0.8, 0.8, 1));
    push_mesh(r, &game->cow_mesh, V3(1, 1.5, -5), V3(1, 1, 1), V3(game->time, game->time, game->time));
    push_mesh(r, &game->starwars_mesh,V3(0, -1, -5), V3(2, 2, 2));
    push_mesh(r, &game->african_head_mesh, V3(-2, 1, -5));
	push_cube(r, r->light_p, V3(1, 0, 0), V3(0, 1, 0), V3(0, 0, -1), V3(.1, .1, .1), V4(1, 1, 1, 1), 0, 0);

    push_box_outline(r, V3(0, 4, 0), V3(1, 1, 1));


    float y = 0;
	{
		char s[512];

		snprintf(s, sizeof(s), "%.2fms", game->last_frame_time);
		push_2d_text(r, cstring(s), V2(0, 0));
        y += game->text_dy;
	}

#if PROFILING
	TimedBlockData *last_timed_blocks = timed_blocks == timed_blocks1 ? timed_blocks2 : timed_blocks1;

	{
		TIMED_BLOCK("profiling");

		TimedBlockData data_sum[MAX_BLOCK_COUNT];

		uint64_t total_cycle_count_for_all_blocks = 0;

		for (int bid = 0; bid < MAX_BLOCK_COUNT; bid++)
		{

	    	TimedBlockData *d = 0;
			uint64_t total_cycle_count = 0;
			int total_call_count = 0;
			uint64_t total_childs_cycle_count = 0;
			int thread_hit_count = 0;
			int	thread_id;
			for (int tid = 0; tid < THREAD_COUNT; tid++)
			{
				TimedBlockData *b = &last_timed_blocks[tid * MAX_BLOCK_COUNT + bid];
				total_cycle_count += b->cycle_count;
				total_call_count += b->calls_count;
				total_childs_cycle_count += b->childs_cycle_count;
				assert(b->cycle_count >= b->childs_cycle_count);

				if (b->cycle_count)
				{
					d = b;
					thread_hit_count++;
					thread_id = tid;
				}
			}
			assert(total_cycle_count >= total_childs_cycle_count);
			data_sum[bid].cycle_count = 0;
			if (!d)
				continue ;

			data_sum[bid] = *d;
			data_sum[bid].cycle_count = total_cycle_count;
			data_sum[bid].calls_count = total_call_count;
			data_sum[bid].childs_cycle_count = total_childs_cycle_count;
			total_cycle_count_for_all_blocks += total_cycle_count - total_childs_cycle_count;
		}
		// sort by cycle_count
		{
			for (int i = 0; i < MAX_BLOCK_COUNT; i++)
			{
				for (int j = 0; j < MAX_BLOCK_COUNT -  1; j++)
				{
					if (data_sum[j].cycle_count - data_sum[j].childs_cycle_count 
							< data_sum[j + 1].cycle_count - data_sum[j + 1].childs_cycle_count)
					{
						TimedBlockData temp = data_sum[j];
						data_sum[j] = data_sum[j + 1];
						data_sum[j + 1] = temp;
					}
				}
			}
		}
		for (int bid = 0; bid < MAX_BLOCK_COUNT; bid++)
		{
			TimedBlockData *d = &data_sum[bid];

			if (!d->cycle_count)
				continue ;
			char s[512];
			uint64_t c = d->cycle_count - d->childs_cycle_count;

			block_cycle_sum[bid] += c;
			//snprintf(s, sizeof(s), "%5.2lf%%: %-20.20s:%4d: %-20.20s: %10lucy %dh",
			snprintf(s, sizeof(s), "%5.2lf%%: %s:%d: %s: %lucy %.0lfavg %dh",
					100 * ((double)c / total_cycle_count_for_all_blocks),
					d->filename, d->line, d->block_name,
					c,
					(double)block_cycle_sum[bid] / (game->frame + 1),
					d->calls_count
					);
			push_2d_text(r, cstring(s), V2(0, y), 1);
	    	y += game->text_dy;

			int thread_hit_count = 0;
			for (int i = 0; i < THREAD_COUNT; i++)
			{
				if (last_timed_blocks[i * MAX_BLOCK_COUNT + d->block_id].cycle_count)
					thread_hit_count++;
			}
			float x = game->text_dx * 3;
			if (thread_hit_count > 1)
			{
				for (int tid = 0; tid < THREAD_COUNT; tid++)
				{
	    			TimedBlockData *curr = &last_timed_blocks[tid * MAX_BLOCK_COUNT + d->block_id];
	
					if (!curr->cycle_count)
						continue ;
					char s[512];
					snprintf(s, sizeof(s), "%5.2lf%% %d: %lucy %dh", 
							((double)(curr->cycle_count - curr->childs_cycle_count) / c) * 100,
							tid, curr->cycle_count - curr->childs_cycle_count,
							curr->calls_count);
					push_2d_text(r, cstring(s), V2(x, y), 1);
	    			y += game->text_dy;
				}
			}
		}
	}
#endif
	end_render(r);

#if PROFILING
	timed_blocks = last_timed_blocks;
	for (int i = 0; i < MAX_BLOCK_COUNT; i++)
	{
		for (int j = 0; j < THREAD_COUNT; j++)
		{
			TimedBlockData *d = &timed_blocks[j * MAX_BLOCK_COUNT + i];

			d->cycle_count = 0;
			d->childs_cycle_count = 0;
			d->calls_count = 0;
		}
	}
#endif

	clock_gettime(CLOCK_MONOTONIC, &time_end);
	game->last_frame_time = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
	if (game->frame)
		game->total_time += game->last_frame_time;


    game->time += DT;
	game->frame++;
}

