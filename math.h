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
#endif
