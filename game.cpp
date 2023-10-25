#include "game.h"
#include "math.h"
#include <stdlib.h>
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

#define print_v3(v) printf("%s = (%f, %f, %f)\n", #v, v.x, v.y, v.z)

void swap(float &a, float &b)
{
	float t = a;

	a = b;
	b = t;
}

void swap(v3 &a, v3 &b)
{
	swap(a.x, b.x);
	swap(a.y, b.y);
	swap(a.z, b.z);
}

void swap(v2 &a, v2 &b)
{
	swap(a.x, b.x);
	swap(a.y, b.y);
}

v3 ortho_project_to_screen(v3 p, v3 cam_p, m3x3 cam_inv_rot_matrix, float left, float right, float bottom, float top,
							int screen_width, int screen_height)
{
	p = cam_inv_rot_matrix * (p - cam_p);

    p.x = 2 * p.x / (right - left) - (right + left) / (right - left);
	p.y = 2 * p.y / (top - bottom) - (top + bottom) / (top - bottom);
	p.x = (p.x + 1) * 0.5f * screen_width;
	p.y = (1 - p.y) * 0.5f * screen_height;
	p.z *= -1;

	return p;
}

void read_vertex(char **line, int *f)
{
    int i = 0;
	f[0] = strtol(*line, line, 10);

	while (**line == '/')
	{
		*line = *line + 1;
        f[++i] = strtol(*line, line, 10);
	}
	*line = *line + 1;	
}

char *read_entire_file(const char *filename)
{
    FILE *f = fopen(filename, "rb");
    if (!f)
    {
        printf("failed to load file: %s\n", filename);
        assert(f);
        return 0;
    }
    fseek(f, 0, SEEK_END);
    long length = ftell(f);
    fseek(f, 0, SEEK_SET);
    char *result = (char *)malloc(length + 1);
    assert(result);
    fread(result, 1, length, f);
    result[length] = 0;
    fclose(f);
    return result;
}

Mesh load_mesh(const char *filename, Texture *texture = 0)
{
	char *file = read_entire_file(filename);

	Mesh mesh = {};

	int max_vertices_count = 8192 * 128;
	int max_triangle_count = 8192 * 128;

    v2 *uvs = (v2 *)malloc(max_vertices_count * sizeof(*uvs));
    v3 *vns = (v3 *)malloc(max_vertices_count * sizeof(*uvs));

	v3 *vertices = (v3 *)malloc(max_vertices_count * sizeof(v3));
    int vertex_count = 0;

	mesh.triangles = (Triangle *)malloc(max_triangle_count * sizeof(*mesh.triangles));

    float max_abs = FLT_MIN;


    int uv_count = 0;
    int vn_count = 0;

	char *line = file;
	while (*line)
	{
		if (line[0] == 'v' && line[1] == ' ')
		{
			line += 2;
			v3 v;

			v.x = strtof(line, &line);
			line++;
			v.y = strtof(line, &line);
			line++;
			v.z = strtof(line, &line);


            max_abs = fmax(max_abs, fmax(v.x, fmax(v.y, v.z)));

			assert(vertex_count < max_vertices_count);
            vertices[vertex_count++] = v;
		}
		else if (line[0] == 'f' && line[1] == ' ')
		{
			line += 2;

            int f0[3] = {0};
            int f1[3] = {0};
            int f2[3] = {0};

			read_vertex(&line, f0);
			read_vertex(&line, f1);
			read_vertex(&line, f2);

			line--;

			assert(mesh.triangle_count < max_triangle_count);

			Triangle *t = &mesh.triangles[mesh.triangle_count++];
			assert(f0[0] > 0 && f1[0] > 0 && f2[0] > 0);

			t->p0 = vertices[f0[0] - 1];
			t->p1 = vertices[f1[0] - 1];
			t->p2 = vertices[f2[0] - 1];
            t->texture = texture;
            if (f0[1])
            {
                assert(f0[1] > 0 && f1[1] > 0 && f2[1] > 0);
                t->uv0 = V2(uvs[f0[1] - 1].x, uvs[f0[1] - 1].y);
                t->uv1 = V2(uvs[f1[1] - 1].x, uvs[f1[1] - 1].y);
                t->uv2 = V2(uvs[f2[1] - 1].x, uvs[f2[1] - 1].y);
            }
            if (f0[2])
            {
                assert(f0[2] > 0 && f1[2] > 0 && f2[2] > 0);
                t->n0 = vns[f0[2] - 1];
                t->n1 = vns[f1[2] - 1];
                t->n2 = vns[f2[2] - 1];
            }
            else
                t->n0 = t->n1 = t->n2 = noz(cross(t->p1 - t->p0, t->p2 - t->p0));

		}
		else if (line[0] == 'v' && line[1] == 't')
        {
            line += 3;

			float u = strtof(line, &line);
			line++;
			float v = strtof(line, &line);
 //           line++;
            uvs[uv_count++] = V2(u, v);
        }
        else if (line[0] == 'v' && line[1] == 'n')
        {
            line += 3;

            v3 *v = &vns[vn_count++];

			v->x = strtof(line, &line);
			line++;
			v->y = strtof(line, &line);
            line++;
			v->z = strtof(line, &line);

            *v = noz(*v);
        }
		while (*line && *line != '\n')
			line++;
		if (*line == '\n') line++;
	}



    float s = 1.f / max_abs;

    for (int i = 0; i < mesh.triangle_count; i++)
    {
        mesh.triangles[i].p0 *= s;
        mesh.triangles[i].p1 *= s;
        mesh.triangles[i].p2 *= s;
    }
    free(vertices);
    free(vns);
    free(uvs);
	return mesh;
}

float ray_intersect_plane(v3 plane_normal, float d, v3 ray_origin, v3 ray_dir)
{
	float denom = dot(ray_dir, plane_normal);

	if (fabsf(denom) < 0.000001f)
		return -1;
	
	return (-d - dot(plane_normal, ray_origin)) / denom;
}


