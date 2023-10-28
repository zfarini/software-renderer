#define STB_IMAGE_IMPLEMENTATION 
#include "stb_image.h"

#include "game.h"

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

			a = 255;
			uint32_t *dest = tex.pixels + (h - y - 1) * tex.width + x;
			*dest = (r << 24) | (g << 16) | (b << 8) | a;

            pixel++;
        }
    }
    printf("loaded %s %d %d\n", filename, w, h);
    stbi_image_free(pixels);
    return tex;
}


