#include "mlx/mlx.h"
#include <math.h>
#include <stdio.h>
#include <float.h>
#include <limits.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>


typedef union 
{
    struct {float x, y, z;};
    struct {float r, g, b;};
    struct {float u, v, w;};
	float e[3];
} v3;

typedef struct
{
    float x, y;
} v2;

v3 V3(float x, float y, float z)
{
    return (v3){x, y, z};
}

v3 v3_add(v3 a, v3 b)
{
    return (v3){a.x + b.x, a.y + b.y, a.z + b.z};
}

v3 v3_sub(v3 a, v3 b)
{
    return (v3){a.x - b.x, a.y - b.y, a.z - b.z};
}

v3 v3_scale(v3 a, float b)
{
    return (v3){a.x * b, a.y * b, a.z * b};
}

float v3_dot(v3 a, v3 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

float v3_length(v3 a)
{
    return sqrtf(v3_dot(a, a));
}

v3 v3_lerp(v3 a, v3 b, float t)
{
	return (v3){
		a.x * (1 - t) + b.x * t,
		a.y * (1 - t) + b.y * t,
		a.z * (1 - t) + b.z * t
	};
}

v3 v3_noz(v3 a)
{
    float len = v3_length(a);

    if (len <= 0.00001f)
        return V3(0, 0, 0);
    return v3_scale(a, 1.f / len);
}

v3 v3_cross(v3 a, v3 b)
{
    return (v3){
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
    };
}

v2 V2(float x, float y)
{
    return (v2){x, y};
}

v2 v2_add(v2 a, v2 b)
{
    return (v2){a.x + b.x, a.y + b.y};
}

v2 v2_sub(v2 a, v2 b)
{
    return (v2){a.x - b.x, a.y - b.y};
}

typedef struct s_matrix
{
	float e[3][3];
} m3x3;

v3 m3x3_mul_vec(m3x3 m, v3 v)
{
	v3 res;

	for (int i = 0; i < 3; i++)
	{
		res.e[i] = 0;
		for (int j = 0; j < 3; j++)
			res.e[i] += m.e[i][j] * v.e[j];
	}
	return res;
}

m3x3 m3x3_mul(m3x3 a, m3x3 b)
{
    m3x3 res;

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
        {
            res.e[i][j] = 0;
            for (int k = 0; k < 3; k++)
                res.e[i][j] += a.e[i][k] * b.e[k][j];
        }
	}
	return res;
}

m3x3 m3x3_transpose(m3x3 m)
{
    m3x3 res;

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            res.e[i][j] = m.e[j][i];
    return res;
}

m3x3 x_rotation(float a)
{
	float c = cosf(a);
	float s = sinf(a);

	m3x3 m = {{
		1, 0, 0,
		0, c, -s,
		0, s, c
	}};

	return m;
}

m3x3 z_rotation(float a)
{
	float c = cosf(a);
	float s = sinf(a);

	m3x3 m = {{
		c, -s, 0,
		s, c, 0,
		0, 0, 1
	}};

	return m;
}

m3x3 y_rotation(float a)
{
	float c = cosf(a);
	float s = sinf(a);

	m3x3 m = {{
		c, 0, s,
		0, 1, 0,
		-s, 0, c
	}};

	return m;
}

v3 v3_rotate(v3 v, v3 rot)
{
	v = m3x3_mul_vec(x_rotation(rot.x), v);
	v = m3x3_mul_vec(y_rotation(rot.y), v);
	v = m3x3_mul_vec(z_rotation(rot.z), v);
	return v;
}


typedef struct
{
    int width;
    int height;
    void *mlx;
    void *win;
    // image
    void *img;
    char *addr;
    int bits_per_pixel;
    int line_length;
    int endian;

	int is_mouse_down;
	int prev_mouse_x;
	int prev_mouse_y;

	v3 P, dP, ddP;

} Win;


#define PI 3.1415926535897932385

#define DEG_TO_RAD (PI / 180.0)

Win *window;
v3 camera_p, camera_rotation;
m3x3 camera_inv_rotation_mat;
v3 camera_x, camera_y, camera_z;

float near_clip_plane = 0.6;
float far_clip_plane = 1000;
float fov = 65;
float width, height, top, bottom, left, right;
int first_frame = 1;
float *zbuffer;
v3 light_p;

enum KeyCodes
{
#ifdef __APPLE__
	KEYCODE_SPACE = 49,
	KEYCODE_W = 13,
	KEYCODE_A = 0,
	KEYCODE_D = 2,
	KEYCODE_S = 1,
    KEYCODE_Q = 12,
    KEYCODE_E = 14,

	KEYCODE_LEFT = 123,
	KEYCODE_RIGHT = 124,
	KEYCODE_UP = 126,
	KEYCODE_DOWN = 125,

