/*TODO: 

- SRGB

- read about deferred rendering
- premultiplied alpha
*/

#include "renderer.h"
#include "game.h"

Render_Context new_render_context(Arena *arena, Game *game, Texture framebuffer, float near_clip_plane, float far_clip_plane,
		float fov, int max_triangle_count)
{
	Render_Context r {};

	r.arena = arena;
	r.game = game;

	r.buffer = framebuffer;
	r.buffer_aa.width = r.buffer.width * SAMPLES_PER_PIXEL;
	r.buffer_aa.pitch = r.buffer_aa.width;
	r.buffer_aa.height = r.buffer.height;
	r.buffer_aa.pixels = push_array(r.arena, uint32_t, r.buffer_aa.width * r.buffer_aa.height, arena_align(32));

	r.zbuffer = push_array(r.arena, float, r.buffer_aa.width * r.buffer_aa.height, arena_align(32));

	r.fov = fov;
	r.near_clip_plane = near_clip_plane;
	r.far_clip_plane = far_clip_plane;
	r.triangles = push_array(r.arena, Triangle, max_triangle_count);
	r.triangles_2d = push_array(r.arena, Triangle, 100000);

	assert(r.buffer_aa.pixels && r.triangles);

	r.film_width = tan(fov*0.5f* DEG_TO_RAD) * 2 * r.near_clip_plane;
	r.film_height = r.film_width * ((float)r.buffer.height / r.buffer.width);
	r.top = r.film_height * 0.5f;
	r.right = r.film_width * 0.5f;
	r.bottom = -r.top;
	r.left = -r.right;

	for (int i = 0; i < TILES_COUNT; i++)
		r.triangles_per_tile[i] = push_array(r.arena, int, max_triangle_count);

	r.clip_planes[0] = {{0, 0, -1}, -r.near_clip_plane}; // front
	r.clip_planes[1] = {cross(V3(r.left, r.bottom, -r.near_clip_plane),
				   V3(r.left, r.top, -r.near_clip_plane)), 0}; // left
	r.clip_planes[2] = {cross(V3(r.right, r.top, -r.near_clip_plane),
				   V3(r.right, r.bottom, -r.near_clip_plane)), 0}; // right
	r.clip_planes[3] = {cross(V3(r.left, r.top, -r.near_clip_plane),
				V3(r.right, r.top, -r.near_clip_plane)), 0}; // top
	r.clip_planes[4] = {cross(V3(r.right, r.bottom, -r.near_clip_plane),
					   V3(r.left, r.bottom, -r.near_clip_plane)), 0}; // bottom
	for (int i = 0; i < ARRAY_LENGTH(r.clip_planes); i++)
		r.clip_planes[i].normal = noz(r.clip_planes[i].normal);

	r.max_triangle_count = max_triangle_count;

    int samples_per_dim = SAMPLES_PER_PIXEL_DIM;

    v2 samples_offset[SAMPLES_PER_PIXEL];

	for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
	{
		if (SAMPLES_PER_PIXEL == 1)
			samples_offset[sample] = V2(0.5f, 0.5f);
		else
			samples_offset[sample] = V2((sample % samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2),
						(sample / samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2));
	}

    for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
    {
        alignas(32) float vx[LANE_WIDTH];
        alignas(32) float vy[LANE_WIDTH];

        for (int j = 0; j < LANE_WIDTH; j++)
        {
            vx[j] = samples_offset[(sample + j) % SAMPLES_PER_PIXEL].x;
            vy[j] = samples_offset[(sample + j) % SAMPLES_PER_PIXEL].y;
        }
        r.samples_offset[sample].x.v = _mm256_load_ps(vx);
        r.samples_offset[sample].y.v = _mm256_load_ps(vy);
    }
	return r;
}

uint32_t color_v3_to_u32(v3 c)
{
	return ((uint32_t)(c.r * 255 + 0.5f) << 24) |
		   ((uint32_t)(c.g * 255 + 0.5f) << 16) |
		   ((uint32_t)(c.b * 255 + 0.5f) << 8);
}


uint32_t color_v4_to_u32(v4 c)
{
	return ((uint32_t)(c.r * 255 + 0.5f) << 24) |
		   ((uint32_t)(c.g * 255 + 0.5f) << 16) |
		   ((uint32_t)(c.b * 255 + 0.5f) << 8) |
		   ((uint32_t)(c.a * 255 + 0.5f) << 0);
}

v3 color_u32_to_v3(uint32_t color)
{
	return V3((color >> 24) & 0xFF,
			  (color >> 16) & 0xFF,
			  (color >> 8) & 0xFF) * (1.f / 255);
}

void begin_render(Render_Context *r, v3 camera_p, m3x3 camera_rotation, v3 background, v3 light_p)
{
	uint32_t color32 = color_v3_to_u32(background);
	__m256i bg = _mm256_set1_epi32(color32);
	__m256 z = _mm256_set1_ps(r->far_clip_plane);

	for (int i = 0; i < r->buffer_aa.width * r->buffer_aa.height; i += 8)
	{
		_mm256_store_ps((r->zbuffer + i), z);
		_mm256_store_si256((__m256i *)(r->buffer_aa.pixels + i), bg);
	}

	r->triangle_count = 0;
	for (int i = 0; i < TILES_COUNT; i++)
		r->triangles_per_tile_count[i] = 0;

	r->triangle_2d_count = 0;

	r->camera_p = camera_p;
	r->camera_rotation = camera_rotation;
	r->camera_inv_rotation = transpose(r->camera_rotation);
	r->light_p = light_p;
	r->counter = 0;
	r->triangles_pushed = 0;
	r->triangles_rendered = 0;
	r->text_count = 0;
}

v3 world_to_camera(Render_Context *r, v3 p)
{
	return r->camera_inv_rotation * (p - r->camera_p);
}

v3 camera_to_world(Render_Context *r, v3 p)
{
	return r->camera_rotation * p + r->camera_p;
}

v3 prespective_projection(Render_Context *r, v3 p)
{
    v3 res;
	
    res.x = -(r->near_clip_plane * p.x) / p.z;
    res.y = -(r->near_clip_plane * p.y) / p.z;

    res.x = 2 * res.x / r->film_width;
	res.y = 2 * res.y / r->film_height;

	res.x = (res.x + 1) * 0.5f * r->buffer.width;
	res.y = (1 - res.y) * 0.5f * r->buffer.height;
	res.z  = -1.f / p.z;

    return res;
}