Texture load_texture(const char *filename)
{
    Texture tex;

    int w, h, n;
    unsigned char *pixels = stbi_load(filename, &w, &h, &n, 4);
    if (!pixels)
    {
        printf("failed to load %s\n", filename);
        assert(0);
    }
    assert(n == 3 || n == 4);
    tex.width = w;
    tex.height = h;
	tex.pitch = w;
    tex.pixels = (uint32_t *)malloc(w * h * sizeof(*tex.pixels));
    //pixels are 0xRRGGBBAA
    uint32_t *pixel = (uint32_t *)pixels;
    for (int y = 0; y < tex.height; y++)
    {
        for (int x = 0; x < tex.width; x++)
        {
            uint32_t p = *pixel;
            uint32_t r = (p >> 0)  & 0xFF;
            uint32_t g = (p >> 8)  & 0xFF;
            uint32_t b = (p >> 16) & 0xFF;
            uint32_t a = (p >> 24) & 0xFF;

			uint32_t *dest = tex.pixels + (h - y - 1) * tex.width + x;
			*dest = (r << 24) | (g << 16) | (b << 8) | a;

            pixel++;
        }
    }
    printf("loaded %s %d %d\n", filename, w, h);
    stbi_image_free(pixels);
    return tex;
}


float max(float a, float b)
{
	return a > b ? a : b;
}

float min(float a, float b)
{
	return a < b ? a : b;
}

v3 u32_to_v3_01(uint32_t color)
{
	return V3((color >> 24) & 0xFF,
			  (color >> 16) & 0xFF,
			  (color >> 8) & 0xFF) * (1.f / 255);
			  
}

void get_tile_clip_bounds(Game *game, int index, v2 &min_clip, v2 &max_clip)
{
	int min_x = ((index) % TILES_PER_WIDTH) * (game->width / TILES_PER_WIDTH);
	int min_y = ((index) / TILES_PER_HEIGHT) * (game->height / TILES_PER_HEIGHT);

	int max_x = min_x + game->width / TILES_PER_WIDTH;
	int max_y = min_y + game->height / TILES_PER_HEIGHT;

	min_clip = V2(min_x, min_y);
	max_clip = V2(max_x, max_y);
}


v3 world_to_camera(Game *game, v3 p)
{
	return game->camera_inv_rotation_mat * (p - game->camera_p);
}

v3 camera_to_world(Game *game, v3 p)
{
	return game->camera_rotation_mat * p + game->camera_p;
}





v3 project_to_screen(Game *game, v3 p)
{
	p = world_to_camera(game, p);

    v3 res;
	
    res.x = -(game->near_clip_plane * p.x) / p.z;
    res.y = -(game->near_clip_plane * p.y) / p.z;


    res.x = 2 * res.x / (game->right - game->left) - (game->right + game->left) / (game->right - game->left);
	res.y = 2 * res.y / (game->top - game->bottom) - (game->top + game->bottom) / (game->top - game->bottom);


	res.x = (res.x + 1) * 0.5f * game->width;
	res.y = (1 - res.y) * 0.5f * game->height;
	res.z  = -1.f / p.z;

    return res;
}

float edge(v3 a, v3 b, v3 c)
{ return (c.x - a.x) * (b.y - a.y) - (c.y - a.y) * (b.x - a.x); }


struct RenderTileData
{
	Game *game;
	int tile_index;
};

