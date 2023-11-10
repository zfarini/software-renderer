#ifndef GAME_H
#define GAME_H

#include <math.h>
#include <stdio.h>
#include <float.h>
#include <limits.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <assert.h>
#include <stdalign.h>
#include <inttypes.h>


typedef int b32;

#include "arena.h"

#define DT (1.f / 60)
#define PI 3.1415926535897932385
#define DEG_TO_RAD (PI / 180.0)
#define ARRAY_LENGTH(arr) (sizeof(arr) / sizeof(*(arr)))

#include "math.h"

#define THREADS 1
#define CORE_COUNT (8)
#define THREAD_COUNT CORE_COUNT
#define CUBES_WIDTH 1
#define CUBES_HEIGHT 1

typedef struct ThreadWork ThreadWork;

#define THREAD_WORK_FUNC(func) void *func(ThreadWork *work)

typedef THREAD_WORK_FUNC(ThreadWorkCallbackFn);

#define KILOBYTES(x) (x * 1024)
#define MEGABYTES(x) (KILOBYTES(x) * 1024ULL)
#define GIGABYTES(x) (MEGABYTES(x) * 1024ULL)

struct String
{
	char *data;
	int len;
};

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
	v2 uv0, uv1, uv2;
    v3 n0, n1, n2;
	Texture *texture;
	v4 color;
	int no_lighthing;
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



struct GameMemory
{
	void *permanent_storage;
	size_t	permanent_storage_size;
	int	is_initialized;
};

struct GameButton
{
	int is_down;
	int was_down;
};

enum MouseButton
{
	MouseButton_Left,
	MouseButton_Middle,
	MouseButton_Right,
	MouseButton_Count
};

struct GameInput
{
	float	dt;

	GameButton mouse_buttons[MouseButton_Count];

	GameButton buttons[512];

	v2 prev_mouse_p;
	v2 mouse_p;
	v2 mouse_rel_dp;

	b32 mouse_relative_mode;

	float mouse_scroll;
};

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

	Render_Context *render_context;

    float text_dx, text_dy;

	volatile int next_thread_index;
	volatile int next_tile_index;
    volatile int tiles_finished;


	Arena frame_arena;
	Arena permanent_arena;
	Arena assets_arena;
	Arena renderer_arena;
	Arena scratch_arena;

	int render_zbuffer;
	int pause_game;
} Game;


typedef void GameUpdateAndRenderFn(Game *game);
typedef void *GameThreadWorkFn(void *);


#include "renderer.h"

Texture load_texture(Arena *arena, const char *filename);

struct TimedBlock;

struct TimedBlockData
{
	const char	*block_name;
    const char	*function_name;
    const char	*filename;
    uint64_t cycle_count;
    uint64_t childs_cycle_count;
    int calls_count;
    int line;
	uint64_t	last_timer;
};


// TODO: declare these last thing in the compilation unit and use __COUNTER as length
#define MAX_BLOCK_COUNT 256

TimedBlockData	timed_blocks1[THREAD_COUNT * MAX_BLOCK_COUNT];
TimedBlockData	timed_blocks2[THREAD_COUNT * MAX_BLOCK_COUNT];


TimedBlockData	*timed_blocks = (TimedBlockData *)timed_blocks1;

int timed_blocks_stack[THREAD_COUNT][MAX_BLOCK_COUNT];
int	timed_blocks_stack_count[THREAD_COUNT];


/*

	b1
		b2
			b3


*/

// TODO: display like average over last 120 frames
//
//
struct TimedBlock
{
	int bid;
	int	tid;

    TimedBlock(const char *block_name, int line, const char *function_name, const char *filename, int block_id, int thread_id = 0)
    {
		bid = block_id;
		tid = thread_id;

		TimedBlockData *d = &timed_blocks[tid * MAX_BLOCK_COUNT + bid];

		d->line = line;
		d->function_name = function_name;
        d->filename = filename;
		d->block_name = block_name;
		d->last_timer = __rdtsc();
		d->calls_count++;

		timed_blocks_stack[tid][timed_blocks_stack_count[tid]++] = bid;
    }

    ~TimedBlock()
    {
		TimedBlockData *d = &timed_blocks[tid * MAX_BLOCK_COUNT + bid];

		uint64_t cycle_count = __rdtsc() - d->last_timer;
		d->cycle_count += cycle_count;

		timed_blocks_stack_count[tid]--;
		if (timed_blocks_stack_count[tid])
			timed_blocks[tid * MAX_BLOCK_COUNT
				+ timed_blocks_stack[tid][timed_blocks_stack_count[tid] - 1]].childs_cycle_count += cycle_count;
    }
};


#define PROFILING 1

#if PROFILING
#define TIMED_THREAD_BLOCK(name, tid) TimedBlock _timed_block_##__LINE__(name, __LINE__, __FUNCTION__, __FILE__, __COUNTER__,tid)
#define TIMED_THREAD_FUNCTION(tid) TIMED_THREAD_BLOCK(__FUNCTION__, tid)

#define TIMED_BLOCK(name) TIMED_THREAD_BLOCK(name, 0)
#define TIMED_FUNCTION() TIMED_BLOCK(__FUNCTION__)

#else
#define TIMED_BLOCK(name)
#define TIMED_FUNCTION()
#define TIMED_THREAD_BLOCK(name, tid)
#define TIMED_THREAD_FUNCTION(tid)
#endif



#endif