void get_tile_clip_bounds(Render_Context *r, int index, v2 &min_clip, v2 &max_clip)
{
	int min_x = (index % TILES_PER_WIDTH) * (r->buffer.width / TILES_PER_WIDTH);
	int min_y = (index / TILES_PER_WIDTH) * (r->buffer.height / TILES_PER_HEIGHT);

	int max_x = min_x + r->buffer.width / TILES_PER_WIDTH;
	int max_y = min_y + r->buffer.height / TILES_PER_HEIGHT;

	min_clip = V2(min_x, min_y);
	max_clip = V2(max_x, max_y);
}

void push_triangle(Render_Context *r, Triangle *triangle)
{
	TIMED_FUNCTION();

	// TODO: this is somehow was bigger than 16 at some point idk if its a bug?
	Triangle triangles[(1 << 5)];
	int triangle_count = 1;
	Triangle new_triangles[(1 << 5)];

	triangles[0] = *triangle;
	triangles[0].p0 = world_to_camera(r, triangle->p0);
	triangles[0].p1 = world_to_camera(r, triangle->p1);
	triangles[0].p2 = world_to_camera(r, triangle->p2);

#if 1
	if (!triangle->is_2d)
	{
		v3 n = cross(triangles[0].p1 - triangles[0].p0, triangles[0].p2 - triangles[0].p0);

		// TODO: why does this work
		if (dot(n, triangles[0].p0) > 0)
			return ;
	}
#endif

	for (int i = 0; i < ARRAY_LENGTH(r->clip_planes) && triangle_count && !triangle->is_2d; i++)
	{
		int new_triangle_count = 0;
		for (int j = 0; j < triangle_count; j++)
		{

			Triangle *triangle = &triangles[j];

			v3 cp0 = triangle->p0, cp1 = triangle->p1, cp2 = triangle->p2;

			int d0 = -dot(cp0, r->clip_planes[i].normal) > r->clip_planes[i].d;
			int d1 = -dot(cp1, r->clip_planes[i].normal) > r->clip_planes[i].d;
			int d2 = -dot(cp2, r->clip_planes[i].normal) > r->clip_planes[i].d;
	
			if (d0 + d1 + d2 == 0)
				new_triangles[new_triangle_count++] = *triangle;
			else if (d0 + d1 + d2 != 3)
			{
				/*
					p0        p1

					---x0----x1-- (clip plane)
							
					 	   p2
				*/
				int clip_up = (d0 + d1 + d2) == 2;

				v3 p0 = cp0, p1 = cp1, p2 = cp2;
				v2 uv0 = triangle->uv0, uv1 = triangle->uv1, uv2 = triangle->uv2;
				v3 n0 = triangle->n0, n1 = triangle->n1, n2 = triangle->n2;

				int swp = 0;

				if ((clip_up && !d0) || (!clip_up && d0))
					swap(p0, p2), swap(uv0, uv2), swap(n0, n2), swp = 1;
				else if ((clip_up && !d1) || (!clip_up && d1))
					swap(p1, p2), swap(uv1, uv2), swap(n1, n2), swp = 2;

				v3 x0 = p2 + ((-r->clip_planes[i].d - dot(p2, r->clip_planes[i].normal)) / dot(p0 - p2, r->clip_planes[i].normal)) * (p0 - p2);
				v3 x1 = p2 + ((-r->clip_planes[i].d - dot(p2, r->clip_planes[i].normal)) / dot(p1 - p2, r->clip_planes[i].normal)) * (p1 - p2);

				float t0 = length(x0 - p0) / length(p2 - p0);
				float t1 = length(x1 - p1) / length(p2 - p1);

				v2 x0_uv = lerp(uv0, t0, uv2);
				v2 x1_uv = lerp(uv1, t1, uv2);
				
				v3 x0_n = noz(lerp(n0, t0, n2));
				v3 x1_n = noz(lerp(n1, t1, n2));


				if (clip_up)
				{
					new_triangles[new_triangle_count++] = Triangle{.p0 = x0, .p1 = x1, .p2 = p2,
							.uv0 = x0_uv, .uv1 = x1_uv, .uv2 = uv2,
							.n0 = x0_n, .n1 = x1_n, .n2 = n2};
				}
				else
				{
					new_triangles[new_triangle_count++] = {.p0 = p0, .p1 = p1, .p2 = x0,
							.uv0 = uv0, .uv1 = uv1, .uv2 = x0_uv,
							.n0 = n0, .n1 = n1, .n2 = x0_n};
					new_triangles[new_triangle_count++] = {.p0 = p1, .p1 = x1, .p2 = x0,
							.uv0 = uv1, .uv1 = x1_uv, .uv2 = x0_uv,
							.n0 = n1, .n1 = x1_n, .n2 = x0_n};
				}

				for (int k = 0; k < 2 - clip_up; k++)
				{
					Triangle *t = &new_triangles[new_triangle_count - k - 1];
					float d = dot(cross(cp1 - cp0, cp2 - cp0), cross(t->p1 - t->p0, t->p2 - t->p0));
					if (d < 0)
					{
						swap(t->p1, t->p2);
						swap(t->uv1, t->uv2);
						swap(t->n1, t->n2);
					}
				}
			}
		}
		triangle_count = new_triangle_count;
		for (int i = 0; i < new_triangle_count; i++)
			triangles[i] = new_triangles[i];
	}

	for (int i = 0; i < triangle_count; i++)
	{
		Triangle *t = &triangles[i];

		// TODO: this is shit
		t->texture = triangle->texture;
		t->color = triangle->color;
		t->no_lighthing = triangle->no_lighthing;
		t->is_2d = triangle->is_2d;

		v3 p0, p1, p2;

		if (triangle->is_2d)
		{
			p0 = triangle->p0;
			p1 = triangle->p1;
			p2 = triangle->p2;
		}
		else
		{
			p0 = prespective_projection(r, t->p0);
			p1 = prespective_projection(r, t->p1);
			p2 = prespective_projection(r, t->p2);
		}

	
		v2 tmin = {fminf(p0.x, fminf(p1.x, p2.x)), fminf(p0.y, fminf(p1.y, p2.y))};
		v2 tmax = {fmaxf(p0.x, fmaxf(p1.x, p2.x)), fmaxf(p0.y, fmaxf(p1.y, p2.y))};

		t->screen_p0 = p0;
		t->screen_p1 = p1;
		t->screen_p2 = p2;
	
		t->min_x = floorf(tmin.x);
		t->max_x = ceilf(tmax.x);
		t->min_y = floorf(tmin.y);
		t->max_y = ceilf(tmax.y);
	
		if (t->min_x < 0) t->min_x = 0;
		if (t->min_y < 0) t->min_y = 0;
		if (t->max_x > r->buffer.width) t->max_x = r->buffer.width;
		if (t->max_y > r->buffer.height) t->max_y = r->buffer.height;
		if (t->min_x >= t->max_x || t->min_y >= t->max_y)
			continue;

		assert(r->triangle_count < r->max_triangle_count);

		r->triangles[r->triangle_count++] = *t;

		const int TILE_WIDTH  = r->buffer.width / TILES_PER_WIDTH;
		const int TILE_HEIGHT = r->buffer.height / TILES_PER_HEIGHT;

		int min_tile_x = t->min_x / TILE_WIDTH;
		int min_tile_y = t->min_y / TILE_HEIGHT;
		int max_tile_x = (t->max_x + TILE_WIDTH - 1) / TILE_WIDTH;
		int max_tile_y = (t->max_y + TILE_HEIGHT - 1) / TILE_HEIGHT;

		for (int y = min_tile_y; y < max_tile_y; y++)
		{
			for (int x = min_tile_x; x < max_tile_x; x++)
			{
				int j = y * TILES_PER_WIDTH + x;

				v2 clip_min, clip_max;
	
				get_tile_clip_bounds(r, j, clip_min, clip_max);
				
				int cmin_x = clamp(clip_min.x, clip_max.x, t->min_x);
				int cmin_y = clamp(clip_min.y, clip_max.y, t->min_y);
				int cmax_x = clamp(clip_min.x, clip_max.x, t->max_x);
				int cmax_y = clamp(clip_min.y, clip_max.y, t->max_y);
	
				if (cmin_x >= cmax_x || cmin_y >= cmax_y)
					continue;

				r->triangles_per_tile[j][r->triangles_per_tile_count[j]++] = r->triangle_count - 1;
			}
		}
	}
}