	KEYCODE_ESCAPE = 53,
#else
	KEYCODE_SPACE = 32,
	KEYCODE_W = 119,
	KEYCODE_A = 97,
	KEYCODE_D = 100,
	KEYCODE_S = 115,
	KEYCODE_Q = 113,
	KEYCODE_E = 101,

	KEYCODE_LEFT = 65361,
	KEYCODE_RIGHT = 65363,
	KEYCODE_UP = 65362,
	KEYCODE_DOWN = 65364,

	KEYCODE_ESCAPE = 65307,
#endif
};

int on_mouse_down(int button, int x, int y, void *ptr)
{
	window->is_mouse_down = 1;
	window->prev_mouse_x = x;
	window->prev_mouse_y = y;
	return (0);
}

int on_mouse_up(int button, int x, int y, void *ptr)
{
	window->is_mouse_down = 0;
	return (0);
}

int on_mouse_movement(int x, int y, void *ptr)
{
	if (!window->is_mouse_down)
		return (0);

	float dx = (x - window->prev_mouse_x);
	float dy = (y - window->prev_mouse_y);

	camera_rotation.y += dx * (PI * 0.1f) * (fabsf(dx) / window->width);
	camera_rotation.x += dy * (PI * 0.1f) * (fabsf(dy) / window->height);

	window->prev_mouse_x = x;
	window->prev_mouse_y = y;
	return (0);
}

int	on_key_down(int keycode, void *ptr)
{
	printf("key down %d\n", keycode);

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
		window->ddP = v3_add(window->ddP, V3(-1, 0, 0));
	else if (keycode == KEYCODE_RIGHT)
		window->ddP = v3_add(window->ddP, V3(1, 0, 0));
	else if (keycode == KEYCODE_UP)
		window->ddP = v3_add(window->ddP, V3(0, 0, -1));
	else if (keycode == KEYCODE_DOWN)
		window->ddP = v3_add(window->ddP, V3(0, 0, 1));


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


	res.x = (res.x + 1) * 0.5f * window->width;
	res.y = (1 - res.y) * 0.5f * window->height;
	res.z  = -p.z;


    return res;
}

v3 get_barycentic_coordinates(v3 p0, v3 p1, v3 p2, v3 p)
{
    p = v3_sub(p, p0);

    v3 u = v3_sub(p1, p0);
    v3 v = v3_sub(p2, p0);

    float det = u.x * v.y - v.x * u.y;

    if (fabsf(det) < 0.00001f)
        return (v3){-1, -1, -1};
    det = 1.0f / det;

    float alpha = p.x * v.y * det + p.y * (-v.x) * det;
    float beta = p.x * (-u.y) * det + p.y * u.x * det;

    if (alpha < 0 || beta < 0 || alpha > 1 || beta > 1 || alpha + beta > 1)
        return (v3){-1, -1, -1};
    return (v3){alpha, beta, 1 - (alpha + beta)}; 
}

void draw_triangle(Win *win, v3 tp0, v3 tp1, v3 tp2, v3 color)
{
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
    int max_x = ceilf(box_max.x) + 1;
    int min_y = floorf(box_min.y);
    int max_y = ceilf(box_max.y) + 1;

    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > win->width) max_x = win->width;
    if (max_y > win->height) max_y = win->height;

	if (min_x >= max_x || min_y >= max_y)
		return ;

 	v3 u = v3_sub(p1, p0);
 	v3 v = v3_sub(p2, p0);
 	float det = u.x * v.y - v.x * u.y;

 	if (fabsf(det) < 0.0001f)
 		return;
	det = 1 / det;

	v3 normal = (v3_cross(v3_sub(tp1, tp0), v3_sub(tp2, tp0)));


	//TODO: stupid hack
	{
		float area = v3_length(v3_cross(v3_sub(p1, p0), v3_sub(p2, p0))) * 0.5f;

		if (area > 100000)
			return ;
	}

	normal = v3_noz(normal);

	if (v3_dot(normal, v3_sub(tp0, camera_p)) >= 0)
		return ;


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


				if (z >= near_clip_plane && z < zbuffer[y * win->width + x])
				{
					zbuffer[y * win->width + x] = z;

					v3 c = color;
					float light = fmax(0, v3_dot(v3_noz(v3_sub(light_p, p)), normal));
				//	light = 1;

					 c = v3_scale(color, light);

                	uint32_t color32 = ((uint32_t)(c.r * 255 + 0.5f) << 16) |
                	        ((uint32_t)(c.g * 255 + 0.5f) << 8) |
                	        ((uint32_t)(c.b * 255 + 0.5f) << 0);

                	uint32_t *pixel = (uint32_t *)win->addr + y * win->width + x;

                	*pixel = color32;
				}

            }
        }
    }
}

