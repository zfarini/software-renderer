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

#define THREADS 0
#define CORE_COUNT (4)
#define CUBES_WIDTH 1
#define CUBES_HEIGHT 1

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




struct Render_Context;

typedef struct
{
    Texture framebuffer;

	int is_mouse_down;
	int prev_mouse_x;
	int prev_mouse_y;

	int should_quit;
	float last_frame_time;

	v3 camera_p, camera_rotation, camera_x, camera_y, camera_z;
	v3 camera_dp;
	m3x3 camera_inv_rotation_mat, camera_rotation_mat;

	int is_initialized;

    float cubes_height[CUBES_HEIGHT][CUBES_WIDTH];
    float time;

	float total_time;
	int frame;

	v3 light_p;

	Texture grass_tex;
	Texture grass_top_tex;
    Texture starwars_tex;
	Texture checkerboard_tex;
	Texture ground_tex;
	Texture gun_tex;

    Mesh cow_mesh;
    Mesh monkey_mesh;
    Mesh starwars_mesh;
	Mesh gun_mesh;
	Mesh african_head_mesh;
	Mesh map_mesh;
	Texture african_head_tex;

    Mesh starwars_animation[116];

	int thread_kill_yourself;

	int is_mouse_left_pressed;

	Render_Context *render_context;

	volatile int next_thread_index;
	volatile int next_tile_index;
    volatile int tiles_finished;
} Game;


typedef void GameUpdateAndRenderFn(Game *game);
typedef int GameThreadWorkFn(void *);


#include "renderer.h"

Texture load_texture(const char *filename);



#endif