void push_line(Render_Context *r, v3 p0, v3 p1, v4 color);

void push_cube(Render_Context *r, v3 c, v3 u, v3 v, v3 w, v3 radius, v4 color, Texture *top = 0, Texture *sides = 0, int no_lighthing = 0)
{
    u = noz(u) * radius.x;
    v = noz(v) * radius.y;
    w = noz(w) * radius.z;

	v3 p00 = c - u - v + w;
	v3 p01 = c + u - v + w;
	v3 p02 = c + u + v + w;
	v3 p03 = c - u + v + w;
	v3 p10 = c - u - v - w;
	v3 p11 = c + u - v - w;
	v3 p12 = c + u + v - w;
	v3 p13 = c - u + v - w;

	// TODO: make sure these are counter-clockwise
    struct 
	{
		v3 p0, p1, p2;
		Texture *tex;
		int flip_uv;
	}triangles[] = {
        {p00, p01, p02, sides}, {p00, p02, p03, sides}, // front
      	{p10, p12, p11, sides, 1}, {p10, p13, p12, sides, 1}, // back
		{p01, p11, p12, sides}, {p01, p12, p02, sides}, // right
		{p10, p00, p03, sides}, {p10, p03, p13, sides}, // left
        {p03, p02, p12, top}, {p03, p12, p13, top}, // up
        {p00, p11, p01, top, 1}, {p00, p10, p11, top, 1}, // down
    };

    for (int i = 0; i < ARRAY_LENGTH(triangles); i++)
	{

		v2 uv0 = V2(0, 0), uv1 = V2(1, 0), uv2 = V2(1, 1);

		if (i % 2)
			uv0 = V2(0, 0), uv1 = V2(1, 1), uv2 = V2(0, 1);

		if (triangles[i].flip_uv)
			swap(uv1, uv2);

        Triangle t;

        t.p0 = triangles[i].p0;
        t.p1 = triangles[i].p1;
        t.p2 = triangles[i].p2;
        t.uv0 = uv0;
        t.uv1 = uv1;
        t.uv2 = uv2;
        t.no_lighthing = no_lighthing;

        v3 normal = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
        t.n0 = normal;
        t.n1 = normal;
        t.n2 = normal;

        t.texture = triangles[i].tex;
        t.color = color;

        push_triangle(r,  &t);

		//normal *= -1;
		//v4 nc = V4((normal + V3(1, 1, 1)) * 0.5f, 1);
		//v3 c = (t.p0 + t.p1 + t.p2) / 3;
		//push_line(r, c, c + normal * 0.1f, nc);

		//push_line(r, t.p0, t.p1, color);
		//push_line(r, t.p1, t.p2, color);
		//push_line(r, t.p0, t.p2, color);

	}

}