THREAD_WORK_FUNC(render_tile_work)
{
	RenderTileData *data = (RenderTileData *)work->data;

	Game *game = data->game;
	int tile_index = data->tile_index;

	v2 clip_min, clip_max;

	get_tile_clip_bounds(game, tile_index, clip_min, clip_max);

	int clip_min_x = clip_min.x;
	int clip_min_y = clip_min.y;
	int clip_max_x = clip_max.x;
	int clip_max_y = clip_max.y;

	for (int y = clip_min_y; y < clip_max_y; y++)
    {
        for (int x = clip_min_x; x < clip_max_x; x++)
        {
			for (int i = 0; i < SAMPLES_PER_PIXEL; i++)
			{
				int idx = y * game->width * SAMPLES_PER_PIXEL + x * SAMPLES_PER_PIXEL + i;
           		game->zbuffer[idx] = game->far_clip_plane;
           		game->pixels_aa[idx] = 0x87ceeb00;
			}
        }
    }


	for (int j = 0; j < game->triangles_per_tile_count[tile_index]; j++)
	{
		Triangle *t = &game->triangles[game->triangles_per_tile[tile_index][j]];

        v3 tp0 = world_to_camera(game, t->p0);
        v3 tp1 = world_to_camera(game, t->p1);
        v3 tp2 = world_to_camera(game, t->p2);

        v3 n0 = transpose(game->camera_rotation_mat) * t->n0;
        v3 n1 = transpose(game->camera_rotation_mat) * t->n1;
        v3 n2 = transpose(game->camera_rotation_mat) * t->n2;

		v3 p0 = t->screen_p0;
		v3 p1 = t->screen_p1;
		v3 p2 = t->screen_p2;

 		v3 u = p1 - p0;
 		v3 v = p2 - p0;
 		float det = u.x * v.y - v.x * u.y;

 		if (fabsf(det) < 0.0001f)
			continue;

		det = 1 / det;

        float one_over_area = 1.f / edge(p0, p1, p2);

        v3 w = cross(tp1 - tp0, tp2 - tp0);
		v3 normal = noz(w);
        w /= dot(w, w);


		v2 uv0 = t->uv0;// * p0.z;
		v2 uv1 = t->uv1;// * p1.z;
		v2 uv2 = t->uv2;// * p2.z;

		int min_x = t->min_x;
		int min_y = t->min_y;
		int max_x = t->max_x;
		int max_y = t->max_y;

		if (min_x < clip_min_x) min_x = clip_min_x;
		if (min_y < clip_min_y) min_y = clip_min_y;
		if (max_x > clip_max_x) max_x = clip_max_x;
		if (max_y > clip_max_y) max_y = clip_max_y;

    	for (int y = min_y; y < max_y; y++)
    	{
    	    for (int x = min_x; x < max_x; x++)
    	    {

				for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
				{
					v2 poffset = game->samples_offset[sample];

					v3 pixel_p = V3(x + poffset.x, y + poffset.y, 0);
					float w0, w1, w2;
					{
                       v3 p = pixel_p - p0;
#if 1
	 				   float alpha = p.x * v.y * det + p.y * (-v.x) * det;
	 				   float beta = p.x * (-u.y) * det + p.y * u.x * det;
	
					   if (alpha < 0 || beta < 0 || alpha + beta > 1)
						   continue ;

					   w0 = 1 - alpha - beta;
					   w1 = alpha;
					   w2 = beta;
#else
	 				   v3 p = V3(x + poffset.x, y + poffset.y, 0);
						b.w = edge(p1, p2, p);
						b.u = edge(p2, p0, p);
						b.v = edge(p0, p1, p);
						if (b.u < 0 || b.v < 0 || b.w < 0)
							continue;
						b *= one_over_area;
#endif
					}
					float one_over_z = p0.z * w0 + p1.z * w1 + p2.z * w2;
					float z = 1.f / one_over_z;


					w0 *= z * p0.z;
					w1 *= z * p1.z;
					w2 *= z * p2.z;

					v3 p = tp0 * w0 + tp1 * w1 + tp2 * w2;


					assert(fabsf(p.z - (-z)) <= 0.001f);
	//				v3 p = V3(px, py, -z);


					int buffer_index = y * game->width * SAMPLES_PER_PIXEL + x * SAMPLES_PER_PIXEL + sample;
					if (z < game->zbuffer[buffer_index])
					{
						game->zbuffer[buffer_index] = z;

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

							//!!!!TODO: convert from sRGB to linear
#if BILINEAR_FILTERING
							uint32_t t01 = t00, t10 = t00, t11 = t00;
							if (x + 1 < t->texture->width)
								t01 = *(t->texture->pixels + (y) * t->texture->width + (x + 1));
							if (y + 1 < t->texture->height)
								t10 = *(t->texture->pixels + (y + 1) * t->texture->width + (x));
							if (x + 1 < t->texture->width && y + 1 < t->texture->height)
								t11 = *(t->texture->pixels + (y + 1) * t->texture->width + (x + 1));

							texture_color = lerp(lerp(u32_to_v3_01(t00), fx, u32_to_v3_01(t01)),
										fy,
										lerp(u32_to_v3_01(t10), fx, u32_to_v3_01(t11)));
#else
							texture_color = u32_to_v3_01(t00);
#endif
						}
						else
						{
#if 0
                      		const int M = 10;
                      		float checker = (fmod(uv.x * M, 1.0) > 0.5) ^ (fmod(uv.y * M, 1.0) < 0.5);
                      		float d = 0.3 * (1 - checker) + 0.7 * checker;
							c *= d;
#endif
						}
						
						// TODO: there is a bug if u zoom in the african head mesh
						v3 n = w0 * n0 + w1 * n1 + w2 * n2;

						v3 ambient = V3(0.52, .8, .9);

						v3 light_p = world_to_camera(game, game->light_p);

						float diffuse = max(0, dot(noz(light_p - p), n));
						
						float light_strength = 10;

						ambient = {};

					//	diffuse *= (1.0 / square(length(light_p - p))) * light_strength;
				
						v3 reflected = reflect(light_p - p, n);
						float specular = powf(max(0, dot(noz(reflected), noz(p))), 10);

						v3 c =  (ambient  + V3(diffuse, diffuse, diffuse)* 0.8)
								+ V3(specular, specular, specular);
						
						// should specular also be multiplied?
						c = texture_color * t->color;
		
						{

							bool in_shadow = 1;

							v3 world_p = w0 * t->p0 + w1 * t->p1 + w2 * t->p2;

							v3 sp = ortho_project_to_screen(world_p, game->light_p, game->light_inv_rot_matrix,
											game->shadow_map_left,
											game->shadow_map_right,
											game->shadow_map_bottom,
											game->shadow_map_top,
											game->shadow_map_width,
											game->shadow_map_height);

							int sx = sp.x;
							int sy = sp.y;

							if (sx >= 0 && sx < game->shadow_map_width && sy >= 0 && sy < game->shadow_map_height)
							{

	//							float bias = max(0.05 * (1.0 - dot(normal, lightDir)), 0.005);  

								float sz = game->shadow_map[sy * game->shadow_map_width + sx];
								if (!(sp.z - 0.5f > sz))
									in_shadow = 0;
							}
							else
								in_shadow = 0;
							if (in_shadow)
								c *= 0.2f;
						}

						
						//c = V3(z, z, z) / game->far_clip_plane;
						if (c.r > 1)
							c.r = 1;
						if (c.g > 1)
							c.g = 1;
						if (c.b > 1)
							c.b = 1;
	    	   			uint32_t color32 = ((uint32_t)(c.r * 255 + 0.5f) << 24) |
	    	   					           ((uint32_t)(c.g * 255 + 0.5f) << 16) |
	    	   					           ((uint32_t)(c.b * 255 + 0.5f) << 8);
	    	   			game->pixels_aa[buffer_index] = color32;
					}
				}
    	    }
		}

	}
    // TODO: ! I don't think we need this, but we might wanna do some stuff about it
    // also read about deferred rendering
	for (int y = clip_min_y; y < clip_max_y; y++)
	{
		for (int x = clip_min_x; x < clip_max_x; x++)
		{
			uint32_t *b = game->pixels_aa + y * game->width * SAMPLES_PER_PIXEL + x * SAMPLES_PER_PIXEL;

			v3 color = {};
			for (int i = 0; i < SAMPLES_PER_PIXEL; i++)
			{
				uint32_t c = b[i];

				color += V3((c >> 24) & 0xFF,
								   (c >> 16) & 0xFF,
								   (c >> 8) & 0xFF) / 255.f;
			}
			color /= SAMPLES_PER_PIXEL;
			// TODO: linear to sRGB
			game->pixels[y * game->width + x] = 
	    	   				 ((uint32_t)(sqrtf(color.r) * 255 + 0.5f) << 24) |
	    	   				 ((uint32_t)(sqrtf(color.g) * 255 + 0.5f) << 16) |
	    	   				 ((uint32_t)(sqrtf(color.b) * 255 + 0.5f) << 8);
		}
	}
	work->finished = 1;

	return 0;
}

