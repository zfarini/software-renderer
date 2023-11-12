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

#define KILOBYTES(x) (x * 1024)
#define MEGABYTES(x) (KILOBYTES(x) * 1024ULL)
#define GIGABYTES(x) (MEGABYTES(x) * 1024ULL)


#define MAX_BLOCK_COUNT 128
#define PROFILER_RECORD_FRAMES 120

struct ThreadInfo
{
	int	id;
	int	timed_blocks_stack[MAX_BLOCK_COUNT];
	int timed_blocks_stack_count;
	//char storage[KILOBYTES(64)];
};

thread_local ThreadInfo g_thread_info;


struct TimedBlock;

struct TimedBlockData
{
	const char	*block_name;
    const char	*function_name;
    const char	*filename;
    int line;
	int	block_id;

    int calls_count;
    uint64_t cycle_count;
    uint64_t childs_cycle_count;
};

//static_assert(sizeof(TimedBlockData) % 64 == 0, "should be aligned with a cache line");
// TODO: declare these last thing in the compilation unit and use __COUNTER as length

TimedBlockData	timed_blocks1[THREAD_COUNT * MAX_BLOCK_COUNT];
TimedBlockData	timed_blocks2[THREAD_COUNT * MAX_BLOCK_COUNT];


uint64_t block_cycle_sum[MAX_BLOCK_COUNT];

TimedBlockData	*timed_blocks = (TimedBlockData *)timed_blocks1;

struct TimedBlock
{
	int bid;
	int	tid;
	uint64_t start_rdtsc;

    TimedBlock(const char *block_name, int line, const char *function_name, const char *filename, int block_id)
    {
		bid = block_id;
		tid = g_thread_info.id;

		TimedBlockData *d = &timed_blocks[tid * MAX_BLOCK_COUNT + bid];

		d->block_id = bid;
		d->line = line;
		d->function_name = function_name;
        d->filename = filename;
		d->block_name = block_name;
		start_rdtsc = __rdtsc();
		d->calls_count++;

		g_thread_info.timed_blocks_stack[g_thread_info.timed_blocks_stack_count++] = bid;
    }

    ~TimedBlock()
    {
		uint64_t cycle_count = __rdtsc() - start_rdtsc;

		TimedBlockData *d = &timed_blocks[tid * MAX_BLOCK_COUNT + bid];

		d->cycle_count += cycle_count;

		int i = --g_thread_info.timed_blocks_stack_count;
		if (i)
			timed_blocks[tid * MAX_BLOCK_COUNT + g_thread_info.timed_blocks_stack[i - 1]].childs_cycle_count += cycle_count;
    }
};


#define PROFILING 1

#if PROFILING
#define TIMED_BLOCK(name) TimedBlock _timed_block_##__LINE__(name, __LINE__, __FUNCTION__, __FILE__, __COUNTER__)
#define TIMED_FUNCTION() TIMED_BLOCK(__FUNCTION__)

#else
#define TIMED_BLOCK(name)
#define TIMED_FUNCTION()
#endif


struct TimedBlockStat {
	double t_cycle_count[THREAD_COUNT];
	double t_childs_cycle_count[THREAD_COUNT];
	double t_calls_count[THREAD_COUNT];
	double t_cycles_per_call[THREAD_COUNT];

	double cycle_count;
	double childs_cycle_count;
	double calls_count;
	double cycles_per_call;

	int		block_id;
	TimedBlockData *data;
};



typedef struct ThreadWork ThreadWork;

#define THREAD_WORK_FUNC(func) void *func(ThreadWork *work)

typedef THREAD_WORK_FUNC(ThreadWorkCallbackFn);



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
	int	show_profiler;

	TimedBlockData timed_blocks_record[PROFILER_RECORD_FRAMES][THREAD_COUNT][MAX_BLOCK_COUNT];
	TimedBlockStat timed_blocks_stats[MAX_BLOCK_COUNT];
	int	curr_profiler_frame;
} Game;


typedef void GameUpdateAndRenderFn(Game *game);
typedef void *GameThreadWorkFn(void *);


#include "renderer.h"

Texture load_texture(Arena *arena, const char *filename);

#endif
