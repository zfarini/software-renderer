#include "game.h"
#include "cow.h"
#include "math.h"

#define print_v3(v) printf("%s = (%f, %f, %f)\n", #v, v.x, v.y, v.z)

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

void render_game(Game *game)
{
    for (int y = 0; y < game->height; y++)
    {
        for (int x = 0; x < game->width; x++)
        {
            game->zbuffer[y * game->width + x] = game->far_clip_plane;
            game->pixels[y * game->width + x] = 0x87ceeb00;
        }
    }

	int max = 0;
	for (int i = 0; i < game->triangle_count; i++)
	{
		Triangle *t = &game->triangles[i];

    	v3 p0 = project_to_screen(game, t->p0);
    	v3 p1 = project_to_screen(game, t->p1);
    	v3 p2 = project_to_screen(game, t->p2);


    	v2 box_min = {fmin(p0.x, fmin(p1.x, p2.x)), fmin(p0.y, fmin(p1.y, p2.y))};
    	v2 box_max = {fmax(p0.x, fmax(p1.x, p2.x)), fmax(p0.y, fmax(p1.y, p2.y))};

    	int min_x = floorf(box_min.x);
    	int max_x = ceilf(box_max.x);
    	int min_y = floorf(box_min.y);
    	int max_y = ceilf(box_max.y);

    	if (min_x < 0) min_x = 0;
    	if (min_y < 0) min_y = 0;
    	if (max_x > game->width) max_x = game->width;
    	if (max_y > game->height) max_y = game->height;

		if (min_x >= max_x || min_y >= max_y)
			continue;

 		v3 u = p1 - p0;
 		v3 v = p2 - p0;
 		float det = u.x * v.y - v.x * u.y;

 		if (fabsf(det) < 0.0001f)
			continue;

		det = 1 / det;

		v3 normal = noz(cross(t->p1 - t->p0, t->p2 - t->p0));

    	for (int y = min_y; y < max_y; y++)
    	{
    	    for (int x = min_x; x < max_x; x++)

    	    {
			
				v3 b;
				{
 				   v3 p = V3(x + 0.5f, y + 0.5f, 0) - p0;

 				   float alpha = p.x * v.y * det + p.y * (-v.x) * det;
 				   float beta = p.x * (-u.y) * det + p.y * u.x * det;

				   if (alpha < 0 || beta < 0 || alpha + beta > 1)
					   continue ;

				   b.u = alpha;
				   b.v = beta;
				   b.w = 1 - alpha - beta;
				}
    	        {
					float z = b.w * p0.z + b.u * p1.z + b.v * p2.z;

	//				assert(z >= game->near_clip_plane - 0.001f);
					if (z < game->zbuffer[y * game->width + x])
					{
						game->zbuffer[y * game->width + x] = z;


						v3 p = b.w * t->p0 + b.u * t->p1 + b.v * t->p2;

						v3 c = t->color;
#if 0
						float light = fmax(0, dot(noz(V3(5, 5, -5) - p), normal));
#else
						float light = fmax(0, dot(noz(game->camera_p - p), normal));
#endif

						//light = 1;
						 c = t->color * light;

						 //c = (normal + V3(1, 1, 1)) * 0.5f;

#if 1
#endif
    	            	uint32_t color32 = ((uint32_t)(c.r * 255 + 0.5f) << 24) |
    	            	        ((uint32_t)(c.g * 255 + 0.5f) << 16) |
    	            	        ((uint32_t)(c.b * 255 + 0.5f) << 8);

    	            	game->pixels[y * game->width + x] = color32;
					}

    	        }
    	    }
    	}
		int h = (max_y - min_y) * (max_x - min_x);
		if (h > max)
			max = h;
	}
	//printf("max: %d %f\n", max, (float)max / (game->width * game->height) * 100); 
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

void draw_triangle(Game *game, v3 tp0, v3 tp1, v3 tp2, v3 color)
{
	v3 normal = noz(cross(tp1 - tp0, tp2 - tp0));

	// ????????
//	if (dot(normal, tp0 - game->camera_p) >= 0)
//		return ;
	
	//TODO: transform points by camera

	v3 cp0 = world_to_camera(game, tp0);
	v3 cp1 = world_to_camera(game, tp1);
	v3 cp2 = world_to_camera(game, tp2);
	
	Triangle triangles[16];
	
	triangles[0] = (Triangle){cp0, cp1, cp2};

	normal = noz(cross(cp1 - cp0, cp2 - cp0));

	int triangle_count = 1;
	// construct the 5 planes
	struct {
		v3 normal;
		float d;
	} planes[] = { // normal direction matters
		{{0, 0, -1}, -game->near_clip_plane}, // front
	//	{cross(V3(game->left, game->bottom, -game->near_clip_plane),
	//		   V3(game->left, game->top, -game->near_clip_plane)), 0}, // left
//
		//{cross(V3(game->right, game->top, game->near_clip_plane),
		//	   V3(game->right, game->bottom, game->near_clip_plane)), 0}, // right
//		{cross(V3(game->left, game->top, game->near_clip_plane),
//			   V3(game->right, game->top, game->near_clip_plane)), 0}, // top
//		{cross(V3(game->left, game->bottom, game->near_clip_plane),
//			   V3(game->right, game->bottom, game->near_clip_plane)), 0}, // bottom
	};
	for (int i = 0; i < ARRAY_LENGTH(planes); i++)
		planes[i].normal = noz(planes[i].normal);

	for (int i = 0; i < ARRAY_LENGTH(planes); i++)
	{
		Triangle new_triangles[16];
		int new_triangle_count = 0;

		for (int j = 0; j < triangle_count; j++)
		{
			Triangle *t = &triangles[j];

			// 1 -> are you on the clipped side
			int d0 = dot(t->p0, planes[i].normal) <= -planes[i].d;
			int d1 = dot(t->p1, planes[i].normal) <= -planes[i].d;
			int d2 = dot(t->p2, planes[i].normal) <= -planes[i].d;

		//	d0 = t->p0.z > -game->near_clip_plane;
		//	d1 = t->p1.z > -game->near_clip_plane;
		//	d2 = t->p2.z > -game->near_clip_plane;

			// TODO: what if the plan is a side of the triangle

	//		printf("%f %f %f %d %d %d\n", t0, t1, t2, d0, d1, d2);


			if (d0 + d1 + d2 == 3)
				continue ;
			if (d0 + d1 + d2 == 0)
			{
				new_triangles[new_triangle_count++] = triangles[j];
				continue ;
			}

			// clip triangle against plane
			float t0 = ray_intersect_plane(planes[i].normal, planes[i].d, t->p0, t->p1 - t->p0);	
			v3 x0 = t->p0 + t0 * (t->p1 - t->p0);
			
		//	if (fabsf(t->p1.z - t->p0.z) < 0.01f ||
		//		fabsf(t->p2.z - t->p0.z) < 0.01f ||
		//		fabsf(t->p2.z - t->p1.z) < 0.01f)
		//		printf("bad %d\n", game->frame);
		//	x0 = t->p0 + (-(game->near_clip_plane + t->p0.z) / (t->p1.z - t->p0.z)) * (t->p1 - t->p0);

			float t1 = ray_intersect_plane(planes[i].normal, planes[i].d, t->p0, t->p2 - t->p0);	
			v3 x1 = t->p0 + t1 * (t->p2 - t->p0);

			float t2 = ray_intersect_plane(planes[i].normal, planes[i].d, t->p1, t->p2 - t->p1);	
			v3 x2 = t->p1 + t2 * (t->p2 - t->p1);

			if (t0 > 1) t0 = -1;
			if (t1 > 1) t1 = -1;
			if (t2 > 1) t2 = -1;



			if ((t0 < 0) + (t1 < 0) + (t2 < 0) > 1)
				printf("bad %d\n", game->frame);

			if (t0 < 0)
				swap(x0, x2), swap(t0, t2);
			if (t1 < 0)
				swap(x1, x2), swap(t1, t2);


			if (t0 < 0 || t1 < 0)
				printf("bad %d\n", game->frame);

			if (d0 + d1 + d2 == 1)
			{
				v3 p0, p1;

				if (d0) p0 = t->p1, p1 = t->p2;
				else if (d1) p0 = t->p0, p1 = t->p2;
				else if (d2) p0 = t->p0, p1 = t->p1;

				/*
					p0   p1

				   	x0   x1
				*/
				// in case p1 was in the "left" of p0
				if (dot(noz(p1 - x0), noz(x1 - x0)) < dot(noz(p0 - x0), noz(x1 - x0)))
					swap(p0, p1);

				x0.z = -game->near_clip_plane;
				x1.z = -game->near_clip_plane;

			//	x0 -= V3(0, 0, 0.01f);
			//	x1 -= V3(0, 0, 0.01f);
				
				Triangle t0 = {x0, x1, p1};
				Triangle t1 = {x0, p1, p0};

				if (dot(normal, noz(cross(t0.p1 - t0.p0, t0.p2 - t0.p0))) < 0)
					swap(t0.p1, t0.p2);
				if (dot(normal, noz(cross(t1.p1 - t1.p0, t1.p2 - t1.p0))) < 0)
					swap(t1.p1, t1.p2);

				new_triangles[new_triangle_count++] = t0;
				new_triangles[new_triangle_count++] = t1;
			}
			else if (d0 + d1 + d2 == 2)
			{
				v3 p;
				if (!d0) p = t->p0;
				else if (!d1) p = t->p1;
				else if (!d2) p = t->p2;
				if (dot(normal, noz(cross(x1 - x0, p - x0))) < 0)
					new_triangles[new_triangle_count++] = (Triangle){x0, p, x1};
				else
					new_triangles[new_triangle_count++] = (Triangle){x0, x1, p};
			}
		}

		triangle_count = new_triangle_count;
		for (int j = 0; j < triangle_count; j++)
			triangles[j] = new_triangles[j];
	}
	for (int j = 0; j < triangle_count; j++)
	{
		Triangle *t = &game->triangles[game->triangle_count++];

		*t = triangles[j];
		t->p0 = camera_to_world(game, t->p0);
		t->p1 = camera_to_world(game, t->p1);
		t->p2 = camera_to_world(game, t->p2);
		t->color = color;
	}

	#if 0
	game->triangles[game->triangle_count++] = (Triangle){
		tp0,
		tp1,
		tp2,
		color,
	};
	#endif
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



extern "C" void game_update_and_render(Game *game)
{
	struct timespec time_start, time_end;
	clock_gettime(CLOCK_MONOTONIC, &time_start);

	v3 cubes_offset = {-2, -1, -3};

	if (!game->is_initialized)
    {
		game->near_clip_plane = .01;
		game->far_clip_plane = 1000;
		game->fov = 60;

		game->zbuffer = (float *)malloc(game->width * game->height * sizeof(*game->zbuffer));
		game->triangles = (Triangle *)malloc(sizeof(*game->triangles) * 128000);

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
	game->triangle_count = 0;

	{
		game->near_clip_plane = .08;
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
    v3 rotation = {};
	for (int z = 0; z < CUBES_HEIGHT; z++)
	{
		for (int x = 0; x < CUBES_WIDTH; x++)
		{
			v3 p = V3(x * 0.42, game->cubes_height[z][x] * 0.3, -z * 0.42) + cubes_offset;
			v3 color = lerp(V3(0.2, 0.8, 0.3), V3(0.1, 0.9, 0.7), game->cubes_height[z][x]);
    		draw_cube(game, p, rotation, 0.2, color);
		}
	}

#if 1
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
    game->time += DT;
	game->frame++;
}
