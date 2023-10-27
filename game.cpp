#include "game.h"
#include "math.h"
#include <stdlib.h>
#include "utils.cpp"
#include "renderer.cpp"

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
			usleep(100);
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
	struct timespec time_start, time_end;
	clock_gettime(CLOCK_MONOTONIC, &time_start);

	v3 cubes_offset = {-2, -1, -3};

	if (!game->is_initialized)
    {
        game->starwars_tex = load_texture("starwars.png");
		game->grass_tex = load_texture("grass.png");
		game->grass_top_tex = load_texture("grass_top.png");
		game->ground_tex = load_texture("ground.png");
		game->gun_tex = load_texture("gun_tex.png");

		{
			Texture *t = &game->checkerboard_tex;

			t->width = t->height = t->pitch = 2;
			t->pixels = (uint32_t *)calloc(4, sizeof(uint32_t));
			t->pixels[0] = t->pixels[3] = 0xffffffff;
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
		*game->render_context = new_render_context(game, game->framebuffer, 0.05f, 1000, 60, 100000);
		game->is_initialized = 1;
    }

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
	v3 light_p = V3(x, 3, z);

	Render_Context *r = game->render_context;

	begin_render(r, game->camera_p, game->camera_rotation_mat,  V3(0.52, .8, .9), light_p);


#if 1
	v3 rotation = {};
	for (int z = 0; z < CUBES_HEIGHT; z++)
	{
		for (int x = 0; x < CUBES_WIDTH; x++)
		{
			int y_count = game->cubes_height[z][x] * 5 + 1;

			y_count = 1;
			for (int y = 0; y < y_count; y++)
			{
				float radius = 0.2;
				v3 p = V3((x * radius * 1.98 - CUBES_WIDTH * 0.5f * radius * 2.001), y * radius * 1.98f, -z * radius * 1.98) + cubes_offset;
				v3 color = lerp(V3(0.2, 0.8, 0.3), game->cubes_height[z][x], V3(0.1, 0.9, 0.7));
				push_cube(r, p, V3(1, 0, 0), V3(0, 1, 0), V3(0, 0, -1), V3(.1, .1, .1), V3(1, 1, 1), &game->grass_top_tex, &game->grass_tex);
    //			push_cube(game, p, rotation, 0.2, V3(1, 1, 1), &game->grass_top_tex, &game->grass_tex);
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
		t.color = V3(.6, .6, .6);
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
		t.color = V3(.6 , .6 ,.6);
		t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
		t.texture = &game->checkerboard_tex;
		push_triangle(r, &t);
	}

	push_mesh(r, &game->monkey_mesh, V3(-1, 1, -3), V3(1, 1, 1), V3(game->time * 2, 0, 0), V3(0.5, 0.8, 0.2));
    push_mesh(r, &game->cow_mesh, V3(1, 1.5, -5), V3(1, 1, 1), V3(game->time, game->time, game->time));
    push_mesh(r, &game->starwars_mesh, V3(0, -0.5, -5), V3(1, 1, 1), V3(0, 0, 0));
    push_mesh(r, &game->african_head_mesh, V3(-2, 1, -5), V3(1, 1, 1), V3(0, 0, 0));
	push_cube(r, r->light_p, V3(1, 0, 0), V3(0, 1, 0), V3(0, 0, -1), V3(.1, .1, .1), V3(1, 1, 1), 0, 0);

	end_render(r);

	clock_gettime(CLOCK_MONOTONIC, &time_end);
	game->last_frame_time = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
	if (game->frame)
		game->total_time += game->last_frame_time;
    game->time += DT;
	game->frame++;
}
