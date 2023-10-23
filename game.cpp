#include "game.h"
#include "cow.h"
#include "math.h"

#define print_v3(v) printf("%s = (%f, %f, %f)\n", #v, v.x, v.y, v.z)

float max(float a, float b)
{
	return a > b ? a : b;
}

float min(float a, float b)
{
	return a < b ? a : b;
}

void get_tile_clip_bounds(Game *game, int index, v2 &min_clip, v2 &max_clip)
{
	int min_x = ((index) % TILES_PER_WIDTH) * (game->width / TILES_PER_WIDTH);
	int min_y = ((index) / TILES_PER_HEIGHT) * (game->height / TILES_PER_HEIGHT);

	int max_x = min_x + game->width / TILES_PER_WIDTH;
	int max_y = min_y + game->height / TILES_PER_HEIGHT;

	min_clip = V2(min_x, min_y);
	max_clip = V2(max_x, max_y);
}


v3 world_to_camera(Game *game, v3 p)
{
	return game->camera_inv_rotation_mat * (p - game->camera_p);
}

v3 camera_to_world(Game *game, v3 p)
{
	return game->camera_rotation_mat * (p) + game->camera_p;
}

v3 project_to_screen(Game *game, v3 p)
{
	p = world_to_camera(game, p);

    v3 res;
	
    res.x = -(game->near_clip_plane * p.x) / p.z;
    res.y = -(game->near_clip_plane * p.y) / p.z;


    res.x = 2 * res.x / (game->right - game->left) - (game->right + game->left) / (game->right - game->left);
	res.y = 2 * res.y / (game->top - game->bottom) - (game->top + game->bottom) / (game->top - game->bottom);


	res.x = (res.x + 1) * 0.5f * game->width;
	res.y = (1 - res.y) * 0.5f * game->height;
	res.z  = -p.z;

    return res;
}

float edge(v3 a, v3 b, v3 c)
{ return (c.x - a.x) * (b.y - a.y) - (c.y - a.y) * (b.x - a.x); }


struct RenderTileData
{
	Game *game;
	int tile_index;
};

