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


        __m256i ix_offset = _mm256_set_epi32(7, 6, 5, 4, 3, 2, 1, 0);

    	for (int y = min_y; y < max_y; y++)
    	{
            int count = (max_x - min_x) * SAMPLES_PER_PIXEL;
            for (int ix = 0; ix < count; ix += LANE_WIDTH)
            {
                __m256i lane_ix = 
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