void push_line(Render_Context *r, v3 p0, v3 p1, v4 color = V4(1, 1, 1, 1))
{
#if 1
    float thickness = 0.01f;

    v3 radius = V3(thickness, thickness, length(p1 - p0) * 0.5f);


	v3 w = noz(p1 - p0);

	v3 up = V3(0, 0, 1);

    if (fabsf(dot(up, w)) > 0.9)
        up = V3(0, 1, 0);

	v3 u = noz(cross(up, w));
	v3 v = noz(cross(w, u));

	push_cube(r, p0 + (p1 - p0) * 0.5f, u, v, w, radius, color, 0, 0, 1);
#else
	p0 = world_to_camera(r, p0);
	p1 = world_to_camera(r, p1);
	// clip
	if (p0.z > -r->near_clip_plane)
		swap(p0, p1);
	if (p0.z > -r->near_clip_plane)
		return ;
	if (p1.z > -r->near_clip_plane)
	{
		float t = (-r->near_clip_plane - p1.z) / (p1.z - p0.z);
		p1 = p1 + t * (p1 - p0);
	}
	
	p0 = prespective_projection(r, p0);
	p1 = prespective_projection(r, p1);

	uint32_t color32 = color_v4_to_u32(color);

	float line_length = length(p1.xy - p0.xy);

	v2 p0_v2 = V2(p0.x, p0.y);

	v2 perp = noz(V2(-(p1.y - p0.y), p1.x - p0.x));

	int p0_x = p0.x;
	int p0_y = p0.y;
	int p1_x = p1.x;
	int p1_y = p1.y;

	// TODO: better clipping and also clip p1
	if (p0_x < 0)
	{
		if (p1_x < 0) return ;

		float t = -(float)p0_x / (p1_x - p0_x);

		p0_x = 0;
		p0_y += t * (p1_y - p0_y);
	}
	if (p0_x >= r->buffer.width)
	{
		if (p1_x >= r->buffer.width) return ;
		float t = (float)(r->buffer.width - 1 - p0_x) / (p1_x - p0_x);

		p0_x = r->buffer.width - 1;
		p0_y += t * (p1_y - p0_y);
	}
	if (p0_y < 0)
	{
		if (p1_y < 0) return ;

		float t = -(float)p0_y / (p1_y - p0_y);

		p0_y = 0;
		p0_x += t * (p1_x - p0_x);
	}
	if (p0_y >= r->buffer.height)
	{
		if (p1_y >= r->buffer.height) return ;
		float t = (float)(r->buffer.height - 1 - p0_y) / (p1_y - p0_y);

		p0_y = r->buffer.height - 1;
		p0_x += t * (p1_x - p0_x);
	}

	int dx = p1.x - p0.x > 0 ? 1 : -1;
	int dy = p1.y - p0.y > 0 ? 1 : -1;

	int p_x = p0.x;
	int p_y = p0.y;

	// !!!!!!!!!!!!!!TODO: there is a bug with z calculation, check with sphere 
	//
	int max_iterations = (r->buffer.width + r->buffer.height) * 2;
	while (max_iterations--)
	{

		// TODO: check this
		float one_over_z = lerp(p0.z, length(V2(p_x, p_y) - p0_v2) / line_length, p1.z);
		float p_z = 1.f / one_over_z;

		// TODO: do we really have to do this?
		if (!(p_x >= 0 && p_x < r->buffer.width && p_y >= 0 && p_y < r->buffer.height))
			break ;
		for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
		{
			int i = p_y * r->buffer_aa.width + p_x * SAMPLES_PER_PIXEL + sample;

			if (p_z < r->zbuffer[i])
			{
				r->zbuffer[i] = p_z;
				r->buffer_aa.pixels[i] = color32;
			}
		}
		// consider (p_x + dx, py) and (p_x, py + dy)	
		float d0 = fabsf(dot(perp, V2(p_x + dx, p_y) - p0_v2));
		float d1 = fabsf(dot(perp, V2(p_x, p_y + dy) - p0_v2));

		// TODO: update z in here?
		if (d0 < d1)
			p_x += dx;
		else
			p_y += dy;

		//if (p_x == p1_x && p_y == p1_y)
		//	break ;
		if (abs(p_x - p0_x) > abs(p1_x - p0_x) || abs(p_y - p0_y) > abs(p1_y - p0_y))
			break ;
	}
#endif
}

void push_box_outline(Render_Context *r, v3 center, v3 radius, v4 color = V4(1, 1, 1, 1))
{
    v3 u = V3(1, 0, 0);
    v3 v = V3(0, 1, 0);
    v3 w = V3(0, 0, 1);

    u *= radius.x;
    v *= radius.y;
    w *= radius.z;

	v3 p00 = center - u - v + w;
	v3 p01 = center + u - v + w;
	v3 p02 = center + u + v + w;
	v3 p03 = center - u + v + w;
	v3 p10 = center - u - v - w;
	v3 p11 = center + u - v - w;
	v3 p12 = center + u + v - w;
	v3 p13 = center - u + v - w;

    push_line(r, p00, p01, color);
    push_line(r, p01, p02, color);
    push_line(r, p02, p03, color);
    push_line(r, p00, p03, color);

    push_line(r, p10, p11, color);
    push_line(r, p11, p12, color);
    push_line(r, p12, p13, color);
    push_line(r, p10, p13, color);

    push_line(r, p00, p10, color);
    push_line(r, p01, p11, color);
    push_line(r, p02, p12, color);
    push_line(r, p03, p13, color);
}

#if 0
void push_sphere(Render_Context *r, v3 center, float radius, v4 color)
{
	center = world_to_camera(r, center);
	
	if (center.z - radius > -r->near_clip_plane)
		return ;

	v3 box[8];

	int j = 0;

	int min_x = r->buffer.width, min_y = r->buffer.height, max_x = 0, max_y = 0;
	// find bounding box in 3d
	for (int i = 0; i < 8; i++)
	{
		box[j] = center + (V3(1, 0, 0) * (((i >> 0) & 1) > 0 ? 1 : -1) +
			   V3(0, 1, 0) * (((i >> 1) & 1) > 0 ? 1 : -1) +
			   V3(0, 0, 1) * (((i >> 2) & 1) > 0 ? 1 : -1)) * radius;

		// TODO: clipping?
		//if (box[j].z > -r->near_clip_plane)
		//	continue ;
		box[j] = prespective_projection(r, box[j]);

		min_x = fmin(min_x, box[j].x);
		min_y = fmin(min_y, box[j].y);
		max_x = fmax(max_x, box[j].x);
		max_y = fmax(max_y, box[j].y);
		j++;
	}
	if (j <= 1)
		return ;
	if (min_x < 0) min_x = 0;
	if (min_y < 0) min_y = 0;
	if (max_x > r->buffer.width)  max_x = r->buffer.width;
	if (max_y > r->buffer.height) max_y = r->buffer.height;

	v3 light_p = world_to_camera(r, r->light_p);

#if 0
	for (int y = min_y; y < max_y; y++)
	{
		for (int x = min_x; x < max_x; x++)
		{
			for (int i = 0; i < SAMPLES_PER_PIXEL; i++)
			{
				v2 pixel_p = V2(x, y) + r->samples_offset[i];

				float dir_x = ((pixel_p.x / r->buffer.width) - 0.5f) * r->film_width;
				float dir_y = ((1 - (pixel_p.y) / r->buffer.height) - 0.5f) * r->film_height;
				v3 ray_dir = V3(dir_x, dir_y, -r->near_clip_plane);
				v3 ray_origin = V3(0, 0, 0);

				v3 relative_origin = ray_origin - center;
				float a = dot(ray_dir, ray_dir);
				float b = 2 * dot(relative_origin, ray_dir);
				float c = dot(relative_origin, relative_origin) - radius * radius;
				float delta = b * b - 4 * a * c;
				if (delta >= 0)
				{
					float sq_delta = sqrtf(delta);
					float t0 = (-b - sq_delta) / (2 * a);
					float t1 = (-b + sq_delta) / (2 * a);

					float t = -1;

					if (t0 >= 0)
						t = t0;
					if (t1 >= 0 && (t0 < 0 || t1 < t0))
						t = t1;
					if (t < 0)
						continue ;
					v3 p = ray_origin + ray_dir * t;

					//printf("%f %f\n", length(p - center), radius);

					float z = -p.z;
					int idx = y * r->buffer_aa.width + x * SAMPLES_PER_PIXEL + i;
					if (z < r->zbuffer[idx])
					{
						v3 n = noz(p - center);

						v3 ambient = V3(0.52, .8, .9);

						float diffuse = max(0, dot(noz(light_p - p), n));
						
						float light_strength = 10;

						diffuse *= (1.0 / square(length(light_p - p))) * light_strength;
				
						v3 reflected = reflect(light_p - p, n);
						float specular = powf(max(0, dot(noz(reflected), noz(p))), 20);

						v3 c =  (ambient * 0.2f  + V3(diffuse, diffuse, diffuse)* 0.8)
								+ V3(specular, specular, specular);

						c *= color;

						if (c.r > 1) c.r = 1;
						if (c.g > 1) c.g = 1;
						if (c.b > 1) c.b = 1;

						r->zbuffer[idx] = z;
						r->buffer.pixels[idx] = color_v3_to_u32(c);
					}
				}
			}
		}
	}
#endif
}
#endif

