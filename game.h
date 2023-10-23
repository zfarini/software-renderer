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
#include <stdatomic.h>
#include <assert.h>
#include <stdalign.h>

#define internal static
#define DT (1.f / 60)
#define PI 3.1415926535897932385
#define DEG_TO_RAD (PI / 180.0)
#define ARRAY_LENGTH(arr) (sizeof(arr) / sizeof(*(arr)))

#include "math.h"


#define MAX_SAMPLES_PER_PIXEL (32)
#define SAMPLES_PER_PIXEL (1)

#define MAX_TRIANGLE_COUNT (6000000)
#define TILES_PER_WIDTH 32
#define TILES_PER_HEIGHT 32
#define TILES_COUNT (TILES_PER_WIDTH * TILES_PER_HEIGHT)

#define CORE_COUNT (8)
#define CUBES_WIDTH 20
#define CUBES_HEIGHT 20

#define MAX_TRIANGLE_COUNT_PER_TILE (MAX_TRIANGLE_COUNT)


typedef struct ThreadWork ThreadWork;

#define THREAD_WORK_FUNC(func) void *func(ThreadWork *work)

typedef THREAD_WORK_FUNC(ThreadWorkCallbackFn);

struct alignas(max_align_t) ThreadWork
{
	uint8_t data[65536];
	

	ThreadWorkCallbackFn *callback;

	int index;
	volatile _Atomic int finished;
};

struct Texture
{
	int width;
	int height;
	int pitch;
	uint32_t *pixels;
};

typedef struct 
{
	v3 p0, p1, p2;
    v3 n0, n1, n2;
	v2 uv0, uv1, uv2;
	Texture *texture;
	v3 color;
    // computed
	v3 screen_p0, screen_p1, screen_p2;
	int min_x, min_y, max_x, max_y;
} Triangle;


typedef struct
{
    Triangle *triangles;
    int triangle_count;
    v3 rotation;
    v3 position;
    v3 scale;
} Mesh;

typedef struct
{
    int width;
    int height;
	uint32_t *pixels;
	uint32_t *pixels_aa;

	int is_mouse_down;
	int prev_mouse_x;
	int prev_mouse_y;

	v3 P, dP, ddP;

	volatile _Atomic int triangle_count;
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

    float cubes_height[CUBES_HEIGHT][CUBES_WIDTH];
    float time;

	float total_time;
	int frame;

	int go_in, go_back;



	v2 samples_offset[MAX_SAMPLES_PER_PIXEL];


	int triangles_per_tile[TILES_COUNT][MAX_TRIANGLE_COUNT_PER_TILE];
	volatile _Atomic int triangles_per_tile_count[TILES_COUNT];

	volatile _Atomic int next_work_index;
	int real_work_count;
	volatile _Atomic int work_count;
	ThreadWork *thread_work; // this should loop
	volatile _Atomic int next_thread_index;

	Texture grass_tex;
	Texture grass_top_tex;
    Texture starwars_tex;

	ThreadWork *curr_thread_work;


    Mesh cow_mesh;
    Mesh monkey_mesh;
    Mesh starwars_mesh;

    Mesh starwars_animation[116];
    float animation_time;
} Game;


typedef void GameUpdateAndRenderFn(Game *game);
typedef void *GameThreadWorkFn(void *);

#endif
