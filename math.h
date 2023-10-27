#ifndef MMATH_H
#define MMATH_H

#include <math.h>

typedef union
{
	struct { float x, y; };
	struct { float u, v; };
} v2;

typedef union 
{
    struct {float x, y, z;};
    struct {float r, g, b;};
    struct {float u, v, w;};
	float e[3];


	struct {
		v2 xy;
	};
} v3;

typedef struct 
{
	float e[3][3];
} m3x3;


#ifndef internal
#define internal static
#endif

internal float max(float a, float b)
{
	return a > b ? a : b;
}

internal float min(float a, float b)
{
	return a < b ? a : b;
}

internal float square(float a)
{
	return a * a;
}

internal float lerp(float a, float t, float b)
{
	return (1 - t) * a + t * b;
}

internal float clamp(float a, float b, float t)
{
	if (t < a) t = a;
	else if (t > b) t = b;
	return t;
}

internal v3 V3(float x, float y, float z)
{
    return (v3){x, y, z};
}

internal v3 operator+(v3 a, v3 b)
{
    return {a.x + b.x, a.y + b.y, a.z + b.z};
}

internal v3 operator-(v3 a, v3 b)
{
    return {a.x - b.x, a.y - b.y, a.z - b.z};
}

internal v3 operator-(v3 a)
{
	return {-a.x, -a.y, -a.z};
}

internal v3 operator*(v3 a, float b)
{
    return {a.x * b, a.y * b, a.z * b};
}

internal v3 operator*(float b, v3 a)
{
	return a * b;
}

internal v3 operator*(v3 a, v3 b)
{
	return {a.x * b.x, a.y * b.y, a.z * b.z};
}

internal v3 operator/(v3 a, float b)
{
    return a * (1.f / b);
}

internal v3 &operator+=(v3 &a, v3 b)
{
	return a = a + b;
}

internal v3 &operator-=(v3 &a, v3 b)
{
	return a = a - b;
}

internal v3 &operator*=(v3 &a, v3 b)
{
	return a = a * b;
}

internal v3 &operator*=(v3 &a, float b)
{
	return a = a * b;
}

internal v3 &operator/=(v3 &a, float b)
{
	return a = a / b;
}

internal float dot(v3 a, v3 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

internal float length(v3 a)
{
    return sqrtf(dot(a, a));
}

internal v3 lerp(v3 a, float t, v3 b)
{
	return {
		lerp(a.x, t, b.x),
		lerp(a.y, t, b.y),
		lerp(a.z, t, b.z)
	};
}

internal v3 noz(v3 a)
{
    float len = length(a);

    if (len <= 0.00001f)
        return (v3){};
	return a / len;
}

internal v3 cross(v3 a, v3 b)
{
    return {
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
    };
}

internal v2 V2(float x, float y)
{
    return (v2){x, y};
}

internal v2 operator+(v2 a, v2 b)
{
    return {a.x + b.x, a.y + b.y};
}

internal v2 operator-(v2 a, v2 b)
{
    return {a.x - b.x, a.y - b.y};
}

internal v2 operator*(v2 a, v2 b)
{
    return {a.x * b.x, a.y * b.y};
}

internal v2 operator*(v2 a, float b)
{
    return {a.x * b, a.y * b};
}

internal v2 operator*(float b, v2 a)
{
	return a * b;
}

internal v2 operator/(v2 a, float b)
{
    return a * (1.f / b);
}

internal v2 &operator+=(v2 &a, v2 b)
{
	return a = a + b;
}

internal v2 &operator-=(v2 &a, v2 b)
{
	return a = a - b;
}

internal v2 &operator*=(v2 &a, v2 b)
{
	return a = a * b;
}

internal v2 &operator*=(v2 &a, float b)
{
	return a = a * b;
}

internal v2 &operator/=(v2 &a, float b)
{
	return a = a / b;
}

internal float dot(v2 a, v2 b)
{
	return a.x * b.x + a.y * b.y;
}

internal float length(v2 a)
{
	return sqrtf(dot(a, a));
}

internal v2 noz(v2 a)
{
	float len = length(a);
	if (len <= 0.00001f)
		return (v2){};
    return a / len;
}

internal v2 lerp(v2 a, float t, v2 b)
{
	return {
		lerp(a.x, t, b.x),
		lerp(a.y, t, b.y),
	};
}

internal v3 operator*(m3x3 m, v3 v)
{
	v3 res;

	for (int i = 0; i < 3; i++)
	{
		res.e[i] = 0;
		for (int j = 0; j < 3; j++)
			res.e[i] += m.e[i][j] * v.e[j];
	}
	return res;
}


internal m3x3 operator*(m3x3 a, m3x3 b)
{
    m3x3 res;

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
        {
            res.e[i][j] = 0;
            for (int k = 0; k < 3; k++)
                res.e[i][j] += a.e[i][k] * b.e[k][j];
        }
	}
	return res;
}

