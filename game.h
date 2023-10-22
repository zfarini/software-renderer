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

#define internal static
#define DT (1.f / 60)
#define PI 3.1415926535897932385
#define DEG_TO_RAD (PI / 180.0)
#define ARRAY_LENGTH(arr) (sizeof(arr) / sizeof(*(arr)))

#include "math.h"

typedef struct 
{
	v3 p0, p1, p2, color;
} Triangle;

#define CUBES_WIDTH 30
#define CUBES_HEIGHT 30


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
	m3x3 camera_inv_rotation_mat, camera_rotation_mat;
	float fov;
	float near_clip_plane;
	float far_clip_plane;
	float film_width, film_height;
	float top, bottom, left, right;
	float focal_length;
	float *zbuffer;
	int is_initialized;

    float cubes_height[CUBES_WIDTH][CUBES_HEIGHT];
    float time;
	int frame;

	int go_in, go_back;
} Game;


typedef void GameUpdateAndRenderFn(Game *game);

#endif
