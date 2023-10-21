#include "game.h"
#include "math.c"
#include "cow.h"

Game *game;
v3 camera_p, camera_rotation;
m3x3 camera_inv_rotation_mat;
v3 camera_x, camera_y, camera_z;

float near_clip_plane = 0.1;
float far_clip_plane = 1000;
float fov = 65;
float width, height, top, bottom, left, right;
int first_frame = 1;
float *zbuffer;
v3 light_p;



int on_mouse_down(int button, int x, int y, void *ptr)
{
	game->is_mouse_down = 1;
	game->prev_mouse_x = x;
	game->prev_mouse_y = y;
	return (0);
}

int on_mouse_up(int button, int x, int y, void *ptr)
{
	game->is_mouse_down = 0;
	return (0);
}

int on_mouse_movement(int x, int y, void *ptr)
{
	if (!game->is_mouse_down)
		return (0);

	float dx = (x - game->prev_mouse_x);
	float dy = (y - game->prev_mouse_y);

	camera_rotation.y += dx * (PI * 0.1f) * (fabsf(dx) / game->width);
	camera_rotation.x += dy * (PI * 0.1f) * (fabsf(dy) / game->height);

	game->prev_mouse_x = x;
	game->prev_mouse_y = y;
	return (0);
}

int	on_key_down(int keycode, void *ptr)
{
	if (keycode == 65307)
		exit(0);

	float dx = 0.1f;
	
	if (keycode == KEYCODE_W)
		camera_p = v3_add(camera_p, v3_scale(camera_z, +dx));
	else if (keycode == KEYCODE_A)
		camera_p = v3_add(camera_p, v3_scale(camera_x, -dx));
	else if (keycode == KEYCODE_S)
		camera_p = v3_add(camera_p, v3_scale(camera_z, -dx));
	else if (keycode == KEYCODE_D)
		camera_p = v3_add(camera_p, v3_scale(camera_x, +dx));
	else if (keycode == KEYCODE_Q)
		camera_p = v3_add(camera_p, v3_scale(camera_y, +dx));
	else if (keycode == KEYCODE_E)
		camera_p = v3_add(camera_p, v3_scale(camera_y, -dx));
	else if (keycode == KEYCODE_LEFT)
		game->ddP = v3_add(game->ddP, V3(-1, 0, 0));
	else if (keycode == KEYCODE_RIGHT)
		game->ddP = v3_add(game->ddP, V3(1, 0, 0));
	else if (keycode == KEYCODE_UP)
		game->ddP = v3_add(game->ddP, V3(0, 0, -1));
	else if (keycode == KEYCODE_DOWN)
		game->ddP = v3_add(game->ddP, V3(0, 0, 1));


	return (0);
}

int on_key_up(int keycode, void *ptr)
{
	//printf("key up %d\n", keycode);
	return (0);
}

v3 project_to_screen(v3 p)
{

	p = v3_sub(p, camera_p);

	p = m3x3_mul_vec(camera_inv_rotation_mat, p);

    v3 res;

	
    res.x = -(near_clip_plane * p.x) / p.z;
    res.y = -(near_clip_plane * p.y) / p.z;

    res.x = 2 * res.x / (right - left) - (right + left) / (right - left);
	res.y = 2 * res.y / (top - bottom) - (top + bottom) / (top - bottom);


	res.x = (res.x + 1) * 0.5f * game->width;
	res.y = (1 - res.y) * 0.5f * game->height;
	res.z  = -p.z;


    return res;
}

