#ifndef RENDERER_H
#define RENDERER_H

#include "math.h"
#include <immintrin.h>

#define MAX_TRIANGLE_COUNT (100000)
#define TILES_PER_WIDTH 8
#define TILES_PER_HEIGHT 8
#define TILES_COUNT (TILES_PER_WIDTH * TILES_PER_HEIGHT)
#define SAMPLES_PER_PIXEL (4)
#define BILINEAR_FILTERING 0

struct Plane
{
	v3 normal;
	float d;
};

struct Render_Context
{
	Texture buffer;
	Texture buffer_aa;
	float *zbuffer;
	float near_clip_plane;
	float far_clip_plane;
	v3 camera_p;
	m3x3 camera_rotation;
	m3x3 camera_inv_rotation;

	float fov;
	float film_width;
	float film_height;
	float left;
	float right;
	float top;
	float bottom;

	int max_triangle_count;
	Triangle *triangles;
	int triangle_count;
	int *triangles_per_tile[TILES_COUNT];
	int triangles_per_tile_count[TILES_COUNT];

	v2 samples_offset[SAMPLES_PER_PIXEL];


	v3 light_p;

	Plane clip_planes[5];
};

//void begin_render(Render_Context *r);
//
//void clear(Render_Context *r);
//
//void push_triangle(Render_Context *r, Triangle *triangle);
//void push_line(Render_Context *r, v3 p0, v3 p1, v3 color = V3(1, 1, 1), float thickness = 0.01f);
//void push_cube(Render_Context *r, v3 c, v3 u, v3 v, v3 w, v3 radius, v3 color, Texture *top = 0, Texture *sides = 0);
//
//void end_render(Render_Context *r);


#endif