THREAD_WORK_FUNC(render_tile_work)
{
	RenderTileData *data = (RenderTileData *)work->data;

	Game *game = data->game;
	int tile_index = data->tile_index;

	v2 clip_min, clip_max;

	get_tile_clip_bounds(game, tile_index, clip_min, clip_max);

	int clip_min_x = clip_min.x;
	int clip_min_y = clip_min.y;
	int clip_max_x = clip_max.x;
	int clip_max_y = clip_max.y;

	for (int y = clip_min_y; y < clip_max_y; y++)
    {
        for (int x = clip_min_x; x < clip_max_x; x++)
        {
			for (int i = 0; i < SAMPLES_PER_PIXEL; i++)
			{
				int idx = y * game->width * SAMPLES_PER_PIXEL + x * SAMPLES_PER_PIXEL + i;
           		game->zbuffer[idx] = game->far_clip_plane;
           		game->pixels_aa[idx] = 0x87ceeb00;
			}
        }
    }

	for (int j = 0; j < game->triangles_per_tile_count[tile_index]; j++)
	{
		Triangle *t = &game->triangles[game->triangles_per_tile[tile_index][j]];


		v3 p0 = t->screen_p0;
		v3 p1 = t->screen_p1;
		v3 p2 = t->screen_p2;

 		v3 u = p1 - p0;
 		v3 v = p2 - p0;
 		float det = u.x * v.y - v.x * u.y;

 		if (fabsf(det) < 0.0001f)
			continue;

		det = 1 / det;

        float one_over_area = 1.f / edge(p0, p1, p2);

		v3 normal = noz(cross(t->p1 - t->p0, t->p2 - t->p0));



		int min_x = t->min_x;
		int min_y = t->min_y;
		int max_x = t->max_x;
		int max_y = t->max_y;

		if (min_x < clip_min_x) min_x = clip_min_x;
		if (min_y < clip_min_y) min_y = clip_min_y;
		if (max_x > clip_max_x) max_x = clip_max_x;
		if (max_y > clip_max_y) max_y = clip_max_y;

    	for (int y = min_y; y < max_y; y++)
    	{
    	    for (int x = min_x; x < max_x; x++)
    	    {

				for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
				{
					v2 poffset = game->samples_offset[sample];

					v3 b;
					{
	
#if 0
	 				   v3 p = V3(x + poffset.x, y + poffset.y, 0) - p0;
	 				   float alpha = p.x * v.y * det + p.y * (-v.x) * det;
	 				   float beta = p.x * (-u.y) * det + p.y * u.x * det;
	
					   if (alpha < 0 || beta < 0 || alpha + beta > 1)
						   continue ;
					   b.u = alpha;
					   b.v = beta;
					   b.w = 1 - alpha - beta;
#else
	 				   v3 p = V3(x + poffset.x, y + poffset.y, 0);
						b.w = edge(p1, p2, p);
						b.u = edge(p2, p0, p);
						b.v = edge(p0, p1, p);
						if (b.u < 0 || b.v < 0 || b.w < 0)
							continue;
						b *= one_over_area;
#endif
					}
		    	    {
						float z = b.w * p0.z + b.u * p1.z + b.v * p2.z;
		
						int buffer_index = y * game->width * SAMPLES_PER_PIXEL + x * SAMPLES_PER_PIXEL + sample;
						if (z < game->zbuffer[buffer_index])
						{
							game->zbuffer[buffer_index] = z;

							// todo: prespective-correct interpolation?
							//
							v3 p = b.w * t->p0 + b.u * t->p1 + b.v * t->p2;
		
							v3 c = t->color;

							float light = max(0, dot(noz(game->camera_p - p), normal));
		
						 	c = t->color * light;
		
							//c = (normal + V3(1, 1, 1)) * 0.5f;
#if 0
							z *= 0.1f;
							if (z > 1)
								z = 1;
							 c = V3(z, z, z);
#endif
	    	   				uint32_t color32 = ((uint32_t)(c.r * 255 + 0.5f) << 24) |
	    	   				         	       ((uint32_t)(c.g * 255 + 0.5f) << 16) |
	    	   				         	       ((uint32_t)(c.b * 255 + 0.5f) << 8);
	    	   				game->pixels_aa[buffer_index] = color32;
						}

    	        	}
				}
    	    }
		}
	}
	for (int y = clip_min_y; y < clip_max_y; y++)
	{
		for (int x = clip_min_x; x < clip_max_x; x++)
		{
			uint32_t *b = game->pixels_aa + y * game->width * SAMPLES_PER_PIXEL + x * SAMPLES_PER_PIXEL;

			v3 color = {};
			for (int i = 0; i < SAMPLES_PER_PIXEL; i++)
			{
				uint32_t c = b[i];

				color += V3((c >> 24) & 0xFF,
								   (c >> 16) & 0xFF,
								   (c >> 8) & 0xFF) / 255.f;
			}
			color /= SAMPLES_PER_PIXEL;
			game->pixels[y * game->width + x] = 
	    	   				 ((uint32_t)(color.r * 255 + 0.5f) << 24) |
	    	   				 ((uint32_t)(color.g * 255 + 0.5f) << 16) |
	    	   				 ((uint32_t)(color.b * 255 + 0.5f) << 8);
		}
	}
	work->finished = 1;

	return 0;
}

// this runs only on the main thread
ThreadWork *add_thread_work(Game *game)
{
	return &game->thread_work[game->real_work_count++];
}

inline ThreadWork *get_next_thread_work(Game *game)
{
	while (1)
	{
		int work_index = game->next_work_index;
	
		if (work_index >= game->work_count)
			return 0;
		if (atomic_compare_exchange_weak(&game->next_work_index, &work_index, work_index + 1))
			return &game->thread_work[work_index];	
	}
	return 0;
}