void push_mesh(Render_Context *r, Mesh *mesh, v3 position, v3 scale = V3(1, 1, 1), v3 rotation = V3(0, 0, 0), v4 color = V4(1, 1, 1, 1))
{
    TIMED_FUNCTION();

    m3x3 rot_matrix = z_rotation(rotation.z) * (y_rotation(rotation.y) * x_rotation(rotation.x));
    m3x3 inv_matrix = x_rotation(-rotation.x) * (y_rotation(-rotation.y) * z_rotation(-rotation.z));
    m3x3 normal_matrix = transpose(inv_matrix);
    
    v3 min_box = V3(FLT_MAX);
    v3 max_box = V3(-FLT_MAX);

    for (int i = 0; i < mesh->triangle_count; i++)
    {
        Triangle t = mesh->triangles[i];

        t.p0 = (rot_matrix * t.p0) * scale + position;
        t.p1 = (rot_matrix * t.p1) * scale + position;
        t.p2 = (rot_matrix * t.p2) * scale + position;

        t.n0 = (normal_matrix * t.n0);
        t.n1 = (normal_matrix * t.n1);
        t.n2 = (normal_matrix * t.n2);

        t.color = color;

       push_triangle(r, &t);

		v3 c = (t.p0 + t.p1 + t.p2) / 3.f;
		v3 normal = noz(cross(t.p1 - t.p0, t.p2 - t.p0));

		v3 nc = (normal + V3(1, 1, 1)) * 0.5f;
		v3 nc0 = (t.n0 + V3(1, 1, 1)) * 0.5f;
		v3 nc1 = (t.n1 + V3(1, 1, 1)) * 0.5f;
		v3 nc2 = (t.n2 + V3(1, 1, 1)) * 0.5f;

        min_box = min(min_box, min(min(t.p0, t.p1), t.p2));
        max_box = max(max_box, max(max(t.p0, t.p1), t.p2));
		//if (i % 2)
		{
	//		push_line(r, t.p0, t.p0 + t.n0 * 0.1f, nc0);
	//		push_line(r, t.p1, t.p1 + t.n1 * 0.1f, nc1);
	//		push_line(r, t.p2, t.p2 + t.n2 * 0.1f, nc2);

	//		push_line(r, c, c + normal * 0.1f, nc);

			//push_line(r, t.p0, t.p1, color);
		//	push_line(r, t.p0, t.p2, color);
		//	push_line(r, t.p1, t.p2, color);
		}
    }
 //   push_box_outline(r, (min_box + max_box) * 0.5f, (max_box - min_box) * 0.5f);
}



void push_2d_triangle(Render_Context *r, v2 p0, v2 p1, v2 p2, v4 color = V4(1, 1, 1, 1), Texture *texture = 0,
			v2 uv0 = V2(1, 0), v2 uv1 = V2(0, 1), v2 uv2 = V2(1, 1))
{
	Triangle t = {};

	t.p0 = V3(p0 * V2(r->buffer.width, r->buffer.height), 0);
	t.p1 = V3(p1 * V2(r->buffer.width, r->buffer.height), 0);
	t.p2 = V3(p2 * V2(r->buffer.width, r->buffer.height), 0);
	t.color = color;
	t.texture = texture;
	t.uv0 = uv0;
	t.uv1 = uv1;
	t.uv2 = uv2;
	t.is_2d = 1;
	t.no_lighthing = 1;

	r->triangles_2d[r->triangle_2d_count++] = t;
}