void draw_triangle(Game *game, v3 tp0, v3 tp1, v3 tp2, v3 color)
{
	v3 normal = v3_noz(v3_cross(v3_sub(tp1, tp0), v3_sub(tp2, tp0)));

	if (v3_dot(normal, v3_sub(tp0, camera_p)) >= 0)
		return ;
	
    v3 p0 = project_to_screen(tp0);
    v3 p1 = project_to_screen(tp1);
    v3 p2 = project_to_screen(tp2);

	//printf("0:%f %f %f\n", p0.x, p0.y, p0.z);
	//printf("1:%f %f %f\n", p1.x, p1.y, p1.z);
	//printf("2:%f %f %f\n", p2.x, p2.y, p2.z);

	if (p0.z < near_clip_plane && p1.z < near_clip_plane && p2.z < near_clip_plane)
		return ;

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
		return ;

 	v3 u = v3_sub(p1, p0);
 	v3 v = v3_sub(p2, p0);
 	float det = u.x * v.y - v.x * u.y;

 	if (fabsf(det) < 0.0001f)
 		return;
	det = 1 / det;


	//TODO: stupid hack
	{
		float area = v3_length(v3_cross(v3_sub(p1, p0), v3_sub(p2, p0))) * 0.5f;

		if (area > 100000)
			return ;
	}

    for (int y = min_y; y < max_y; y++)
    {
        for (int x = min_x; x < max_x; x++)

        {
		
			v3 b;
			{
 			   v3 p = v3_sub((v3){x + 0.5f, y + 0.5f, 0}, p0);

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
            	v3 p = v3_add(v3_scale(tp0, b.w), v3_add(v3_scale(tp1, b.u), v3_scale(tp2, b.v)));
				// this is equal to -p.z
				float z = p0.z * b.w + p1.z * b.u + p2.z * b.v;


				if (z >= near_clip_plane && z < zbuffer[y * game->width + x])
				{
					zbuffer[y * game->width + x] = z;

					v3 c = color;
					float light = fmax(0, v3_dot(v3_noz(v3_sub(light_p, p)), normal));

					light = fmax(0, v3_dot(v3_noz(v3_sub(camera_p, p)), normal));
					//light = 1;

					 c = v3_scale(color, light);

                	uint32_t color32 = ((uint32_t)(c.r * 255 + 0.5f) << 16) |
                	        ((uint32_t)(c.g * 255 + 0.5f) << 8) |
                	        ((uint32_t)(c.b * 255 + 0.5f) << 0);

                	uint32_t *pixel = (uint32_t *)game->addr + y * game->width + x;

                	*pixel = color32;
				}

            }
        }
    }
}