void wait_for_all_work_to_finish(Game *game)
{
#if 1
	//atomic_store(&game->work_count, game->real_work_count);
	game->work_count = game->real_work_count;

	while (1)
	{
		ThreadWork *work = get_next_thread_work(game);

		if (!work)
			break ;

		work->callback(work);
	}


	int first_non_finished = 0;
	while (1) // bad!!!!!!!!!
	{
		int finished = 1;
		for (int i = first_non_finished; i < game->work_count; i++)
		{
			if (!game->thread_work[i].finished)
			{
				first_non_finished = i;
				finished = 0;
				break ;
			}
		}
		if (finished)
			break ;
		usleep(100);
	}


#endif
}

void render_game(Game *game)
{
	wait_for_all_work_to_finish(game);

#if 0
	for (int i = 0; i < TILES_COUNT; i++)
	{

		ThreadWork *work = add_thread_work(game);
	
		RenderTileData *data = (RenderTileData *)work->data;
	
		data->game = game, data->tile_index = i;
	
		work->callback = render_tile_work;
		work->finished = 0;
	}
	// add render work
	wait_for_all_work_to_finish(game);
#endif
}

void swap(float &a, float &b)
{
	float t = a;

	a = b;
	b = t;
}

void swap(v3 &a, v3 &b)
{
	swap(a.x, b.x);
	swap(a.y, b.y);
	swap(a.z, b.z);
}

float ray_intersect_plane(v3 plane_normal, float d, v3 ray_origin, v3 ray_dir)
{
	float denom = dot(ray_dir, plane_normal);

	if (fabsf(denom) < 0.000001f)
		return -1;
	
	return (-d - dot(plane_normal, ray_origin)) / denom;
}

// TODO: make this multithreaded

struct DrawTriangleData
{
	Game *game;
	v3 tp0, tp1, tp2, color;
};