void render_tile(Render_Context *r, int tile_index)
{
	TIMED_FUNCTION();
	v2 clip_min, clip_max;

	get_tile_clip_bounds(r, tile_index, clip_min, clip_max);

	int clip_min_x = clip_min.x;
	int clip_min_y = clip_min.y;
	int clip_max_x = clip_max.x;
	int clip_max_y = clip_max.y;

	v3 light_p = world_to_camera(r, r->light_p);

	int render_zbuffer = r->game->render_zbuffer;

	for (int j = 0; j < r->triangles_per_tile_count[tile_index]; j++)
	{
		Triangle *t = &r->triangles[r->triangles_per_tile[tile_index][j]];

        v3 tp0 = t->p0;
        v3 tp1 = t->p1;
        v3 tp2 = t->p2;

        v3 n0 = r->camera_inv_rotation * t->n0;
        v3 n1 = r->camera_inv_rotation * t->n1;
        v3 n2 = r->camera_inv_rotation * t->n2;

		v3 p0 = t->screen_p0;
		v3 p1 = t->screen_p1;
		v3 p2 = t->screen_p2;

 		v3 u = p1 - p0;
 		v3 v = p2 - p0;

		v3 normal = noz(cross(tp1 - tp0, tp2 - tp0));

		v2 uv0 = t->uv0;
		v2 uv1 = t->uv1;
		v2 uv2 = t->uv2;

		int min_x = t->min_x;
		int min_y = t->min_y;
		int max_x = t->max_x;
		int max_y = t->max_y;

		if (min_x < clip_min_x) min_x = clip_min_x;
		if (min_y < clip_min_y) min_y = clip_min_y;
		if (max_x > clip_max_x) max_x = clip_max_x;
		if (max_y > clip_max_y) max_y = clip_max_y;

 		float det = u.x * v.y - v.x * u.y;

 		if (fabs(det) < 0.0001f) // TODO:
			continue;
		det = 1 / det;

		v3 edge01 = p1 - p0;
		v3 edge02 = p2 - p0;
		v3 edge12 = p2 - p1;

		// top-left fill rule
		// TODO: we can propably check the left edge case much easily
		int fill_01 = ((p1.y - p0.y == 0 && p2.y > p1.y) || (p0 + dot(noz(edge01), edge02) * noz(edge01)).x < p2.x);
		int fill_02 = ((p2.y - p0.y == 0 && p1.y > p2.y) || (p0 + dot(noz(edge02), edge01) * noz(edge02)).x < p1.x);
		int fill_12 = ((p1.y - p2.y == 0 && p0.y > p1.y) || (p1 + dot(noz(edge12), edge01) * noz(edge12)).x < p0.x);

    	for (int y = min_y; y < max_y; y++)
    	{
            int count = (max_x - min_x) * SAMPLES_PER_PIXEL;
            for (int ix = 0; ix < count; ix += LANE_WIDTH)
    	    {
                lane_u32 lane_ix = LaneU32(0, 1, 2, 3, 4, 5, 6, 7) + LaneU32(ix);

                lane_u32 x = LaneU32(min_x) + 
                        (lane_ix >> 2); // TODO: !!!

                lane_v2 pixel_offset = r->samples_offset[ix % SAMPLES_PER_PIXEL];

                lane_v2 pixel_p = pixel_offset + LaneV2(LaneF32(x), LaneF32(y))
                            - LaneV2(LaneF32(p0.x), LaneF32(p0.y));


                lane_f32 w1 = det * (pixel_p.x * v.y    + pixel_p.y * (-v.x));
                lane_f32 w2 = det * (pixel_p.x * (-u.y) + pixel_p.y * u.x);
                lane_f32 w0 = LaneF32(1) - (w1 + w2);


				lane_f32 zero = LaneF32(0);

#if 1
				lane_u32 mask = 
					(w0 > zero | (w0 == zero & LaneU32(fill_12 ? 0xffffffff : 0))) &
					(w1 > zero | (w1 == zero & LaneU32(fill_02 ? 0xffffffff : 0))) &
					(w2 > zero | (w2 == zero & LaneU32(fill_01 ? 0xffffffff : 0)));
#else
				lane_u32 mask = (w0 > zero) & (w1 > zero) & (w2 > zero);
#endif

#if 1
                if (ix + LANE_WIDTH > count)
                { // TODO: find a better way to do this
                    alignas(32) uint32_t value[LANE_WIDTH] = {};

                    int left = ix + LANE_WIDTH - count;

                    for (int j = 0; j < left; j++)
                        value[LANE_WIDTH - j - 1] = 0xFFFFFFFF;

                    __m256i blend =  _mm256_load_si256((__m256i *)value);
                    mask.v = _mm256_blendv_epi8(mask.v, LaneU32(0).v, blend);
                }
#endif

                if (_mm256_testz_si256(mask.v, mask.v))
                    continue ;

                lane_f32 one_over_z = p0.z * w0 + p1.z * w1 + p2.z * w2;
                lane_f32 z = LaneF32(1) / one_over_z;

				if (t->is_2d)
					z = LaneF32(-1);

                int buffer_index = y * r->buffer_aa.width + (min_x * SAMPLES_PER_PIXEL + ix);

                __m256 zbuf = _mm256_maskload_ps(r->zbuffer + buffer_index, mask.v);

                mask = mask & (z < LaneF32(zbuf));
                if (_mm256_testz_si256(mask.v, mask.v))
                    continue ;

				if (render_zbuffer && !t->no_lighthing)
				{

					lane_f32 c =  (z / LaneF32(r->far_clip_plane));

					c = min(c, LaneF32(1)) * 255;

               		lane_u32 color32 = (LaneU32(c) << 24) | (LaneU32(c) << 16) | (LaneU32(c) << 8);

            		_mm256_maskstore_epi32((int *)(r->buffer_aa.pixels + buffer_index), mask.v, color32.v);
               		_mm256_maskstore_ps((r->zbuffer + buffer_index), mask.v, z.v);
					continue ;
				}
				if (!t->is_2d)
				{
					w0 *= z * p0.z;
					w1 *= z * p1.z;
					w2 *= z * p2.z;
				}

				lane_v3 p = tp0 * w0 + tp1 * w1 + tp2 * w2;

				lane_v3 texture_color = LaneV3(LaneF32(1));

				lane_f32 alpha = LaneF32(t->color.a);


				if (t->texture)
				{
                	lane_v2 uv = uv0 * w0 + uv1 * w1 + uv2 * w2;

					int repeat = 1;

					uv.x -= LaneF32(_mm256_floor_ps(uv.x.v));
					uv.y -= LaneF32(_mm256_floor_ps(uv.y.v));

#if 0
					uvx = blend(uvx, uvx + LaneF32(1), uv.x > LaneF32(1));
					uvx = blend(uvx, uvx - LaneF32(1), uv.x < LaneF32(-1));

					uvy = blend(uvy, uvy + LaneF32(1), uv.y > LaneF32(1));
					uvy = blend(uvy, uvy - LaneF32(1), uv.y < LaneF32(-1));

					uv.x = uvx;
					uv.y = uvy;
#endif

#if !(BILINEAR_FILTERING)
					lane_u32 tx = LaneU32(uv.x * t->texture->width);
					lane_u32 ty = LaneU32(uv.y * t->texture->height);
					tx = min(tx, LaneU32(t->texture->width - 1));
					ty = min(ty, LaneU32(t->texture->height - 1));
					lane_u32 idx = ty * t->texture->width + tx;

					lane_u32 color32 = LaneU32(_mm256_mask_i32gather_epi32(LaneU32(0).v,
							(int *)t->texture->pixels, idx.v, mask.v, sizeof(uint32_t)));

					texture_color = color_lane_u32_to_lane_v3(color32);
					alpha *= LaneF32(color32 & 0xFF) / 255.f;
#else
					lane_f32 sx = uv.x * t->texture->width;
					lane_f32 sy = uv.y * t->texture->height;

					lane_u32 tx = LaneU32(LaneF32(_mm256_floor_ps((sx - LaneF32(0.5f)).v)));
					lane_u32 ty = LaneU32(LaneF32(_mm256_floor_ps((sy - LaneF32(0.5f)).v)));

					lane_f32 ftx = sx - LaneF32(0.5f);
					lane_f32 fty = sy - LaneF32(0.5f);

					lane_f32 fx = ftx - LaneF32(_mm256_floor_ps(ftx.v));
					lane_f32 fy = fty - LaneF32(_mm256_floor_ps(fty.v));


					// Textures are bottom-up meaning the texture->pixels[0] is the bottom-left

					//tx = min(tx, LaneU32(t->texture->width - 1));

#if 1
					lane_u32 tx_plus = min(tx + LaneU32(1), LaneU32(t->texture->width - 1));
					lane_u32 ty_plus = min(ty + LaneU32(1), LaneU32(t->texture->height - 1));

					tx = max(tx, LaneU32(0));
					ty = max(ty, LaneU32(0));
#else

					lane_u32 tx_plus = blend(tx + LaneU32(1),
									tx - LaneU32(t->texture->width), tx > LaneU32(t->texture->width - 1));

					lane_u32 ty_plus = blend(ty + LaneU32(1),
									ty - LaneU32(t->texture->height), ty > LaneU32(t->texture->height - 1));


					tx = blend(tx, LaneU32(t->texture->width) + tx, tx < LaneU32(0));
					ty = blend(ty, LaneU32(t->texture->height) + tx, ty < LaneU32(0));

#endif

					lane_u32 idx00 = ty * t->texture->width + tx;
					lane_u32 idx01 = ty * t->texture->width + tx_plus;
					lane_u32 idx10 = ty_plus * t->texture->width + tx;
					lane_u32 idx11 = ty_plus * t->texture->width + tx_plus;

					lane_u32 color32_00 = LaneU32(_mm256_mask_i32gather_epi32(LaneU32(0).v,
							(int *)t->texture->pixels, idx00.v, mask.v, sizeof(uint32_t)));
					lane_u32 color32_01 = LaneU32(_mm256_mask_i32gather_epi32(LaneU32(0).v,
							(int *)t->texture->pixels, idx01.v, mask.v, sizeof(uint32_t)));
					lane_u32 color32_10 = LaneU32(_mm256_mask_i32gather_epi32(LaneU32(0).v,
							(int *)t->texture->pixels, idx10.v, mask.v, sizeof(uint32_t)));
					lane_u32 color32_11 = LaneU32(_mm256_mask_i32gather_epi32(LaneU32(0).v,
							(int *)t->texture->pixels, idx11.v, mask.v, sizeof(uint32_t)));

					lane_v3 color00 = color_lane_u32_to_lane_v3(color32_00);
					lane_v3 color01 = color_lane_u32_to_lane_v3(color32_01);
					lane_v3 color10 = color_lane_u32_to_lane_v3(color32_10);
					lane_v3 color11 = color_lane_u32_to_lane_v3(color32_11);

					texture_color = lerp(
										lerp(color00, fx, color01),
										fy,
										lerp(color10, fx, color11));

					alpha *= lerp(
								lerp(LaneF32(color32_00 & 0xFF) / 255.f, fx, LaneF32(color32_01 & 0xFF) / 255.f),
								fy,
								lerp(LaneF32(color32_10 & 0xFF) / 255.f, fx, LaneF32(color32_11 & 0xFF) / 255.f));
#endif
				}

				lane_v3 c;
				if (t->no_lighthing)
					c = LaneV3(t->color.rgb) * texture_color;
				else
				{
                    v3 kd = V3(0.8);
                    v3 ks = V3(1);
                    v3 ka = V3(0.3);
                    
					v3 ambient = V3(0.52, .8, .9);
                    v3 light_diffuse = V3(1, 1, 1);
                    v3 light_specular = V3(1, 1, 1);

					lane_v3 n = w0 * n0 + w1 * n1 + w2 * n2;

                    lane_v3 to_light = noz(LaneV3(light_p) - p);

					lane_f32 diffuse = max(dot(to_light, n), LaneF32(0));


                    lane_v3 reflected = noz(to_light - 2 * n * dot(to_light, n));
                    
                    lane_f32 specular = max(dot(reflected, noz(p)), LaneF32(0));

                    // TODO: !!
                    specular *= specular;
                    specular *= specular;
                    specular *= specular;
                    specular *= specular;


                    lane_f32 dist = length(LaneV3(light_p) - p);

                    lane_f32 attenuation = LaneF32(1);
                    c = ka * LaneV3(ambient) + 
                          attenuation * (
                                kd * LaneV3(diffuse) * light_diffuse +
                                ks * LaneV3(specular) * light_specular);

					if (r->game->show_normals)
						c = 0.5f * (n + LaneV3(LaneF32(1)));
					else
						c *= texture_color * t->color.rgb;
				}
				lane_u32 old_color32 = LaneU32(_mm256_maskload_epi32((int *)(r->buffer_aa.pixels + buffer_index), mask.v));

				lane_v3 old_color = LaneV3((old_color32 >> 24) & 0xFF, (old_color32 >> 16) & 0xFF, (old_color32 >> 8) & 0xFF) / 255;

				c = old_color + alpha * (c - old_color);

				c.x = min(c.x, LaneF32(1));
				c.y = min(c.y, LaneF32(1));
				c.z = min(c.z, LaneF32(1));
				c = c * 255;

                lane_u32 color32 = (LaneU32(c.x) << 24) | (LaneU32(c.y) << 16) | (LaneU32(c.z) << 8);

                _mm256_maskstore_epi32((int *)(r->buffer_aa.pixels + buffer_index), mask.v, color32.v);
                _mm256_maskstore_ps((r->zbuffer + buffer_index), mask.v, z.v);
    	    }
		}
	}
	{
		TIMED_BLOCK("samples to pixels");
		for (int y = clip_min_y; y < clip_max_y; y++)
		{

#if SAMPLES_PER_PIXEL == 4
			for (int x = clip_min_x; x < clip_max_x; x++)

			{
				__m128i s = _mm_loadu_si128((__m128i *)(r->buffer_aa.pixels + y * r->buffer_aa.width + x * SAMPLES_PER_PIXEL));


				__m128i mask = _mm_set1_epi32(0xFF);

				float cr = _mm_hsum_ps(_mm_cvtepi32_ps(_mm_and_si128(_mm_srli_epi32(s, 24),mask)));
				float cg = _mm_hsum_ps(_mm_cvtepi32_ps(_mm_and_si128(_mm_srli_epi32(s, 16),mask)));
				float cb = _mm_hsum_ps(_mm_cvtepi32_ps(_mm_and_si128(_mm_srli_epi32(s, 8),mask)));

				// sqrt((cr / 255) / 4) * 255 = sqrt(cr) * sqrt(255) * 0.5
				float val = 7.98435971134; // = sqrt(255) * 0.5

				__m128 c = _mm_set_ps(0, cr, cg, cb);
				c = _mm_add_ps(_mm_mul_ps(_mm_sqrt_ps(c), _mm_set1_ps(val)),
								_mm_set1_ps(0.5f));
#if 1
				v3 color;
				color.r = get128_avx(c, 2);
				color.g = get128_avx(c, 1); 
				color.b = _mm_cvtss_f32(c);

				r->buffer.pixels[y * r->buffer.width + x] = 
		    	   				 ((uint32_t)(color.r) << 24) |
		    	   				 ((uint32_t)(color.g) << 16) |
		    	   				 ((uint32_t)(color.b) << 8);
#else
				alignas(16) float color[4];

				_mm_store_ps(color, c);
				r->buffer.pixels[y * r->buffer.width + x] = 
		    	   				 ((uint32_t)(color[2]) << 24) |
		    	   				 ((uint32_t)(color[1]) << 16) |
		    	   				 ((uint32_t)(color[0]) << 8);
#endif
			}
#else
			for (int x = clip_min_x; x < clip_max_x; x++)

			{
				
				uint32_t *b = r->buffer_aa.pixels + y * r->buffer_aa.width + x * SAMPLES_PER_PIXEL;
	
				v3 color = {};
				for (int i = 0; i < SAMPLES_PER_PIXEL; i++)
				{
					uint32_t c = b[i];
	
					color += V3((c >> 24) & 0xFF,
									   (c >> 16) & 0xFF,
									   (c >> 8) & 0xFF) / 255.f;
				}
				color /= SAMPLES_PER_PIXEL;
	
				r->buffer.pixels[y * r->buffer.width + x] = 
		    	   				 ((uint32_t)(sqrtf(color.r) * 255 + 0.5f) << 24) |
		    	   				 ((uint32_t)(sqrtf(color.g) * 255 + 0.5f) << 16) |
		    	   				 ((uint32_t)(sqrtf(color.b) * 255 + 0.5f) << 8);
			}
#endif

		}
	}
}


