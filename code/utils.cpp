#include "game.h"

template<typename T>
void swap(T &a, T &b)
{
	T temp = a;

	a = b;
	b = temp;
}

char *read_entire_file(Arena *arena, const char *filename)
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
	char *result = push_array(arena, char, length + 1);
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

String string_dup(Arena *arena, String s)
{
	String res;

	res.len = s.len;
	res.data = push_array(arena, char, s.len + 1);
	res.data[res.len] = 0;
	memcpy(res.data, s.data, s.len);
	return res;
}


unsigned rand_pcg(uint32_t *rng_state)
{
    unsigned state = *rng_state;
    *rng_state = state * 747796405u + 2891336453u;
    unsigned word = ((state >> ((state >> 28u) + 4u)) ^ state) * 277803737u;
    return (word >> 22u) ^ word;
}

float random_float(float min, float max)
{
	static uint32_t rng_state;
	return min + (rand_pcg(&rng_state) * (1.0 / UINT_MAX)) * (max - min);
}