THREAD_WORK_FUNC(draw_triangle_work)
{
	work->finished = 1;	
	return 0;

	DrawTriangleData *data = (DrawTriangleData *)work->data;
	
	Game *game = data->game;
	v3 tp0 = data->tp0, tp1 = data->tp1, tp2 = data->tp2, color = data->color;
	
	{
		Triangle triangles[2];
		int triangle_count = 0;
	
		//TODO: transform points by camera
		v3 cp0 = world_to_camera(game, tp0);
		v3 cp1 = world_to_camera(game, tp1);
		v3 cp2 = world_to_camera(game, tp2);
		
	
		v3 normal = noz(cross(cp1 - cp0, cp2 - cp0));
	
	
		v3 plane_normal = V3(0, 0, -1);
		float plane_d = -game->near_clip_plane;
	
		Triangle t = {cp0, cp1, cp2};
	
		// 1 -> are you on the clipped side
		int d0 = cp0.z > plane_d;
		int d1 = cp1.z > plane_d;
		int d2 = cp2.z > plane_d;
	
		if (d0 + d1 + d2 == 0)
		{
			triangles[triangle_count++] = (Triangle){cp0, cp1, cp2};
		}
		else if (d0 + d1 + d2 != 3)
		{
	
			// clip triangle against plane
			float t0 = ray_intersect_plane(plane_normal, plane_d, cp0, cp1 - cp0);	
			v3 x0 = cp0 + t0 * (cp1 - cp0);
			
			float t1 = ray_intersect_plane(plane_normal, plane_d, cp0, cp2 - cp0);	
			v3 x1 = cp0 + t1 * (cp2 - cp0);
		
			float t2 = ray_intersect_plane(plane_normal, plane_d, cp1, cp2 - cp1);	
			v3 x2 = cp1 + t2 * (cp2 - cp1);
		
			if (t0 > 1) t0 = -1;
			if (t1 > 1) t1 = -1;
			if (t2 > 1) t2 = -1;
		
		
			if (t0 < 0)
				swap(x0, x2), swap(t0, t2);
			if (t1 < 0)
				swap(x1, x2), swap(t1, t2);
		
		
		
			if (d0 + d1 + d2 == 1)
			{
				v3 p0, p1;
		
				if (d0) p0 = cp1, p1 = cp2;
				else if (d1) p0 = cp0, p1 = cp2;
				else if (d2) p0 = cp0, p1 = cp1;
		
				/*
					p0   p1
		
				   	x0   x1
				*/
				// in case p1 was in the "left" of p0
				if (dot(noz(p1 - x0), noz(x1 - x0)) < dot(noz(p0 - x0), noz(x1 - x0)))
					swap(p0, p1);
		
		
					//	x0 -= V3(0, 0, 0.01f);
					//	x1 -= V3(0, 0, 0.01f);
						
						Triangle t0 = {x0, x1, p1};
						Triangle t1 = {x0, p1, p0};
		
						if (dot(normal, noz(cross(t0.p1 - t0.p0, t0.p2 - t0.p0))) < 0)
							swap(t0.p1, t0.p2);
						if (dot(normal, noz(cross(t1.p1 - t1.p0, t1.p2 - t1.p0))) < 0)
							swap(t1.p1, t1.p2);
		
						triangles[triangle_count++] = t0;
						triangles[triangle_count++] = t1;
					}
				else if (d0 + d1 + d2 == 2)
				{
					v3 p;
					if (!d0) p = cp0;
					else if (!d1) p = cp1;
					else if (!d2) p = cp2;
					if (dot(normal, noz(cross(x1 - x0, p - x0))) < 0)
						triangles[triangle_count++] = (Triangle){x0, p, x1};
					else
						triangles[triangle_count++] = (Triangle){x0, x1, p};
				}
		}
#if 1
		for (int i = 0; i < triangle_count; i++)
		{
			assert(game->triangle_count < MAX_TRIANGLE_COUNT);
	
			Triangle *t = &triangles[i];

	
			*t = triangles[i];
			t->p0 = camera_to_world(game, t->p0);
			t->p1 = camera_to_world(game, t->p1);
			t->p2 = camera_to_world(game, t->p2);
			t->color = color;
	
			v3 p0 = project_to_screen(game, t->p0);
	    	v3 p1 = project_to_screen(game, t->p1);
	    	v3 p2 = project_to_screen(game, t->p2);
	
	    	v2 tmin = {fmin(p0.x, fmin(p1.x, p2.x)), fmin(p0.y, fmin(p1.y, p2.y))};
	    	v2 tmax = {fmax(p0.x, fmax(p1.x, p2.x)), fmax(p0.y, fmax(p1.y, p2.y))};
	
			t->screen_p0 = p0;
			t->screen_p1 = p1;
			t->screen_p2 = p2;
	
	    	t->min_x = floorf(tmin.x);
	    	t->max_x = floorf(tmax.x) + 1;
	    	t->min_y = floorf(tmin.y);
	    	t->max_y = floorf(tmax.y) + 1;
	
	    	if (t->min_x < 0) t->min_x = 0;
	    	if (t->min_y < 0) t->min_y = 0;
	    	if (t->max_x > game->width) t->max_x = game->width;
	    	if (t->max_y > game->height) t->max_y = game->height;
			if (t->min_x >= t->max_x || t->min_y >= t->max_y)
				continue;

			int index = game->triangle_count++;
			game->triangles[index] = *t;

#if 1
			for (int j = 0; j < TILES_COUNT; j++)
			{
				v2 clip_min, clip_max;
	
				get_tile_clip_bounds(game, j, clip_min, clip_max);
				
				int cmin_x = clamp(clip_min.x, clip_max.x, t->min_x);
				int cmin_y = clamp(clip_min.y, clip_max.y, t->min_y);
				int cmax_x = clamp(clip_min.x, clip_max.x, t->max_x);
				int cmax_y = clamp(clip_min.y, clip_max.y, t->max_y);
	
				if (cmin_x >= cmax_x || cmin_y >= cmax_y)
					continue;
				assert(game->triangles_per_tile_count[j] < MAX_TRIANGLE_COUNT_PER_TILE);
				game->triangles_per_tile[j][game->triangles_per_tile_count[j]++] = index;
			}
#endif
		}
#endif
	}
	work->finished = 1;
	return (0);
}