internal m3x3 m3x3_columns(v3 a, v3 b, v3 c)
{
	return m3x3{{
		a.x, b.x, c.x,
		a.y, b.y, c.y,
		a.z, b.z, c.z
	}
	};
}
internal m3x3 transpose(m3x3 m)
{
    m3x3 res;

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            res.e[i][j] = m.e[j][i];
    return res;
}

internal m3x3 x_rotation(float a)
{
	float c = cosf(a);
	float s = sinf(a);

	m3x3 m = {{
		1, 0, 0,
		0, c, -s,
		0, s, c
	}};

	return m;
}

internal m3x3 z_rotation(float a)
{
	float c = cosf(a);
	float s = sinf(a);

	m3x3 m = {{
		c, -s, 0,
		s, c, 0,
		0, 0, 1
	}};

	return m;
}

internal m3x3 y_rotation(float a)
{
	float c = cosf(a);
	float s = sinf(a);

	m3x3 m = {{
		c, 0, s,
		0, 1, 0,
		-s, 0, c
	}};

	return m;
}

internal v3 rotate(v3 v, v3 rot)
{
	v = x_rotation(rot.x) * v;
	v = y_rotation(rot.y) * v;
	v = z_rotation(rot.z) * v;
	return v;
}

internal v3 reflect(v3 a, v3 n)
{
	return a - 2 * dot(a, n) * n;
}

#include <immintrin.h>

struct lane_f32
{
    __m256 v;
};

struct lane_u32
{
    __m256i v;
};

struct lane_v2
{
    lane_f32 x;
    lane_f32 y;
};


internal lane_u32 LaneU32(int x)
{
    lane_u32 res;

    res.v = _mm256_set1_epi32(x);
    return res;
}

internal lane_u32 LaneU32(int x0, int x1, int x2, int x3, int x4, int x5, int x6, int x7)
{
    lane_u32 res;

 //   res.v = _mm256_set_epi32(x0, x1, x2, x3, x4, x5, x6, x7);
    res.v = _mm256_set_epi32(x7, x6, x5, x4, x3, x2, x1, x0);
    return res;
}

internal lane_u32 operator+(lane_u32 a, lane_u32 b)
{
    lane_u32 res;

    res.v = _mm256_add_epi32(a.v, b.v);
    return res;
}

internal lane_u32 operator>>(lane_u32 a, int shift)
{
    lane_u32 res;

    res.v = _mm256_srli_epi32(a.v, shift);
    return res;
}

internal lane_u32 operator&(lane_u32 a, int value)
{
    lane_u32 res;

    res.v = _mm256_and_si256(a.v, LaneU32(value).v);
    return res;
}

internal lane_u32 operator&(lane_u32 a, lane_u32 b)
{
    lane_u32 res;

    res.v = _mm256_and_si256(a.v, b.v);
    return res;
}

internal lane_u32 operator<<(lane_u32 a, int shift)
{
    lane_u32 res;

    res.v = _mm256_slli_epi32(a.v, shift);
    return res;
}






// lane_f32



internal lane_f32 LaneF32(float x)
{
    lane_f32 res;

    res.v = _mm256_set1_ps(x);
    return res;
}

internal lane_f32 LaneF32(lane_u32 x)
{
    lane_f32 res;

    res.v = _mm256_castsi256_ps(x.v);
    return res;
}

internal lane_f32 LaneF32(__m256 x)
{
    lane_f32 res;

    res.v = x;
    return res;
}

internal lane_f32 operator+(lane_f32 a, lane_f32 b)
{
    lane_f32 res;

    res.v = _mm256_add_ps(a.v, b.v);
    return res;
}

internal lane_f32 operator-(lane_f32 a, lane_f32 b)
{
    lane_f32 res;

    res.v = _mm256_sub_ps(a.v, b.v);
    return res;
}

