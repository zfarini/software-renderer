/*TODO: 

- SRGB

- read about deferred rendering
- premultiplied alpha
*/

#include "renderer.h"
#include "game.h"

Render_Context new_render_context(Game *game, Texture framebuffer, float near_clip_plane, float far_clip_plane,
		float fov, int max_triangle_count)
{
	Render_Context r {};

	r.game = game;

	int samples_per_dim = sqrtf(SAMPLES_PER_PIXEL);
	assert(samples_per_dim * samples_per_dim == SAMPLES_PER_PIXEL);

	r.buffer = framebuffer;
	r.buffer_aa.width = r.buffer.width * SAMPLES_PER_PIXEL;
	r.buffer_aa.pitch = r.buffer_aa.width;
	r.buffer_aa.height = r.buffer.height;
	r.buffer_aa.pixels = (uint32_t *)malloc(r.buffer_aa.width * r.buffer_aa.height * sizeof(uint32_t));

	r.zbuffer = (float *)malloc(r.buffer_aa.width * r.buffer_aa.height * sizeof(*r.zbuffer));
	r.fov = fov;
	r.near_clip_plane = near_clip_plane;
	r.far_clip_plane = far_clip_plane;
	r.triangles = (Triangle *)malloc(max_triangle_count * sizeof(*r.triangles));

	assert(r.buffer_aa.pixels && r.triangles);

	r.film_width = tan(fov*0.5f* DEG_TO_RAD) * 2 * r.near_clip_plane;
	r.film_height = r.film_width * ((float)r.buffer.height / r.buffer.width);
	r.top = r.film_height * 0.5f;
	r.right = r.film_width * 0.5f;
	r.bottom = -r.top;
	r.left = -r.right;

	for (int i = 0; i < TILES_COUNT; i++)
		r.triangles_per_tile[i] = (int *)malloc(max_triangle_count * sizeof(*r.triangles_per_tile));

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

	for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
	{
		if (SAMPLES_PER_PIXEL == 1)
			r.samples_offset[sample] = V2(0.5f, 0.5f);
		else
			r.samples_offset[sample] = V2((sample % samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2),
						(sample / samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2));
	}

	return r;
}

uint32_t color_v3_to_u32(v3 c)
{
	return ((uint32_t)(c.r * 255 + 0.5f) << 24) |
		   ((uint32_t)(c.g * 255 + 0.5f) << 16) |
		   ((uint32_t)(c.b * 255 + 0.5f) << 8);
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
		_mm256_store_si256((__m256i *)(r->zbuffer + i), z);
		_mm256_store_si256((__m256i *)(r->buffer_aa.pixels + i), bg);
	}

	r->triangle_count = 0;
	for (int i = 0; i < TILES_COUNT; i++)
		r->triangles_per_tile_count[i] = 0;

	r->camera_p = camera_p;
	r->camera_rotation = camera_rotation;
	r->camera_inv_rotation = transpose(r->camera_rotation);
	r->light_p = light_p;
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
	Triangle triangles[16];
	int triangle_count = 1;
	Triangle new_triangles[16];

//	if (dot(cross(triangle->p1 - triangle->p0, triangle->p2 - triangle->p0), r->camera_p - triangle->p0) <= 0)
//		return ;

	triangles[0] = *triangle;
	triangles[0].p0 = world_to_camera(r, triangle->p0);
	triangles[0].p1 = world_to_camera(r, triangle->p1);
	triangles[0].p2 = world_to_camera(r, triangle->p2);


		
	for (int i = 0; i < ARRAY_LENGTH(r->clip_planes) && triangle_count; i++)
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

		t->texture = triangle->texture;
		t->color = triangle->color;

		v3 p0 = prespective_projection(r, t->p0);
		v3 p1 = prespective_projection(r, t->p1);
		v3 p2 = prespective_projection(r, t->p2);
	
		v2 tmin = {fmin(p0.x, fmin(p1.x, p2.x)), fmin(p0.y, fmin(p1.y, p2.y))};
		v2 tmax = {fmax(p0.x, fmax(p1.x, p2.x)), fmax(p0.y, fmax(p1.y, p2.y))};

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

void push_cube(Render_Context *r, v3 c, v3 u, v3 v, v3 w, v3 radius, v3 color, Texture *top = 0, Texture *sides = 0)
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

        v3 normal = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
        t.n0 = normal;
        t.n1 = normal;
        t.n2 = normal;

        t.texture = triangles[i].tex;
        t.color = color;

        push_triangle(r,  &t);
	}

}

void push_line(Render_Context *r, v3 p0, v3 p1, v3 color = V3(1, 1, 1))
{
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

	uint32_t color32 = color_v3_to_u32(color);

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
}

void push_sphere(Render_Context *r, v3 center, float radius, v3 color)
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
}

