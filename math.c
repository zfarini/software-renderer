float lerp(float a, float b, float t)
{
	return (1 - t) * a + t * b;
}

v3 V3(float x, float y, float z)
{
    return (v3){x, y, z};
}

v3 v3_add(v3 a, v3 b)
{
    return (v3){a.x + b.x, a.y + b.y, a.z + b.z};
}

v3 v3_sub(v3 a, v3 b)
{
    return (v3){a.x - b.x, a.y - b.y, a.z - b.z};
}

v3 v3_scale(v3 a, float b)
{
    return (v3){a.x * b, a.y * b, a.z * b};
}

float v3_dot(v3 a, v3 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

float v3_length(v3 a)
{
    return sqrtf(v3_dot(a, a));
}

v3 v3_lerp(v3 a, v3 b, float t)
{
	return (v3){
		a.x * (1 - t) + b.x * t,
		a.y * (1 - t) + b.y * t,
		a.z * (1 - t) + b.z * t
	};
}

v3 v3_noz(v3 a)
{
    float len = v3_length(a);

    if (len <= 0.00001f)
        return (v3){};
    return v3_scale(a, 1.f / len);
}

v3 v3_cross(v3 a, v3 b)
{
    return (v3){
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
    };
}

v2 V2(float x, float y)
{
    return (v2){x, y};
}

v2 v2_add(v2 a, v2 b)
{
    return (v2){a.x + b.x, a.y + b.y};
}

v2 v2_sub(v2 a, v2 b)
{
    return (v2){a.x - b.x, a.y - b.y};
}

v2 v2_scale(v2 a, float b)
{
    return (v2){a.x * b, a.y * b};
}

float v2_dot(v2 a, v2 b)
{
	return a.x * b.x + a.y * b.y;
}

float v2_length(v2 a)
{
	return sqrtf(v2_dot(a, a));
}

v2 v2_noz(v2 a)
{
	float len = v2_length(a);
	if (len <= 0.00001f)
		return (v2){};
	return v2_scale(a, 1.f / len);
}


v3 m3x3_mul_vec(m3x3 m, v3 v)
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

m3x3 m3x3_mul(m3x3 a, m3x3 b)
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

m3x3 m3x3_transpose(m3x3 m)
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

v3 v3_rotate(v3 v, v3 rot)
{
	v = m3x3_mul_vec(x_rotation(rot.x), v);
	v = m3x3_mul_vec(y_rotation(rot.y), v);
	v = m3x3_mul_vec(z_rotation(rot.z), v);
	return v;
}
