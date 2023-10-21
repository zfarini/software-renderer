#ifndef GAME_H
#define GAME_H

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
#include <assert.h>

#define DT (1.f / 60)
#define PI 3.1415926535897932385
#define DEG_TO_RAD (PI / 180.0)

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

typedef struct 
{
	float e[3][3];
} m3x3;

typedef struct 
{
	v3 p0, p1, p2, normal, color;
} Triangle;

typedef struct
{
    int width;
    int height;
	uint32_t *pixels;

	int is_mouse_down;
	int prev_mouse_x;
	int prev_mouse_y;

	v3 P, dP, ddP;

	int triangle_count;
	Triangle *triangles;

	int should_quit;
	float last_frame_time;

	v3 camera_p, camera_rotation, camera_x, camera_y, camera_z;
	m3x3 camera_inv_rotation_mat;
	float fov;
	float near_clip_plane;
	float far_clip_plane;
	float film_width, film_height;
	float top, bottom, left, right;
	float *zbuffer;
	int is_initialized;
} Game;

#endif