// this runs only on the main thread
ThreadWork *add_thread_work(Game *game)
{
	game->thread_work[game->real_work_count].index = game->real_work_count;
	
	return &game->thread_work[game->real_work_count++];
}

inline ThreadWork *get_next_thread_work(Game *game)
{
#if 0
	if (game->next_work_index >= game->work_count)
		return 0;
	return &game->thread_work[game->next_work_index++];

#else
	
#if 1
	while (1)
	{
		int work_index = game->next_work_index;
	
		if (work_index >= game->work_count)
			return 0;
		if (atomic_compare_exchange_weak(&game->next_work_index, &work_index, work_index + 1))
			return &game->thread_work[work_index];	
	}
	return 0;
#else
	int index = __sync_fetch_and_add(&game->next_work_index, 1);

	if (index >= game->work_count)
		return 0;
	return &game->thread_work[index];
#endif
#endif
}

void wait_for_all_work_to_finish(Game *game)
{
#if 1
	//atomic_store(&game->work_count, game->real_work_count);
	game->work_count = game->real_work_count;

	while (1)
	{
		ThreadWork *work = get_next_thread_work(game);

		if (!work)
			break ;

		work->callback(work);
	}


	int first_non_finished = 0;
	while (1) // bad!!!!!!!!!
	{
		int finished = 1;
		for (int i = first_non_finished; i < game->work_count; i++)
		{
			if (!game->thread_work[i].finished)
			{
				first_non_finished = i;
				finished = 0;
				break ;
			}
		}
		if (finished)
			break ;
		usleep(1000);
	}


#endif
}

void render_shadow_map(Game *game)
{
	wait_for_all_work_to_finish(game);

	game->light_rotation = game->camera_rotation;
	game->light_rotation = {-PI / 2, -PI / 2, - PI / 2};

    m3x3 rot_matrix = z_rotation(game->light_rotation.z) * (y_rotation(game->light_rotation.y) * x_rotation(game->light_rotation.x));
    m3x3 inv_rot_matrix = x_rotation(-game->light_rotation.x) * (y_rotation(-game->light_rotation.y) * z_rotation(-game->light_rotation.z));

	game->light_inv_rot_matrix = inv_rot_matrix;

	int shadow_map_width = game->shadow_map_width;
	int shadow_map_height = game->shadow_map_height;
	float *shadow_map = game->shadow_map;


	game->light_p = {2, 5, -2};


	//game->light_p = game->camera_p;

	v3 light_p = game->light_p;


	//v3 light_dir = rot_matrix * V3(0, 0, -1);

	float near_clip_plane = 0.125f;
	float far_clip_plane = 1000;
	float fov = 60;

    float film_width = tan((fov*0.5f) * DEG_TO_RAD) * 2 * near_clip_plane;
	film_width = 10;
    float film_height = film_width * ((float)shadow_map_height / shadow_map_width);
	
	game->shadow_map_top = film_height * 0.5f;
	game->shadow_map_right = film_width * 0.5f;
	game->shadow_map_bottom = -game->shadow_map_top;
	game->shadow_map_left = -game->shadow_map_right;

	for (int y = 0; y < shadow_map_height; y++)
		for (int x = 0; x < shadow_map_width; x++)
			shadow_map[y * shadow_map_width + x] = far_clip_plane;

	for (int i = 0; i < game->triangle_count; i++)
	{
		Triangle *t = &game->triangles[i];

		v3 p0 = t->p0, p1 = t->p1, p2 = t->p2;


		p0 = ortho_project_to_screen(p0, light_p, inv_rot_matrix, game->shadow_map_left, game->shadow_map_right, game->shadow_map_bottom, game->shadow_map_top, shadow_map_width, shadow_map_height);
		p1 = ortho_project_to_screen(p1, light_p, inv_rot_matrix, game->shadow_map_left, game->shadow_map_right, game->shadow_map_bottom, game->shadow_map_top, shadow_map_width, shadow_map_height);
		p2 = ortho_project_to_screen(p2, light_p, inv_rot_matrix, game->shadow_map_left, game->shadow_map_right, game->shadow_map_bottom, game->shadow_map_top, shadow_map_width, shadow_map_height);

 		v3 u = p1 - p0;
 		v3 v = p2 - p0;
 		float det = u.x * v.y - v.x * u.y;

 		if (fabsf(det) < 0.0001f)
			continue;

		
		det = 1 / det;

	    v2 tmin = {fmin(p0.x, fmin(p1.x, p2.x)), fmin(p0.y, fmin(p1.y, p2.y))};
	    v2 tmax = {fmax(p0.x, fmax(p1.x, p2.x)), fmax(p0.y, fmax(p1.y, p2.y))};
	
	    int min_x = floorf(tmin.x);
	    int max_x = floorf(tmax.x) + 1;
	    int min_y = floorf(tmin.y);
	    int max_y = floorf(tmax.y) + 1;
	
	    if (min_x < 0) min_x = 0;
	    if (min_y < 0) min_y = 0;
	    if (max_x > shadow_map_width) max_x = shadow_map_width;
	    if (max_y > shadow_map_height) max_y = shadow_map_height;
		if (min_x >= max_x || min_y >= max_y)
			continue;

		for (int y = min_y; y < max_y; y++)
    	{
    	    for (int x = min_x; x < max_x; x++)
    	    {
                v3 p = V3(x + 0.5f, y + 0.5f, 0) - p0;
	 			float alpha = p.x * v.y * det + p.y * (-v.x) * det;
	 			float beta = p.x * (-u.y) * det + p.y * u.x * det;
	
				if (alpha < 0 || beta < 0 || alpha + beta > 1)
				    continue ;

				float z = p0.z * (1 - alpha - beta) + p1.z * alpha + p2.z * beta;

				if (z >= 0 && z < shadow_map[y * shadow_map_width + x])
					shadow_map[y * shadow_map_width + x] = z;
			}
		}
	}
	for (int y = 0; y < game->height; y++)
	{
		for (int x = 0; x < game->width; x++)
		{
			float z = shadow_map[y * shadow_map_width + x];

			v3 c = V3(z, z, z) / far_clip_plane;

			if (c.r > 1) c.r = 1;
			if (c.g > 1) c.g = 1;
			if (c.b > 1) c.b = 1;

			game->pixels[y * game->width + x] = 
	    	   							   ((uint32_t)(c.r * 255 + 0.5f) << 24) |
	    	   					           ((uint32_t)(c.g * 255 + 0.5f) << 16) |
	    	   					           ((uint32_t)(c.b * 255 + 0.5f) << 8);
		}
	}


}