internal lane_f32 operator*(lane_f32 a, lane_f32 b)
{
    lane_f32 res;

    res.v = _mm256_mul_ps(a.v, b.v);
    return res;
}

internal lane_f32 operator*(lane_f32 a, float b)
{
    return a * LaneF32(b);
}

internal lane_f32 operator*(float b, lane_f32 a)
{
    return a * b;
}

internal lane_f32 operator/(lane_f32 a, lane_f32 b)
{
    lane_f32 res;

    res.v = _mm256_div_ps(a.v, b.v);
    return res;
}


internal lane_u32 operator<(lane_f32 a, lane_f32 b)
{
    lane_u32 res;

    res.v = _mm256_cmp_ps(a.v, b.v, _CMP_LT_OS);

    return res;
}


internal lane_u32 operator>(lane_f32 a, lane_f32 b)
{
    lane_u32 res;

    res.v = _mm256_cmp_ps(a.v, b.v, _CMP_GT_OS);

    return res;
}

internal lane_u32 operator>=(lane_f32 a, lane_f32 b)
{
    lane_u32 res;

    res.v = _mm256_cmp_ps(a.v, b.v, _CMP_GE_OS);

    return res;
}

internal lane_u32 operator<=(lane_f32 a, lane_f32 b)
{
    lane_u32 res;

    res.v = _mm256_cmp_ps(a.v, b.v, _CMP_LE_OS);

    return res;
}
// lane v2


internal lane_v2 LaneV2(lane_f32 x, lane_f32 y)
{
    lane_v2 res;

    res.x = x;
    res.y = y;
    return res;
}

internal lane_v2 operator+(lane_v2 a, lane_v2 b)
{
    lane_v2 res;

    res.x = a.x + b.x;
    res.y = a.y + b.y;

    return res;
}

internal lane_v2 operator-(lane_v2 a, lane_v2 b)
{
    lane_v2 res;

    res.x = a.x - b.x;
    res.y = a.y - b.y;

    return res;
}

internal lane_v2 operator*(lane_v2 a, lane_v2 b)
{
    lane_v2 res;

    res.x = a.x * b.x;
    res.y = a.y * b.y;

    return res;
}


struct lane_v3
{
    __m256 x;
    __m256 y;
    __m256 z;
};

#define LANE_WIDTH 8



internal lane_v3 operator+(lane_v3 a, lane_v3 b)
{
    lane_v3 res;

    res.x = _mm256_add_ps(a.x, b.x);
    res.y = _mm256_add_ps(a.y, b.y);
    res.z = _mm256_add_ps(a.z, b.z);

    return res;
}

internal lane_v3 operator-(lane_v3 a, lane_v3 b)
{
    lane_v3 res;

    res.x = _mm256_sub_ps(a.x, b.x);
    res.y = _mm256_sub_ps(a.y, b.y);
    res.z = _mm256_sub_ps(a.z, b.z);

    return res;
}
    
internal lane_v3 operator*(lane_v3 a, lane_v3 b)
{
    lane_v3 res;

    res.x = _mm256_mul_ps(a.x, b.x);
    res.y = _mm256_mul_ps(a.y, b.y);
    res.z = _mm256_mul_ps(a.z, b.z);

    return res;
}

internal lane_v3 operator*(lane_v3 a, float b)
{
    lane_v3 res;

    __m256 v = _mm256_set1_ps(b);

    res.x = _mm256_mul_ps(a.x, v);
    res.y = _mm256_mul_ps(a.y, v);
    res.z = _mm256_mul_ps(a.z, v);

    return res;
}

internal lane_v3 operator*(float b, lane_v3 a)
{
    return a * b;
}

internal lane_v3 operator/(lane_v3 a, lane_v3 b)
{
    lane_v3 res;

    res.x = _mm256_div_ps(a.x, b.x);
    res.y = _mm256_div_ps(a.y, b.y);
    res.z = _mm256_div_ps(a.z, b.z);

    return res;
}

internal lane_v3 operator/(lane_v3 a, float b)
{
    lane_v3 res;

    __m256 v = _mm256_set1_ps(b);

    res.x = _mm256_div_ps(a.x, v);
    res.y = _mm256_div_ps(a.y, v);
    res.z = _mm256_div_ps(a.z, v);

    return res;
}

//__m256 lane_v3 dot(lane_v3 a, lane_v3 b)
//{
//
//}


#endif