void draw_triangle(Game *game, v3 tp0, v3 tp1, v3 tp2, v3 color)
{
	if (dot(cross(tp1 - tp0, tp2 - tp0), tp0 - game->camera_p) >= 0)
		return ;

	ThreadWork *work = add_thread_work(game);

	work->finished = 0;

	DrawTriangleData *data = (DrawTriangleData *)work->data;


	data->game = game, data->tp0 = tp0, data->tp1 = tp1, data->tp2 = tp2, data->color = color;

	work->callback = draw_triangle_work;
}

void draw_cube(Game *game, v3 c, v3 rotation, float radius, v3 color)
{
	v3 u = rotate(V3(1, 0, 0), rotation);
	v3 v = rotate(V3(0, 1, 0), rotation);
	v3 w = rotate(V3(0, 0, 1), rotation);

    u = noz(u) * radius;
    v = noz(v) * radius;
    w = noz(w) * radius;

	v3 p00 = c - u - v + w;
	v3 p01 = c + u - v + w;
	v3 p02 = c + u + v + w;
	v3 p03 = c - u + v + w;
	v3 p10 = c - u - v - w;
	v3 p11 = c + u - v - w;
	v3 p12 = c + u + v - w;
	v3 p13 = c - u + v - w;

    v3 triangles[][3] = {
        {p00, p01, p02}, {p00, p02, p03}, // front
      	{p10, p12, p11}, {p10, p13, p12}, // back
		{p01, p11, p12}, {p01, p12, p02}, // right
		{p10, p00, p03}, {p10, p03, p13}, // left
        {p03, p02, p12}, {p03, p12, p13}, // up
        {p00, p11, p01}, {p00, p10, p11}, // down
    };
    int n = sizeof(triangles) / sizeof(*triangles);

    for (int i = 0; i < n; i++)
        draw_triangle(game, triangles[i][0], triangles[i][1], triangles[i][2], color);
}

extern "C" void *game_thread_work(void *data)
{
	Game *game = (Game *)data;

	int index = ++game->next_thread_index;

	printf("lanched thread %d\n", index);
	while (1)
	{
		ThreadWork *work = get_next_thread_work(game);

		if (!work)
		{
			usleep(100);
			continue;
		}
		work->callback(work);
	}

	return 0;
}