void end_render(Render_Context *r)
{
	for (int i = 0; i < r->triangle_2d_count; i++)
		push_triangle(r, &r->triangles_2d[i]);
#if 1
	__sync_synchronize();
    r->game->tiles_finished = 0;
	__sync_lock_test_and_set(&r->game->next_tile_index, 0);

	while (1)
	{
		int tile = __sync_fetch_and_add(&r->game->next_tile_index, 1);	

		if (tile >= TILES_COUNT)
			break ;
		render_tile(r, tile);
         __sync_fetch_and_add(&r->game->tiles_finished, 1);	
	}
	while (1)
	{
        if (__sync_fetch_and_add(&r->game->tiles_finished, 0) == TILES_COUNT)
            break ;
		//usleep(100);
	}
#else
	for (int i = 0; i < TILES_COUNT; i++)
		render_tile(r, i);
#endif
}

void	push_2d_rect(Render_Context *r, v2 min, v2 max, v4 color = V4(1, 1, 1, 1))
{
	push_2d_triangle(r, min, V2(max.x, min.y), max, color);
	push_2d_triangle(r, min, V2(min.x, max.y), max, color);
}

void push_2d_rect_outline(Render_Context *r, v2 min, v2 max, v4 color = V4(1, 1, 1, 1), float thickness = 0.001f)
{
	push_2d_rect(r, min, V2(min.x + thickness, max.y), color); // left
	push_2d_rect(r, V2(max.x - thickness, min.y), max, color); // right
	push_2d_rect(r, V2(min.x + thickness, min.y), V2(max.x - thickness, min.y + thickness), color); // top
	push_2d_rect(r, V2(min.x + thickness, max.y - thickness), V2(max.x - thickness, max.y), color); // bottom
}

