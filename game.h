#include "mlx/mlx.h"
#include <math.h>
#include <stdio.h>
#include <float.h>
#include <limits.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define PI 3.1415926535897932385
#define DEG_TO_RAD (PI / 180.0)

typedef union 
{
    struct {float x, y, z;};
    struct {float r, g, b;};
    struct {float u, v, w;};
	float e[3];
} v3;

typedef struct
{
    float x, y;
} v2;

typedef struct s_matrix
{
	float e[3][3];
} m3x3;

typedef struct
{
    int width;
    int height;
    void *mlx;
    void *window;
    // image
    void *img;
    char *addr;
    int bits_per_pixel;
    int line_length;
    int endian;

	int is_mouse_down;
	int prev_mouse_x;
	int prev_mouse_y;

	v3 P, dP, ddP;

} Game;

enum KeyCodes
{
#ifdef __APPLE__
	KEYCODE_SPACE = 49,
	KEYCODE_W = 13,
	KEYCODE_A = 0,
	KEYCODE_D = 2,
	KEYCODE_S = 1,
    KEYCODE_Q = 12,
    KEYCODE_E = 14,

	KEYCODE_LEFT = 123,
	KEYCODE_RIGHT = 124,
	KEYCODE_UP = 126,
	KEYCODE_DOWN = 125,

	KEYCODE_ESCAPE = 53,
#else
	KEYCODE_SPACE = 32,
	KEYCODE_W = 119,
	KEYCODE_A = 97,
	KEYCODE_D = 100,
	KEYCODE_S = 115,
	KEYCODE_Q = 113,
	KEYCODE_E = 101,

	KEYCODE_LEFT = 65361,
	KEYCODE_RIGHT = 65363,
	KEYCODE_UP = 65362,
	KEYCODE_DOWN = 65364,

	KEYCODE_ESCAPE = 65307,
#endif
};