void push_mesh(Render_Context *r, Mesh *mesh, v3 position, v3 scale, v3 rotation, v3 color = V3(1, 1, 1))
{
    m3x3 rot_matrix = z_rotation(rotation.z) * (y_rotation(rotation.y) * x_rotation(rotation.x));
    m3x3 inv_matrix = x_rotation(-rotation.x) * (y_rotation(-rotation.y) * z_rotation(-rotation.z));
    m3x3 normal_matrix = transpose(inv_matrix);
    
    for (int i = 0; i < mesh->triangle_count; i++)
    {
        Triangle t = mesh->triangles[i];

        t.p0 = (rot_matrix * t.p0) * scale + position;
        t.p1 = (rot_matrix * t.p1) * scale + position;
        t.p2 = (rot_matrix * t.p2) * scale + position;

        t.n0 = noz(normal_matrix * t.n0);
        t.n1 = noz(normal_matrix * t.n1);
        t.n2 = noz(normal_matrix * t.n2);

        t.color = color;

       push_triangle(r, &t);

		v3 c = (t.p0 + t.p1 + t.p2) / 3.f;
		v3 normal = noz(cross(t.p1 - t.p0, t.p2 - t.p0));

		v3 nc = (normal + V3(1, 1, 1)) * 0.5f;
		//if (i % 2)
		{
			//push_line(r, c, c + normal * 0.1f, nc);
			//push_line(r, t.p0, t.p1, color);
			//push_line(r, t.p0, t.p2, color);
			//push_line(r, t.p1, t.p2, color);
		}
    }
}