void draw_cube(Win *win, v3 c, v3 rotation, float radius, v3 color)
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

	v3 colors[6] = {
		{.8, .2, .1},
		{.1, .7, .3},
		{.2, .2, .75},
		{.6, .6, .6},
		{.7, .7, .2},
		{.1, .7, .8},
	};

    int n = sizeof(triangles) / sizeof(*triangles);

    for (int i = 0; i < n; i++)
    {

		v3 c = colors[i / 2];
		c = color;

		//if (i % 2)
		//	c = v3_scale(c, 0.5f);
        draw_triangle(win, triangles[i][0], triangles[i][1], triangles[i][2], c);
    }

}
#define CUBES_WIDTH 10
#define CUBES_HEIGHT 10

float cubes_height[CUBES_WIDTH][CUBES_HEIGHT];

int draw(void *ptr)
{
	struct timespec time_start, time_end;
	clock_gettime(CLOCK_MONOTONIC, &time_start);

    Win *win = ptr;
	
	v3 cubes_offset = {-2, -1, -3};

    if (first_frame)
    {
		win->P = v3_add(cubes_offset, V3(.1, .4, .1));

        camera_p = (v3){0, 3, 3};
		camera_rotation.x = -PI / 6;

        width = tan((fov*0.5f) * DEG_TO_RAD) * 2 * near_clip_plane;
        height = width * ((float)win->height / win->width);
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

	v3 ddP = v3_add(v3_scale(win->ddP, 10), v3_scale(win->dP, -1));

	win->P = v3_add(win->P, v3_add(v3_scale(ddP, 0.5f * dt * dt), v3_scale(win->dP, dt)));
	win->dP = v3_add(win->dP, v3_scale(ddP, dt));

	win->ddP = (v3){};

    memset(win->addr, 0, win->width * win->height * 4);

    for (int y = 0; y < win->height; y++)
    {
        for (int x = 0; x < win->width; x++)
        {
            zbuffer[y * win->width + x] = far_clip_plane;

            uint32_t *pixel = (uint32_t *)win->addr + y * win->width + x;
			*pixel = 0x0087ceeb;
        }
    }

    static float a = 0;
    a += 0.01f;


	light_p = V3(1, 4, -3);

    v3 rotation = {};

#if 1
	for (int z = 0; z < CUBES_HEIGHT; z++)
	{
		for (int x = 0; x < CUBES_WIDTH; x++)
		{
			v3 p = {x * 0.4, cubes_height[z][x] * 0.01, -z * 0.4};
			p = v3_add(p, cubes_offset);
			v3 color = (x + z) % 2 ? V3(0.8, 0.7, 0.6) : V3(0.2, 0.4, 0.3);

			color = v3_lerp(V3(0.2, 0.8, 0.3), V3(0.1, 0.9, 0.7), cubes_height[z][x]);
	//		color = V3(cubes_height[z][x],cubes_height[z][x],cubes_height[z][x]);
    		draw_cube(win, p, rotation, 0.2, color);
		}
	}
#endif
    draw_cube(win, win->P, V3(0, 0, 0), .1, V3(1, 1, 1));


    mlx_put_image_to_window(win->mlx, win->win, win->img, 0, 0);
	clock_gettime(CLOCK_MONOTONIC, &time_end);
	double t = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
	
	printf("%fms\n", t);

    return 0;
}

int main(void)
{
    Win win = {};

    window = &win;
    win.width = 1280;
    win.height = 720;
    
    zbuffer = malloc(win.width * win.height * sizeof(float));

    win.mlx = mlx_init();
    win.win = mlx_new_window(win.mlx, win.width, win.height, "Mini Raytracer");
    win.img = mlx_new_image(win.mlx, win.width, win.height);
    win.addr = mlx_get_data_addr(win.img, &win.bits_per_pixel, &win.line_length, &win.endian);

	unsigned mouse_mask	= (1 << 15) | (1 << 0) | (1 << 2) | (1 << 19) | (1 << 3) | (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) | (1 << 8) | (1 << 16) | (1 << 23);
	mlx_hook(win.win, 2, 2, on_key_down, 0);
	mlx_hook(win.win, 3, 3, on_key_up, 0);
	mlx_hook(win.win, 4, mouse_mask, on_mouse_down, 0);
	mlx_hook(win.win, 5, mouse_mask, on_mouse_up, 0);
	mlx_hook(win.win, 6, mouse_mask, on_mouse_movement, 0);
    mlx_loop_hook(win.mlx, draw, &win);
    //mlx_key_hook(win.win, listen, &win);
    mlx_loop(win.mlx);
}