void draw_cube(Game *game, v3 c, v3 rotation, float radius, v3 color)
{
	v3 u = v3_rotate(V3(1, 0, 0), rotation);
	v3 v = v3_rotate(V3(0, 1, 0), rotation);
	v3 w = v3_rotate(V3(0, 0, 1), rotation);

    u = v3_scale(v3_noz(u), radius);
    v = v3_scale(v3_noz(v), radius);
    w = v3_scale(v3_noz(w), radius);

    v3 p00 = v3_add(c, v3_add(v3_scale(u, -1), v3_add(v3_scale(v, -1), v3_scale(w, +1))));//c - u - v - w;
    v3 p01 = v3_add(c, v3_add(v3_scale(u, +1), v3_add(v3_scale(v, -1), v3_scale(w, +1))));//c + u - v - w;
    v3 p02 = v3_add(c, v3_add(v3_scale(u, +1), v3_add(v3_scale(v, +1), v3_scale(w, +1))));//c + u + v - w;
    v3 p03 = v3_add(c, v3_add(v3_scale(u, -1), v3_add(v3_scale(v, +1), v3_scale(w, +1))));//c - u + v - w;
    v3 p10 = v3_add(c, v3_add(v3_scale(u, -1), v3_add(v3_scale(v, -1), v3_scale(w, -1))));//c - u - v + w;
    v3 p11 = v3_add(c, v3_add(v3_scale(u, +1), v3_add(v3_scale(v, -1), v3_scale(w, -1))));//c + u - v + w;
    v3 p12 = v3_add(c, v3_add(v3_scale(u, +1), v3_add(v3_scale(v, +1), v3_scale(w, -1))));//c + u + v + w;
    v3 p13 = v3_add(c, v3_add(v3_scale(u, -1), v3_add(v3_scale(v, +1), v3_scale(w, -1))));//c - u + v + w;

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

#define CUBES_WIDTH 10
#define CUBES_HEIGHT 10

float cubes_height[CUBES_WIDTH][CUBES_HEIGHT];

int game_loop(void *ptr)
{
	struct timespec time_start, time_end;
	clock_gettime(CLOCK_MONOTONIC, &time_start);

    Game *game = ptr;
	
	v3 cubes_offset = {-2, -1, -3};

    if (first_frame)
    {
		game->P = v3_add(cubes_offset, V3(.1, .4, .1));

        camera_p = (v3){0, 1, 8};
		camera_rotation.x = 0;

        width = tan((fov*0.5f) * DEG_TO_RAD) * 2 * near_clip_plane;
        height = width * ((float)game->height / game->width);
		top = height * 0.5f;
		right = width * 0.5f;
		bottom = -top;
		left = -right;

		srand(1235);

		for (int i = 0; i < CUBES_WIDTH; i++)
		{
			for (int j = 0; j < CUBES_HEIGHT; j++)
			{
				cubes_height[i][j] = (float)rand() / RAND_MAX;
			}
		}
        first_frame = 0;
    }
	{
		camera_inv_rotation_mat = m3x3_mul(x_rotation(-camera_rotation.x), 
						m3x3_mul(y_rotation(-camera_rotation.y), z_rotation(-camera_rotation.z)));
		m3x3 m = m3x3_mul(z_rotation(camera_rotation.z), 
						m3x3_mul(y_rotation(camera_rotation.y), x_rotation(camera_rotation.x)));
		camera_z = m3x3_mul_vec(m, V3(0, 0, -1));
		camera_x = m3x3_mul_vec(m, V3(1, 0, 0));
		camera_y = m3x3_mul_vec(m, V3(0, 1, 0));
	}


	float dt = 1.0 / 60;

	v3 ddP = v3_add(v3_scale(game->ddP, 10), v3_scale(game->dP, -1));

	game->P = v3_add(game->P, v3_add(v3_scale(ddP, 0.5f * dt * dt), v3_scale(game->dP, dt)));
	game->dP = v3_add(game->dP, v3_scale(ddP, dt));

	game->ddP = (v3){};

    memset(game->addr, 0, game->width * game->height * 4);

    for (int y = 0; y < game->height; y++)
    {
        for (int x = 0; x < game->width; x++)
        {
            zbuffer[y * game->width + x] = far_clip_plane;

            uint32_t *pixel = (uint32_t *)game->addr + y * game->width + x;
			*pixel = 0x0087ceeb;
        }
    }

    static float a = 0;
    a += 0.01f;


	light_p = V3(1, 1, 0);

    v3 rotation = {};

#if 1
	for (int z = 0; z < CUBES_HEIGHT; z++)
	{
		for (int x = 0; x < CUBES_WIDTH; x++)
		{
			v3 p = {x * 0.4, cubes_height[z][x] * 0.3, -z * 0.4};
			p = v3_add(p, cubes_offset);
			v3 color = (x + z) % 2 ? V3(0.8, 0.7, 0.6) : V3(0.2, 0.4, 0.3);

			color = v3_lerp(V3(0.2, 0.8, 0.3), V3(0.1, 0.9, 0.7), cubes_height[z][x]);
	//		color = V3(cubes_height[z][x],cubes_height[z][x],cubes_height[z][x]);
    		draw_cube(game, p, rotation, 0.2, color);
		}
	}
#endif
    draw_cube(game, game->P, V3(0, 0, 0), .1, V3(1, 1, 1));

	rotation = V3(a, a, a);
	for (int i = 0; i < ntris; i++)
	{
		v3 v0 = vertices[nvertices[i * 3]];
		v3 v1 = vertices[nvertices[i * 3 + 1]];
		v3 v2 = vertices[nvertices[i * 3 + 2]];

		v0 = v3_rotate(v0, rotation);
		v1 = v3_rotate(v1, rotation);
		v2 = v3_rotate(v2, rotation);

		v0 = v3_scale(v0, 0.25);
		v1 = v3_scale(v1, 0.25);
		v2 = v3_scale(v2, 0.25);

		draw_triangle(game, v0, v1, v2, V3(1, 1, 1));
	}


    mlx_put_image_to_window(game->mlx, game->window, game->img, 0, 0);
	clock_gettime(CLOCK_MONOTONIC, &time_end);
	double t = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
	
	printf("%fms\n", t);

    return 0;
}

int main(void)
{
    Game _game = {};

    game = &_game;
	
    game->width = 1280;
    game->height = 720;
    
    zbuffer = malloc(game->width * game->height * sizeof(float));

    game->mlx = mlx_init();
    game->window = mlx_new_window(game->mlx, game->width, game->height, "test");
    game->img = mlx_new_image(game->mlx, game->width, game->height);

	int bits_per_pixel, endian, line_length;
    game->addr = mlx_get_data_addr(game->img, &bits_per_pixel, &line_length, &endian);

	unsigned mouse_mask	= (1 << 15) | (1 << 0) | (1 << 2) | (1 << 19) | (1 << 3) | (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 8) | (1 << 16) | (1 << 23);
	mlx_hook(game->window, 2, 2, on_key_down, game);
	mlx_hook(game->window, 3, 3, on_key_up, game);
	mlx_hook(game->window, 4, mouse_mask, on_mouse_down, game);
	mlx_hook(game->window, 5, mouse_mask, on_mouse_up, game);
	mlx_hook(game->window, 6, mouse_mask, on_mouse_movement, game);
    mlx_loop_hook(game->mlx, game_loop, game);
    mlx_loop(game->mlx);
}