void render_game(Game *game)
{
	wait_for_all_work_to_finish(game);

#if 1
	for (int i = 0; i < TILES_COUNT; i++)
	{

		ThreadWork *work = add_thread_work(game);
	
		RenderTileData *data = (RenderTileData *)work->data;
	
		data->game = game, data->tile_index = i;
	
		work->callback = render_tile_work;
		work->finished = 0;
	}
	// add render work
	wait_for_all_work_to_finish(game);
#endif
}


// TODO: make this multithreaded

struct DrawTriangleData
{
	Game *game;
	Triangle triangles[100];
	int triangle_count;
};

static_assert(sizeof(DrawTriangleData) <= sizeof(((ThreadWork *)0)->data), "add more size to thread work data");

THREAD_WORK_FUNC(draw_triangle_work)
{
	DrawTriangleData *data = (DrawTriangleData *)work->data;
	
	Game *game = data->game;
	

	for (int i = 0; i < data->triangle_count; i++)
	{
		Triangle *triangle = &data->triangles[i];

		Triangle triangles[2];
		int triangle_count = 0;
	
		v3 cp0 = world_to_camera(game, triangle->p0);
		v3 cp1 = world_to_camera(game, triangle->p1);
		v3 cp2 = world_to_camera(game, triangle->p2);
		
	
		int d0 = cp0.z > -game->near_clip_plane;
		int d1 = cp1.z > -game->near_clip_plane;
		int d2 = cp2.z > -game->near_clip_plane;
	
		if (d0 + d1 + d2 == 0)
		{
			triangles[triangle_count++] = Triangle{.p0 = cp0, .p1 = cp1, .p2 = cp2, .uv0 = triangle->uv0, .uv1 = triangle->uv1, .uv2 = triangle->uv2};
		}
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

			int swp = 0;

			if ((clip_up && !d0) || (!clip_up && d0))
				swap(p0, p2), swap(uv0, uv2), swp = 1;
			else if ((clip_up && !d1) || (!clip_up && d1))
				swap(p1, p2), swap(uv1, uv2), swp = 2;

			v3 x0 = p2 - ((game->near_clip_plane + p2.z) / (p0.z - p2.z)) * (p0 - p2);
			v3 x1 = p2 - ((game->near_clip_plane + p2.z) / (p1.z - p2.z)) * (p1 - p2);

			v2 x0_uv = lerp(uv0, length(x0 - p0) / length(p2 - p0), uv2);
			v2 x1_uv = lerp(uv1, length(x1 - p1) / length(p2 - p1) , uv2);

			if (clip_up)
			{
				triangles[triangle_count++] = Triangle{.p0 = x0, .p1 = x1, .p2 = p2,
						.uv0 = x0_uv, .uv1 = x1_uv, .uv2 = uv2};
			}
			else
			{
				triangles[triangle_count++] = {.p0 = p0, .p1 = p1, .p2 = x0,
						.uv0 = uv0, .uv1 = uv1, .uv2 = x0_uv};
				triangles[triangle_count++] = {.p0 = p1, .p1 = x1, .p2 = x0,
						.uv0 = uv1, .uv1 = x1_uv, .uv2 = x0_uv};
			}

			v3 normal = cross(cp1 - cp0, cp2 - cp0);
			for (int i = 0; i < triangle_count; i++)
			{
				
				Triangle *t = &triangles[i];

				float d = dot(cross(cp1 - cp0, cp2 - cp0), cross(t->p1 - t->p0, t->p2 - t->p0));
#if 0

				if (d < 0)
				{
					swap(triangles[i].p1, triangles[i].p2);
					swap(triangles[i].uv1, triangles[i].uv2);
				}
				else if (!d)
				{
					d = dot(cross(cp2 - cp1, cp2 - cp0), cross(t->p2 - t->p1, t->p2 - t->p0));

					if (d < 0)
					{
						swap(triangles[i].p0, triangles[i].p1);
						swap(triangles[i].uv0, triangles[i].uv1);
					}
				}
#else
				if (!clip_up)
				{
					if (swp == 1 || swp == 2)
					{
						swap(triangles[0].p1, triangles[0].p2);
						swap(triangles[0].uv1, triangles[0].uv2);

					}
					if (swp == 2)
					{
						swap(triangles[1].p1, triangles[1].p2);
						swap(triangles[1].uv1, triangles[1].uv2);
					}
	//				else if (swp == 2)
	//				{
	//					swap(triangles[0].p1, triangles[0].p2);
	//					swap(triangles[0].uv1, triangles[0].uv2);
	//				}
					float d = dot(cross(cp1 - cp0, cp2 - cp0), cross(t->p1 - t->p0, t->p2 - t->p0));

					assert(d >= 0);
					break ;
				}
				else
				{

				//float d = dot(cross(cp1 - cp0, cp2 - cp0), cross(t->p1 - t->p0, t->p2 - t->p0));
				//if (d < 0)
				//{
				//	swap(triangles[i].p1, triangles[i].p2);
				//	swap(triangles[i].uv1, triangles[i].uv2);
				//}
				//break ;
				//assert(triangle_count == 1);
					if (swp == 1)
					{
						swap(triangles[0].p1, triangles[0].p2);
						swap(triangles[0].uv1, triangles[0].uv2);
					}
					else if (swp == 2)
					{
						swap(triangles[0].p0, triangles[0].p2);
						swap(triangles[0].uv0, triangles[0].uv2);
					}

					float d = dot(cross(cp1 - cp0, cp2 - cp0), cross(t->p1 - t->p0, t->p2 - t->p0));

					assert(d >= 0);
					break ;
				}
#endif
			}
		}
#if 1
		for (int i = 0; i < triangle_count; i++)
		{
			assert(game->triangle_count < MAX_TRIANGLE_COUNT);
	
			Triangle *t = &triangles[i];

	
			v3 sp0 = t->p0, sp1 = t->p1, sp2 = t->p2;
			v2 uv0 = t->uv0, uv1 = t->uv1, uv2 = t->uv2;

			*t = *triangle;

			t->p0 = sp0, t->p1 = sp1, t->p2 = sp2;
			t->uv0 = uv0, t->uv1 = uv1, t->uv2 = uv2;

			t->p0 = camera_to_world(game, t->p0);
			t->p1 = camera_to_world(game, t->p1);
			t->p2 = camera_to_world(game, t->p2);

			v3 p0 = project_to_screen(game, t->p0);
	    	v3 p1 = project_to_screen(game, t->p1);
	    	v3 p2 = project_to_screen(game, t->p2);
	
	    	v2 tmin = {fmin(p0.x, fmin(p1.x, p2.x)), fmin(p0.y, fmin(p1.y, p2.y))};
	    	v2 tmax = {fmax(p0.x, fmax(p1.x, p2.x)), fmax(p0.y, fmax(p1.y, p2.y))};
	
			t->screen_p0 = p0;
			t->screen_p1 = p1;
			t->screen_p2 = p2;
	
	    	t->min_x = floorf(tmin.x);
	    	t->max_x = floorf(tmax.x) + 1;
	    	t->min_y = floorf(tmin.y);
	    	t->max_y = floorf(tmax.y) + 1;
	
	    	if (t->min_x < 0) t->min_x = 0;
	    	if (t->min_y < 0) t->min_y = 0;
	    	if (t->max_x > game->width) t->max_x = game->width;
	    	if (t->max_y > game->height) t->max_y = game->height;
			if (t->min_x >= t->max_x || t->min_y >= t->max_y)
				continue;

			int index = game->triangle_count++;
			game->triangles[index] = *t;

#if 1
			int TILE_WIDTH = game->width / TILES_PER_WIDTH;
			int TILE_HEIGHT = game->height / TILES_PER_HEIGHT;

			int min_tile_x = t->min_x / TILE_WIDTH;
			int min_tile_y = t->min_y / TILE_HEIGHT;
			int max_tile_x = (t->max_x + TILE_WIDTH - 1) / TILE_WIDTH;
			int max_tile_y = (t->max_y + TILE_HEIGHT - 1) / TILE_HEIGHT;

#if 0
			min_tile_x = min_tile_y = 0;
			max_tile_x = TILES_PER_WIDTH;
			max_tile_y = TILES_PER_HEIGHT;
#endif

			for (int y = min_tile_y; y < max_tile_y; y++)
			{
				for (int x = min_tile_x; x < max_tile_x; x++)
				{
					int j = y * TILES_PER_WIDTH + x;

					v2 clip_min, clip_max;
	
					get_tile_clip_bounds(game, j, clip_min, clip_max);
					
					int cmin_x = clamp(clip_min.x, clip_max.x, t->min_x);
					int cmin_y = clamp(clip_min.y, clip_max.y, t->min_y);
					int cmax_x = clamp(clip_min.x, clip_max.x, t->max_x);
					int cmax_y = clamp(clip_min.y, clip_max.y, t->max_y);
	
					if (cmin_x >= cmax_x || cmin_y >= cmax_y)
						continue;

					assert(game->triangles_per_tile_count[j] < MAX_TRIANGLE_COUNT_PER_TILE);
					game->triangles_per_tile[j][game->triangles_per_tile_count[j]++] = index;
				}
			}
#endif
		}
#endif
	}
	work->finished = 1;
	return (0);
}