void push_2d_text(Render_Context *r, String s, v2 offset, float scale = 1, v4 color = V4(1, 1, 1, 1))
{
	float dx = r->game->text_dx * scale;
	float dy = dx * r->char_height_over_width;
	float xoffset = 0;
	float yoffset = 0;
	for (int i = 0; i < s.len; i++)
	{
		char c = s.data[i];

		if (c == '\n')
		{
			xoffset = 0;
			yoffset += dy;
			continue ;
		}
		else if (c == ' ')
		{
			xoffset += dx;
			continue ;
		}

		v2 p00 = offset + V2(xoffset, yoffset);
		v2 p01 = p00 + V2(dx, 0);
		v2 p10 = p00 + V2(0, dy);
		v2 p11 = p00 + V2(dx, dy);

		if (c < r->first_char || c >= r->last_char)
		{
			push_2d_rect(r, p00, p11, V4(1, 0, 1, 1));
			continue ;
		}

		float ux_min = (c - r->first_char) * r->text_du;
		float ux_max = ux_min + r->text_du;

		//push_2d_rect_outline(r, p00, p11, V4(0.5, 0.5, 0.5, 1));
		push_2d_triangle(r, p10, p11, p01, color, &r->text_texture,
					V2(ux_min, 0), V2(ux_max, 0), V2(ux_max, 1));
		push_2d_triangle(r, p10, p01, p00, color, &r->text_texture,
					V2(ux_min, 0), V2(ux_max, 1), V2(ux_min, 1));

		xoffset += dx;
	}
}