extern "C" void game_update_and_render(Game *game)
{
	struct timespec time_start, time_end;
	clock_gettime(CLOCK_MONOTONIC, &time_start);

	v3 cubes_offset = {-2, -1, -3};

	if (!game->is_initialized)
    {
		game->near_clip_plane = 0.08f;
		game->far_clip_plane = 1000;
		game->fov = 60;

		game->triangles = (Triangle *)malloc(sizeof(*game->triangles) * MAX_TRIANGLE_COUNT);
		game->thread_work = (ThreadWork *)malloc(sizeof(*game->thread_work) * MAX_TRIANGLE_COUNT * 2);
		game->zbuffer = (float *)malloc(game->width * game->height * MAX_SAMPLES_PER_PIXEL * sizeof(*game->zbuffer));
		game->pixels_aa = (uint32_t *)malloc(game->width * game->height * MAX_SAMPLES_PER_PIXEL * sizeof(uint32_t));

        game->camera_p = (v3){0, 1, 8};
       // game->camera_p = (v3){};

        game->film_width = tan((game->fov*0.5f) * DEG_TO_RAD) * 2 * game->near_clip_plane;
        game->film_height = game->film_width * ((float)game->height / game->width);
		game->top = game->film_height * 0.5f;
		game->right = game->film_width * 0.5f;
		game->bottom = -game->top;
		game->left = -game->right;

		srand(time(0));

		for (int i = 0; i < CUBES_WIDTH; i++)
		{
			for (int j = 0; j < CUBES_HEIGHT; j++)
				game->cubes_height[i][j] = (float)rand() / RAND_MAX;
		}
		game->is_initialized = 1;
    }
	game->real_work_count = 0;
	game->work_count = 0;
	game->next_work_index = 0;

	for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
	{
		int samples_per_dim = sqrtf(SAMPLES_PER_PIXEL);

		if (SAMPLES_PER_PIXEL == 1)
			game->samples_offset[sample] = V2(0.5f, 0.5f);
		game->samples_offset[sample] = V2((sample % samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2),
						(sample / samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2));


	}
	game->triangle_count = 0;
	for (int i = 0; i < TILES_COUNT; i++)
		game->triangles_per_tile_count[i] = 0;

	{
		game->near_clip_plane = 0.08f;
		game->far_clip_plane = 1000;
		game->fov = 60;
        game->film_width = tan((game->fov*0.5f) * DEG_TO_RAD) * 2 * game->near_clip_plane;
        game->film_height = game->film_width * ((float)game->height / game->width);
		game->top = game->film_height * 0.5f;
		game->right = game->film_width * 0.5f;
		game->bottom = -game->top;
		game->left = -game->right;

		game->camera_inv_rotation_mat = x_rotation(-game->camera_rotation.x) *
						(y_rotation(-game->camera_rotation.y) * z_rotation(-game->camera_rotation.z));
		game->camera_rotation_mat = z_rotation(game->camera_rotation.z) *
					(y_rotation(game->camera_rotation.y) * x_rotation(game->camera_rotation.x));
		game->camera_z = game->camera_rotation_mat * V3(0, 0, -1);
		game->camera_x = game->camera_rotation_mat * V3(1, 0, 0);
		game->camera_y = game->camera_rotation_mat * V3(0, 1, 0);
	}

	if (game->go_in)
		game->camera_p += game->camera_z * DT * 0.1;
	else if (game->go_back)
		game->camera_p -= game->camera_z * DT * 0.1;

	//draw_triangle(game, V3(-0.5f, 0, -2), V3(0.5f, 0, -2), V3(0, 1, -2), V3(1, 0, 0));
	//draw_triangle(game, V3(-0.5f, -1.f, -2), V3(0.5f, -1.f, -2), V3(0, 0.5, -1.5), V3(1, 0, 0));
    
#if 1
	v3 rotation = {};
	for (int z = 0; z < CUBES_HEIGHT; z++)
	{
		for (int x = 0; x < CUBES_WIDTH; x++)
		{
			float r = 0.2;
			v3 p = V3((x * r * 2.1 - CUBES_WIDTH * 0.5f * r * 2.1), game->cubes_height[z][x] * 0.3, -z * r * 2.2) + cubes_offset;
			v3 color = lerp(V3(0.2, 0.8, 0.3), V3(0.1, 0.9, 0.7), game->cubes_height[z][x]);
    		draw_cube(game, p, rotation, 0.2, color);
		}
	}

    float a = game->time;
	rotation = V3(a, a, a);
	for (int i = 0; i < ntris; i++)
	{
		v3 v0 = vertices[nvertices[i * 3]];
		v3 v1 = vertices[nvertices[i * 3 + 1]];
		v3 v2 = vertices[nvertices[i * 3 + 2]];

		v0 = rotate(v0, rotation);
		v1 = rotate(v1, rotation);
		v2 = rotate(v2, rotation);


		v0 *= 0.25f;
		v1 *= 0.25f;
		v2 *= 0.25f;

		draw_triangle(game, v0, v1, v2, V3(1, 1, 1));
	}

#endif

	render_game(game);

	clock_gettime(CLOCK_MONOTONIC, &time_end);
	game->last_frame_time = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
	game->total_time += game->last_frame_time;
    game->time += DT;
	game->frame++;
}