void draw_triangle(Game *game, Triangle *t)
{
	// TODO: check this
//	if (dot(cross(t->p1 - t->p0, t->p2 - t->p0), t->p1 - game->camera_p) >= 0)
//		return ;

#if 0
	ThreadWork *work = game->curr_thread_work;

	if (!work || ((DrawTriangleData *)work->data)->triangle_count == ARRAY_LENGTH(((DrawTriangleData *)work->data)->triangles))
	{
		work = add_thread_work(game);
		work->finished = 0;
		((DrawTriangleData *)work->data)->triangle_count = 0;
		work->callback = draw_triangle_work;
	}
	DrawTriangleData *data = (DrawTriangleData *)work->data;

	data->game = game;

    data->triangles[data->triangle_count++] = *t;

	game->curr_thread_work = work;
#else
	game->triangles[game->triangle_count++] = *t;
#endif
}



void draw_cube(Game *game, v3 c, v3 rotation, float radius, v3 color, Texture *top, Texture *sides)
{
	v3 u = rotate(V3(1, 0, 0), rotation);
	v3 v = rotate(V3(0, 1, 0), rotation);
	v3 w = rotate(V3(0, 0, 1), rotation);

    u = noz(u) * radius;
    v = noz(v) * radius;
    w = noz(w) * radius;

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
    int n = sizeof(triangles) / sizeof(*triangles);

    for (int i = 0; i < n; i++)
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

        draw_triangle(game, &t);
	}

}