void render_tile(Render_Context *r, int tile_index)
{
	v2 clip_min, clip_max;

	get_tile_clip_bounds(r, tile_index, clip_min, clip_max);

	int clip_min_x = clip_min.x;
	int clip_min_y = clip_min.y;
	int clip_max_x = clip_max.x;
	int clip_max_y = clip_max.y;

	v3 light_p = world_to_camera(r, r->light_p);

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

 		double det = (double)u.x * v.y - (double)v.x * u.y;

 		if (fabs(det) < 0.0001f)
			continue;
		det = 1 / det;

        lane_f32 samples_offset_x[SAMPLES_PER_PIXEL] = {};
        lane_f32 samples_offset_y[SAMPLES_PER_PIXEL] = {};

    	for (int y = min_y; y < max_y; y++)
    	{
 //   	    for (int x = min_x; x < max_x; x++)
            for (int ix = 0; ix < (max_x - min_x) * SAMPLES_PER_PIXEL; ix += LANE_WIDTH)
    	    {

                lane_u32 lane_ix = LaneU32(0, 1, 2, 3, 4, 5, 6, 7) + LaneU32(ix);

                lane_u32 x = LaneU32(min_x) + 
                        (lane_ix >> SAMPLES_PER_PIXEL);

 //               lane_u32 sample = lane_ix & (SAMPLES_PER_PIXEL - 1);
                

                
                lane_v2 pixel_offset;

                pixel_offset.x = samples_offset_x[ix & (SAMPLES_PER_PIXEL - 1)];
                pixel_offset.y = samples_offset_y[ix & (SAMPLES_PER_PIXEL - 1)];

                lane_v2 pixel_p = pixel_offset + LaneV2(LaneF32(x), LaneF32(y));

                lane_v2 p = pixel_p - LaneV2(LaneF32(p0.x), LaneF32(p0.y));


                
                lane_f32 w1 = LaneF32(det) * (p.x * LaneF32(v.y)  + p.y * LaneF32(-v.x));
                lane_f32 w2 = LaneF32(det) * (p.x * LaneF32(-u.y) + p.y * LaneF32(u.x));
                lane_f32 w0 = LaneF32(1) - (w1 + w2);

                lane_u32 mask = (w1 >= LaneF32(0)) & (w2 >= LaneF32(0)) & (w0 < LaneF32(1))
                        & (w1 < LaneF32(1)) & (w2 < LaneF32(1)) & (w0 > LaneF32(0));

                if (_mm256_testz_si256(mask.v, mask.v))
                    continue ;

                lane_f32 one_over_z = p0.z * w0 + p1.z * w1 + p2.z * w2;
                lane_f32 z = LaneF32(1) / one_over_z;



                int buffer_index = y * r->buffer_aa.width + (min_x * SAMPLES_PER_PIXEL + ix);

                __m256 zbuf = _mm256_load_ps(r->zbuffer + buffer_index);


 //               mask = mask & (z < LaneF32(zbuf));

                uint32_t color32 = color_v3_to_u32(t->color);
                lane_u32 c = LaneU32(color32);

                _mm256_maskstore_epi32((int *)(r->buffer_aa.pixels + buffer_index), mask.v, c.v);
   //             _mm256_maskstore_ps((r->zbuffer + buffer_index), mask.v, z.v);

	    	   	//r->buffer_aa.pixels[buffer_index] = color_v3_to_u32(t->color);
   #if 0
                    v2 uv = uv0 * w0 + uv1 * w1 + uv2 * w2;

					v3 texture_color = V3(1, 1, 1);
					if (t->texture)
					{
						uv.x = uv.x - floorf(uv.x);
						uv.y = uv.y - floorf(uv.y);

						
						float tx = uv.x * t->texture->width;
						float ty = uv.y * t->texture->height;

						float fx =  tx - floorf(tx);
						float fy = ty - floorf(ty);

						int x = tx, y = ty;

						if (x >= t->texture->width) x = t->texture->width - 1;
						if (y >= t->texture->height) y = t->texture->height - 1;
                        if (x < 0) x = 0;
                        if (y < 0) y = 0;


						uint32_t t00 = *(t->texture->pixels + (y) * t->texture->width + (x));

#if BILINEAR_FILTERING
						uint32_t t01 = t00, t10 = t00, t11 = t00;
						if (x + 1 < t->texture->width)
							t01 = *(t->texture->pixels + (y) * t->texture->width + (x + 1));
						if (y + 1 < t->texture->height)
							t10 = *(t->texture->pixels + (y + 1) * t->texture->width + (x));
						if (x + 1 < t->texture->width && y + 1 < t->texture->height)
							t11 = *(t->texture->pixels + (y + 1) * t->texture->width + (x + 1));

						texture_color = lerp(lerp(color_u32_to_v3(t00), fx, color_u32_to_v3(t01)),
									fy,
									lerp(color_u32_to_v3(t10), fx, color_u32_to_v3(t11)));
#else
						texture_color = color_u32_to_v3(t00);
#endif
					}

					v3 n = w0 * n0 + w1 * n1 + w2 * n2;
					
					v3 ambient = V3(0.52, .8, .9);
					
					float diffuse = max(0, dot(noz(light_p - p), n));
					
					float light_strength = 10;

					diffuse *= (1.0 / square(length(light_p - p))) * light_strength;
				
					v3 reflected = reflect(light_p - p, n);
					float specular = powf(max(0, dot(noz(reflected), noz(p))), 20);

					v3 c =  (ambient * 0.2  + V3(diffuse, diffuse, diffuse)* 0.8)
						+ V3(specular, specular, specular);
						
					float fog = 1, d = length(p);

					if (d > 10)
						fog = max(0, 1 - (d - 10) / 50.f);

					c *= texture_color * t->color * fog;
#if 0
					{

						bool in_shadow = 1;

						v3 world_p = w0 * t->p0 + w1 * t->p1 + w2 * t->p2;

						v3 sp = ortho_project_to_screen(world_p, r->light_p, r->light_inv_rot_matrix,
										r->shadow_map_left,
										r->shadow_map_right,
										r->shadow_map_bottom,
										r->shadow_map_top,
										r->shadow_map_width,
										r->shadow_map_height);

						int sx = sp.x;
						int sy = sp.y;

						if (sx >= 0 && sx < r->shadow_map_width && sy >= 0 && sy < r->shadow_map_height)
						{
							float cs = dot(noz(transpose(r->camera_inv_rotation_mat) * n), r->light_dir);
							float sz = r->shadow_map[sy * r->shadow_map_width + sx];

							float bias = max(0.3 * (1 + cs), 0.1f);

	//						bias = 0.3;
							if (sp.z - bias <= sz)
								in_shadow = 0;
						}
						if (in_shadow)
							c *= 0.4;
					}
#endif
					// TODO: maybe clamp later when we copy to buffer?
					if (c.r > 1)
						c.r = 1;
					if (c.g > 1)
						c.g = 1;
					if (c.b > 1)
						c.b = 1;
	    	   		r->buffer_aa.pixels[buffer_index] = color_v3_to_u32(c);
#endif
    	    }
		}

	}

	for (int y = clip_min_y; y < clip_max_y; y++)
	{
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
	}
}

void end_render(Render_Context *r)
{
#if THREADS
	for (int i = 1; i < CORE_COUNT; i++)
		__sync_lock_test_and_set(&r->game->thread_finished[i], 0);
	__sync_lock_test_and_set(&r->game->next_tile_index, 0);


	
	while (1)
	{
		int tile = __sync_fetch_and_add(&r->game->next_tile_index, 1);	

		if (tile >= TILES_COUNT)
			break ;
		render_tile(r, tile);
	}
	while (1)
	{
		int finished = 1;
		for (int i = 1; i < CORE_COUNT; i++)
			if (!r->game->thread_finished[i])
				finished = 0;
		usleep(100);
		if (finished)
			break ;
	}
#else
	for (int i = 0; i < TILES_COUNT; i++)
		render_tile(r, i);
#endif
}
