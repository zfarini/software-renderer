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