void draw_mesh(Game *game, Mesh *mesh, v3 position, v3 scale, v3 rotation, v3 color = V3(1, 1, 1))
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

        draw_triangle(game, &t);
    }
}

extern "C" void *game_thread_work(void *data)
{
	Game *game = (Game *)data;

	int index = ++game->next_thread_index;

	printf("lanched thread %d\n", index);
	while (1)
	{
		ThreadWork *work = get_next_thread_work(game);

		if (!work)
		{
			usleep(1000);
			continue;
		}
		//printf("thread %d working on %d\n", index, work->index);
		work->callback(work);
	}

	return 0;
}

void load_animation(const char *dir, Mesh *out, int frame_count, Texture *texture)
{
    for (int i = 0; i < frame_count; i++)
    {
        char filename[64];

        char const *zero = "000";

        if (i + 1 >= 100)
            zero = "0";
        else if (i + 1 >= 10)
            zero = "00";

        snprintf(filename, sizeof(filename), "%s/frame%s%d.obj", dir, zero, i + 1);

        out[i] = load_mesh(filename, texture);
    }
}

#include <pthread.h>

extern "C" void game_update_and_render(Game *game)
{
	struct timespec time_start, time_end;
	clock_gettime(CLOCK_MONOTONIC, &time_start);

	v3 cubes_offset = {-2, -1, -3};

	if (!game->is_initialized)
    {
#if THREADS
		 pthread_t thread_ids[CORE_COUNT];
		 for (int i = 1; i < CORE_COUNT; i++)
			 pthread_create(&thread_ids[i], 0, game_thread_work, game);
#endif

        game->starwars_tex = load_texture("starwars.png");
		game->grass_tex = load_texture("grass.png");
		game->grass_top_tex = load_texture("grass_top.png");
		game->ground_tex = load_texture("ground.png");

		{
			Texture *t = &game->checkerboard_tex;

			t->width = t->height = t->pitch = 2;
			t->pixels = (uint32_t *)calloc(4, sizeof(uint32_t));
			t->pixels[0] = t->pixels[3] = 0xffffffff;
		}

        game->starwars_mesh = load_mesh("starwars.obj",  &game->starwars_tex);

        game->cow_mesh = load_mesh("cow.obj", &game->checkerboard_tex);

		for (int i = 0; i < game->cow_mesh.triangle_count; i++)
		{
			game->cow_mesh.triangles[i].uv0 *= 20;
			game->cow_mesh.triangles[i].uv1 *= 20;
			game->cow_mesh.triangles[i].uv2 *= 20;
		}


        game->monkey_mesh = load_mesh("monkey.obj");
		game->african_head_tex = load_texture("african_head.png");
		game->african_head_mesh = load_mesh("african_head.obj", &game->african_head_tex);




		game->light_p = V3(0, 0, 0);
		game->light_rotation = V3(0, 0, 0);

		game->shadow_map_width = game->width;
		game->shadow_map_height = game->height;
		game->shadow_map = (float *)malloc(game->shadow_map_width * game->shadow_map_height * sizeof(float));

        //load_animation("starwars_animation", game->starwars_animation, 116, &game->starwars_tex);

		game->near_clip_plane = 0.125f;
		game->far_clip_plane = 1000;
		game->fov = 60;

        game->camera_p = (v3){0, 1, 8};
       game->camera_p = (v3){0, 0, 0};

        game->film_width = tan((game->fov*0.5f) * DEG_TO_RAD) * 2 * game->near_clip_plane;
        game->film_height = game->film_width * ((float)game->height / game->width);
		game->top = game->film_height * 0.5f;
		game->right = game->film_width * 0.5f;
		game->bottom = -game->top;
		game->left = -game->right;


		game->triangles = (Triangle *)malloc(sizeof(*game->triangles) * MAX_TRIANGLE_COUNT);
		game->thread_work = (ThreadWork *)malloc(sizeof(*game->thread_work) * MAX_TRIANGLE_COUNT * 2);
		game->zbuffer = (float *)malloc(game->width * game->height * MAX_SAMPLES_PER_PIXEL * sizeof(*game->zbuffer));
		game->pixels_aa = (uint32_t *)malloc(game->width * game->height * MAX_SAMPLES_PER_PIXEL * sizeof(uint32_t));
		assert(game->triangles && game->thread_work && game->zbuffer && game->pixels_aa);

		srand(time(0));

		for (int i = 0; i < CUBES_HEIGHT; i++)
		{
			for (int j = 0; j < CUBES_WIDTH; j++)
				game->cubes_height[i][j] = (float)rand() / RAND_MAX;
		}
		// TODO: try other sampling offsets
		for (int sample = 0; sample < SAMPLES_PER_PIXEL; sample++)
		{
			int samples_per_dim = sqrtf(SAMPLES_PER_PIXEL);

			if (SAMPLES_PER_PIXEL == 1)
				game->samples_offset[sample] = V2(0.5f, 0.5f);
			game->samples_offset[sample] = V2((sample % samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2),
							(sample / samples_per_dim) * (1.f / samples_per_dim) + 1.f / (samples_per_dim * 2));
		}
		game->is_initialized = 1;
    }
	game->real_work_count = 0;
	game->work_count = 0;
	game->next_work_index = 0;
	game->curr_thread_work = 0;

	game->triangle_count = 0;
	for (int i = 0; i < TILES_COUNT; i++)
		game->triangles_per_tile_count[i] = 0;

	game->camera_p  += game->camera_dp * DT;

	{
		game->near_clip_plane = 0.125f;
		game->far_clip_plane = 1000;
		game->fov = 60;
        game->film_width = tan((game->fov*0.5f) * DEG_TO_RAD) * 2 * game->near_clip_plane;
        game->film_height = game->film_width * ((float)game->height / game->width);
		game->top = game->film_height * 0.5f;
		game->right = game->film_width * 0.5f;
		game->bottom = -game->top;
		game->left = -game->right;

		game->camera_inv_rotation_mat = x_rotation(-game->camera_rotation.x) *
						(y_rotation(-game->camera_rotation.y) * z_rotation(-game->camera_rotation.z));
		game->camera_rotation_mat = z_rotation(game->camera_rotation.z) *
					(y_rotation(game->camera_rotation.y) * x_rotation(game->camera_rotation.x));
		game->camera_z = game->camera_rotation_mat * V3(0, 0, -1);
		game->camera_x = game->camera_rotation_mat * V3(1, 0, 0);
		game->camera_y = game->camera_rotation_mat * V3(0, 1, 0);
	}

	if (game->go_in)
		game->camera_p += game->camera_z * DT * 0.1;
	else if (game->go_back)
		game->camera_p -= game->camera_z * DT * 0.1;

	

//	draw_triangle(game, V3(-1, 0, -2), V3(1, 0, -2), V3(1, 2, -2), V3(1, 0, 0), &game->grass_tex,
//					V2(0, 0), V2(1, 0), V2(1, 1));
//
//	draw_triangle(game, V3(-1, 0, -2), V3(1, 2, -2), V3(-1, 2, -2), V3(1, 0, 0), &game->grass_tex,
//					V2(0, 0), V2(1, 1), V2(0, 1));
//
	
    
#if 0
	v3 rotation = {};
	for (int z = 0; z < CUBES_HEIGHT; z++)
	{
		for (int x = 0; x < CUBES_WIDTH; x++)
		{
			int y_count = game->cubes_height[z][x] * 5 + 1;

			y_count = 1;
			for (int y = 0; y < y_count; y++)
			{
				float r = 0.2;
				v3 p = V3((x * r * 1.98 - CUBES_WIDTH * 0.5f * r * 2.001), y * r * 1.98f, -z * r * 1.98) + cubes_offset;
				v3 color = lerp(V3(0.2, 0.8, 0.3), cubes_height[z][x], V3(0.1, 0.9, 0.7));
    			draw_cube(game, p, rotation, 0.2, V3(1, 1, 1), &game->grass_top_tex, &game->grass_tex);
			}
		}
	}
#endif 

    //for (int i = 0; i < 100; i++)
    //{
    //    int x = i % 10;
    //    int y = i / 10;

    //    draw_mesh(game, &game->starwars_animation[(game->frame + i) % 116], V3(x * 2.5f, 3, -y * 2.5f), V3(2, 2, 2), V3(0, 0, 0), V3((float)(x + 1) / 10, (float)(10 - y) / 10, 0.2));
    //
    //}


	//draw_cube(game, V3(0, 0, -2), V3(0, 0, 0), 0.5, V3(1, 1, 1), 0, 0);
	{
		Triangle t = {};

		t.p0 = V3(-1000, -1, 1000);
		t.p1 = V3(1000, -1, 1000);
		t.p2 = V3(1000, -1, -1000);
		t.uv0 = V2(0, 0);
		t.uv1 = V2(1000, 0);
		t.uv2 = V2(1000, 1000);
		t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
		t.color = V3(.6, .6, .6);
		t.texture = &game->ground_tex;
		draw_triangle(game, &t);
	}
	{
		Triangle t = {};

		t.p0 = V3(-1000, -1, 1000);
		t.p1 = V3(1000, -1, -1000);
		t.p2 = V3(-1000, -1, -1000);
		t.uv0 = V2(0, 0);
		t.uv1 = V2(1000, 1000);
		t.uv2 = V2(0, 1000);
		t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
		t.color = V3(.6, .6, .6);
		t.texture = &game->ground_tex;
		draw_triangle(game, &t);
	}
	//{
	//	Triangle t = {};

	//	t.p0 = V3(0, 1, -2);
	//	t.p1 = V3(1, 1, -2);
	//	t.p2 = V3(.5, 2, -2);
	//	t.uv0 = V2(0, 0);
	//	t.uv1 = V2(1, 0);
	//	t.uv2 = V2(0, 1);
	//	t.n0 = t.n1 = t.n2 = noz(cross(t.p1 - t.p0, t.p2 - t.p0));
	//	t.color = V3(0.5, 0.5, 0.5);
	//	draw_triangle(game, &t);
	//}
	 draw_mesh(game, &game->monkey_mesh, V3(-1, 1, -3), V3(1, 1, 1), V3(game->time * 2, 0, 0), V3(0.5, 0.8, 0.2));

    draw_mesh(game, &game->cow_mesh, V3(1, 1.5, -5), V3(1, 1, 1), V3(game->time, game->time, game->time));
    draw_mesh(game, &game->starwars_mesh, V3(0, -0.5, -5), V3(1, 1, 1), V3(0, 0, 0));
    draw_mesh(game, &game->african_head_mesh, V3(-2, 1, -5), V3(1, 1, 1), V3(0, 0, 0));
    
    game->animation_time += DT;

	render_shadow_map(game);
	render_game(game);

	clock_gettime(CLOCK_MONOTONIC, &time_end);
	game->last_frame_time = (time_end.tv_sec - time_start.tv_sec) * 1000.0 + (time_end.tv_nsec - time_start.tv_nsec) / 1000000.0;
	if (game->frame)
		game->total_time += game->last_frame_time;
    game->time += DT;
	game->frame++;
}
