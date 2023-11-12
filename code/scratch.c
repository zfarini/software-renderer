// (0, 0) is top left of screen, coordinates are percentage of width/height
void render_2d_triangle(Render_Context *r, v2 p0, v2 p1, v2 p2, v4 color = V4(1, 1, 1, 1), Texture *texture = 0,
			v2 uv0, v2 uv1, v2 uv2)
{
	p0 *= V2(r->buffer.width, r->buffer.height);
	p1 *= V2(r->buffer.width, r->buffer.height);
	p2 *= V2(r->buffer.width, r->buffer.height);

	int min_x = floorf(fminf(p0.x, fminf(p1.x, p2.x)));
	int min_y = floorf(fminf(p0.y, fminf(p1.y, p2.y)));
	int max_y = ceilf(fmaxf(p0.x, fmaxf(p1.x, p2.x));
	int min_y = ceilf(fmaxf(p0.y, fmaxf(p1.y, p2.y));

	if (min_x < 0) min_x = 0;
	if (min_y < 0) min_y = 0;
	if (max_x > r->buffer.width) max_x = r->buffer.width;
	if (max_x > r->buffer.height) max_x = r->buffer.height;

	v2 u = p1 - p0;
	v2 v = p2 - p0;
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

				float alpha = color.a;

				lane_v3 c = LaneV3(color.rgb);

                int buffer_index = y * r->buffer_aa.width + (min_x * SAMPLES_PER_PIXEL + ix);

				lane_u32 old_color32 = LaneU32(_mm256_maskload_epi32((int *)(r->buffer_aa.pixels + buffer_index), mask.v));

				lane_v3 old_color = LaneV3((old_color32 >> 24) & 0xFF, (old_color32 >> 16) & 0xFF, (old_color32 >> 8) & 0xFF) / 255;

				c = old_color + alpha * (c - old_color);

				c.x = min(c.x, LaneF32(1));
				c.y = min(c.y, LaneF32(1));
				c.z = min(c.z, LaneF32(1));
				c = c * 255;

                lane_u32 color32 = (LaneU32(c.x) << 24) | (LaneU32(c.y) << 16) | (LaneU32(c.z) << 8);

                _mm256_maskstore_epi32((int *)(r->buffer_aa.pixels + buffer_index), mask.v, color32.v);

		}
	}
}
