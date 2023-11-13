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

                if (ix + LANE_WIDTH > count)
                { // TODO: find a better way to do this
                   
                    alignas(32) uint32_t value[LANE_WIDTH] = {};

                    int left = ix + LANE_WIDTH - count;

                    for (int j = 0; j < left; j++)
                        value[LANE_WIDTH - j - 1] = 0xFFFFFFFF;

                    __m256i blend =  _mm256_load_si256((__m256i *)value);
                    mask.v = _mm256_blendv_epi8(mask.v, LaneU32(0).v, blend);
                }
                if (_mm256_testz_si256(mask.v, mask.v))
                    continue ;

                lane_f32 one_over_z = p0.z * w0 + p1.z * w1 + p2.z * w2;
                lane_f32 z = LaneF32(1) / one_over_z;

                int buffer_index = y * r->buffer_aa.width + (min_x * SAMPLES_PER_PIXEL + ix);
				
				if (t->is_2d)
					z = LaneF32(-1);
				else
				{
               		__m256 zbuf = _mm256_maskload_ps(r->zbuffer + buffer_index, mask.v);

               		mask = mask & (z < LaneF32(zbuf));
               		if (_mm256_testz_si256(mask.v, mask.v))
               			continue ;
				}

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

					uv.x -= LaneF32(_mm256_floor_ps(uv.x.v));
					uv.y -= LaneF32(_mm256_floor_ps(uv.y.v));

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
				c = c * 255 + LaneV3(LaneF32(0.5f));

                lane_u32 color32 = (LaneU32(c.x) << 24) | (LaneU32(c.y) << 16) | (LaneU32(c.z) << 8);

                _mm256_maskstore_epi32((int *)(r->buffer_aa.pixels + buffer_index), mask.v, color32.v);
                _mm256_maskstore_ps((r->zbuffer + buffer_index), mask.v, z.v);
    	    }
		}
