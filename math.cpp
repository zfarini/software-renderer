float lerp(float a, float b, float t)
{
	return (1 - t) * a + t * b;
}

v3 V3(float x, float y, float z)
{
    return (v3){x, y, z};
}

v3 operator+(v3 a, v3 b)
{
    return {a.x + b.x, a.y + b.y, a.z + b.z};
}

v3 operator-(v3 a, v3 b)
{
    return {a.x - b.x, a.y - b.y, a.z - b.z};
}

v3 operator*(v3 a, float b)
{
    return {a.x * b, a.y * b, a.z * b};
}

v3 operator*(float b, v3 a)
{
	return a * b;
}

v3 operator*(v3 a, v3 b)
{
	return {a.x * b.x, a.y * b.y, a.z * b.z};
}

v3 operator/(v3 a, float b)
{
    return a * (1.f / b);
}

v3 &operator+=(v3 &a, v3 b)
{
	return a = a + b;
}

v3 &operator-=(v3 &a, v3 b)
{
	return a = a - b;
}

v3 &operator*=(v3 &a, v3 b)
{
	return a = a * b;
}

v3 &operator*=(v3 &a, float b)
{
	return a = a * b;
}

v3 &operator/=(v3 &a, float b)
{
	return a = a / b;
}

float dot(v3 a, v3 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

float length(v3 a)
{
    return sqrtf(dot(a, a));
}

v3 lerp(v3 a, v3 b, float t)
{
	return {
		a.x * (1 - t) + b.x * t,
		a.y * (1 - t) + b.y * t,
		a.z * (1 - t) + b.z * t
	};
}

v3 noz(v3 a)
{
    float len = length(a);

    if (len <= 0.00001f)
        return (v3){};
	return a / len;
}

v3 cross(v3 a, v3 b)
{
    return {
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
    };
}

v2 V2(float x, float y)
{
    return (v2){x, y};
}

v2 operator+(v2 a, v2 b)
{
    return {a.x + b.x, a.y + b.y};
}

v2 operator-(v2 a, v2 b)
{
    return {a.x - b.x, a.y - b.y};
}

v2 operator*(v2 a, float b)
{
    return {a.x * b, a.y * b};
}

v2 operator*(float b, v2 a)
{
	return a * b;
}

v2 operator/(v2 a, float b)
{
    return a * (1.f / b);
}

float dot(v2 a, v2 b)
{
	return a.x * b.x + a.y * b.y;
}

float length(v2 a)
{
	return sqrtf(dot(a, a));
}

v2 noz(v2 a)
{
	float len = v2_length(a);
	if (len <= 0.00001f)
		return (v2){};
	return v2_scale(a, 1.f / len);
}

v3 operator*(m3x3 m, v3 v)
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


m3x3 operator*(m3x3 a, m3x3 b)
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

m3x3 transpose(m3x3 m)
{
    m3x3 res;

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            res.e[i][j] = m.e[j][i];
    return res;
}

m3x3 x_rotation(float a)
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

m3x3 z_rotation(float a)
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

m3x3 y_rotation(float a)
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

v3 rotate(v3 v, v3 rot)
{
	v = x_rotation(rot.x) * v;
	v = y_rotation(rot.y) * v;
	v = z_rotation(rot.z) * v;
	return v;
}
