#include "game.h"

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

String cstring(const char *s)
{
	int len = 0;

	while (s[len])
		len++;
	return String{
		(char *)s, len
	};
}

String string_dup(String s)
{
	String res;

	res.len = s.len;
	res.data = (char *)malloc(s.len + 1);
	res.data[res.len] = 0;
	memcpy(res.data, s.data, s.len);
	return res;
}

