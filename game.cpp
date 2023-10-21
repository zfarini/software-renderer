#include "game.h"
#include "cow.h"
#include "math.h"

v3 project_to_screen(Game *game, v3 p)
{
	p -= game->camera_p;

	p = game->camera_inv_rotation_mat * p;

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

		if (p0.z < game->near_clip_plane || p1.z < game->near_clip_plane || p2.z < game->near_clip_plane)
			continue;

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


		//TODO: stupid hack
		{
			float area = length(cross(p1 - p0, p2 - p0)) * 0.5f;

			if (area > 100000)
				continue;
		}

    	for (int y = min_y; y < max_y; y++)
    	{
    	    for (int x = min_x; x < max_x; x++)

    	    {
			
				v3 b;
				{
 				   v3 p = V3(x + 0.5f, y + 0.5f, 0) - p0;

 				   float alpha = p.x * v.y * det + p.y * (-v.x) * det;

				   if (alpha < 0 || alpha > 1)
					   continue ;

 				   float beta = p.x * (-u.y) * det + p.y * u.x * det;

				   if (beta < 0 || beta > 1 || alpha + beta > 1)
					   continue ;

				   b.u = alpha;
				   b.v = beta;
				   b.w = 1 - alpha - beta;
				}
    	        {
					float z = b.w * p0.z + b.u * p1.z + b.v * p2.z;

					if (z >= game->near_clip_plane && z < game->zbuffer[y * game->width + x])
					{
						game->zbuffer[y * game->width + x] = z;


						v3 p = b.w * t->p0 + b.u * t->p1 + b.v * t->p2;

						v3 c = t->color;
	//					float light = fmax(0, v3_dot(v3_noz(v3_sub(light_p, p)), t->normal));

						float light = fmax(0, dot(noz(game->camera_p - p), t->normal));

						 c = t->color * light;

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

void draw_triangle(Game *game, v3 tp0, v3 tp1, v3 tp2, v3 color)
{
	v3 normal = noz(cross(tp1 - tp0, tp2 - tp0));

	if (dot(normal, tp0 - game->camera_p) >= 0)
		return ;
	
	game->triangles[game->triangle_count++] = (Triangle){
		tp0,
		tp1,
		tp2,
		normal,
		color,
	};

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
		game->near_clip_plane = 0.5;
		game->far_clip_plane = 1000;
		game->fov = 60;

		game->zbuffer = (float *)malloc(game->width * game->height * sizeof(*game->zbuffer));
		game->triangles = (Triangle *)malloc(sizeof(*game->triangles) * 128000);

        game->camera_p = (v3){0, 1, 8};

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
		game->camera_inv_rotation_mat = x_rotation(-game->camera_rotation.x) *
						(y_rotation(-game->camera_rotation.y) * z_rotation(-game->camera_rotation.z));
		m3x3 m = z_rotation(game->camera_rotation.z) *
					(y_rotation(game->camera_rotation.y) * x_rotation(game->camera_rotation.x));
		game->camera_z = m * V3(0, 0, -1);
		game->camera_x = m * V3(1, 0, 0);
		game->camera_y = m * V3(0, 1, 0);
	}

    v3 rotation = {};

#if 1
	for (int z = 0; z < CUBES_HEIGHT; z++)
	{
		for (int x = 0; x < CUBES_WIDTH; x++)
		{
			v3 p = V3(x * 0.4, game->cubes_height[z][x] * 0.3, -z * 0.4) + cubes_offset;
			v3 color = lerp(V3(0.2, 0.8, 0.3), V3(0.1, 0.9, 0.7), game->cubes_height[z][x]);
    		draw_cube(game, p, rotation, 0.2, color);
		}
	}
#endif

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

		draw_triangle(game, v0, v1, v2, V3(0.5, 1, 1));
	}


	render_game(game);

	clock_gettime(CLOCK_MONOTONIC, &time_end);
	game->last_frame_time = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
    game->time += DT;
}
