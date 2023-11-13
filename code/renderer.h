#ifndef RENDERER_H
#define RENDERER_H

#include "game.h"
#include "math.h"
#include <immintrin.h>

#define TILES_PER_WIDTH 20
#define TILES_PER_HEIGHT 20
#define TILES_COUNT (TILES_PER_WIDTH * TILES_PER_HEIGHT)


#define SAMPLES_PER_PIXEL_DIM (2)

#define SAMPLES_PER_PIXEL (SAMPLES_PER_PIXEL_DIM * SAMPLES_PER_PIXEL_DIM)
#define BILINEAR_FILTERING 0

struct Plane
{
	v3 normal;
	f32 d;
};

struct Render_Text
{
	String string;
	v2 offset;
	f32 scale;
	v4 color;
};

struct Render_Context
{
	Texture buffer;
	Texture buffer_aa;
	f32 *zbuffer;
	f32 near_clip_plane;
	f32 far_clip_plane;
	v3 camera_p;
	m3x3 camera_rotation;
	m3x3 camera_inv_rotation;

	f32 fov;
	f32 film_width;
	f32 film_height;
	f32 left;
	f32 right;
	f32 top;
	f32 bottom;

	int max_triangle_count;
	Triangle *triangles;
	Triangle *triangles_2d;
	int triangle_count;
	int triangle_2d_count;
	int *triangles_per_tile[TILES_COUNT];
	int triangles_per_tile_count[TILES_COUNT];

	v2_8x samples_offset[SAMPLES_PER_PIXEL];


	v3 light_p;

	Plane clip_planes[5];

	Game *game;
	
	uint64_t counter;
	uint64_t avg_counter;
	int triangles_pushed;
	int triangles_rendered;

	Texture text_texture;
	f32 text_du;
	int first_char;
	int last_char;
	f32 char_height_over_width;
	
	Render_Text text[8192];
	int text_count;
	Arena *arena;


    int enable_clip_rect;
    v2 clip_rect_min;
    v2 clip_rect_max;
};

//void begin_render(Render_Context *r);
//
//void clear(Render_Context *r);
//
//void push_triangle(Render_Context *r, Triangle *triangle);
//void push_line(Render_Context *r, v3 p0, v3 p1, v3 color = V3(1, 1, 1), f32 thickness = 0.01f);
//void push_cube(Render_Context *r, v3 c, v3 u, v3 v, v3 w, v3 radius, v3 color, Texture *top = 0, Texture *sides = 0);
//
//void end_render(Render_Context *r);


#endif
