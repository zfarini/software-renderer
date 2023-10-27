#ifndef GAME_H
#define GAME_H

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


#define BILINEAR_FILTERING 0

#define MAX_SAMPLES_PER_PIXEL (32)
#define SAMPLES_PER_PIXEL (1)


#define THREADS 1

#define MAX_TRIANGLE_COUNT (100000)
#define TILES_PER_WIDTH 8
#define TILES_PER_HEIGHT 8
#define TILES_COUNT (TILES_PER_WIDTH * TILES_PER_HEIGHT)

#define CORE_COUNT (6)
#define CUBES_WIDTH 1
#define CUBES_HEIGHT 1

#define MAX_TRIANGLE_COUNT_PER_TILE (MAX_TRIANGLE_COUNT)


typedef struct ThreadWork ThreadWork;

#define THREAD_WORK_FUNC(func) void *func(ThreadWork *work)

typedef THREAD_WORK_FUNC(ThreadWorkCallbackFn);

struct alignas(16) ThreadWork
{
	uint8_t data[65536];
	

	ThreadWorkCallbackFn *callback;

	int index;
	volatile int finished;
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

	int triangle_count;
	int triangle_count2;
	Triangle *triangles;
	Triangle *triangles2;

	int should_quit;
	float last_frame_time;

	v3 camera_p, camera_rotation, camera_x, camera_y, camera_z;
	v3 camera_dp;
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
	int triangles_per_tile_count[TILES_COUNT];

	volatile int next_work_index;
	int real_work_count;
	volatile int work_count;
	ThreadWork *thread_work; // this should loop
	volatile int next_thread_index;

	v3 light_p;
	v3 light_dir;

	int shadow_map_width;
	int shadow_map_height;
	float shadow_map_left;
	float shadow_map_right;
	float shadow_map_top;
	float shadow_map_bottom;

	m3x3 light_inv_rot_matrix;
	float *shadow_map;

	Texture grass_tex;
	Texture grass_top_tex;
    Texture starwars_tex;
	Texture checkerboard_tex;
	Texture ground_tex;

	ThreadWork *curr_thread_work;


    Mesh cow_mesh;
    Mesh monkey_mesh;
    Mesh starwars_mesh;
	Mesh african_head_mesh;
	Texture african_head_tex;

    Mesh starwars_animation[116];
    float animation_time;

	int thread_kill_yourself;
} Game;


typedef void GameUpdateAndRenderFn(Game *game);
typedef void *GameThreadWorkFn(void *);


Texture load_texture(const char *filename);

#endif
