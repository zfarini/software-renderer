#ifndef ARENA_H
#define ARENA_H

struct Arena
{
	uint8_t *base;
	size_t	used;
	size_t	size;
};

struct ArenaPushParams
{
	uint32_t flags;
	uint32_t alignment;
};

enum ArenaPushFlag
{
	ArenaFlag_ClearToZero = (1 << 0),
};

void init_arena(Arena *a, void *base, size_t size)
{
	a->base = (uint8_t *)base;
	a->size = size;
	a->used = 0;
}



void clear_arena(Arena *a)
{
	a->used = 0;
}

ArenaPushParams default_arena_params()
{
	ArenaPushParams params;

	params.flags = 0;
	params.alignment = 32; // TODO:
	return (params);
}

ArenaPushParams arena_clear()
{
	ArenaPushParams params;

	params.flags = ArenaFlag_ClearToZero;
	return params;
}

ArenaPushParams arena_align(int alignment, int clear = 0)
{
	ArenaPushParams  params;

	if (clear)
		params.flags = ArenaFlag_ClearToZero;
	params.alignment = alignment;
	return params;
}

void *push_size_(const char *filename, int line, Arena *a, size_t size, ArenaPushParams params = default_arena_params())
{
	size_t offset = (((uintptr_t)(a->base + a->used) + params.alignment - 1) / params.alignment) * params.alignment - (uintptr_t)a->base;

	assert((uintptr_t)(a->base + offset) % params.alignment == 0);

	if (offset + size > a->size)
	{
		printf("%s:%d: failed to allocate %lu bytes\n", filename, line, size);
		assert(0);
		return 0;
	}

	a->used = offset + size;

	void *res = a->base + offset;

	if (params.flags & ArenaFlag_ClearToZero)
		memset(res, 0, size);
	return res;
}


#define push_size(arena, size, ...) push_size_(__FILE__, __LINE__, arena, size, ## __VA_ARGS__)
#define push_struct(arena, type, ...) (type *)push_size_(__FILE__, __LINE__, arena, sizeof(type), ## __VA_ARGS__)
#define push_array(arena, type, count, ...) (type *)push_size_( __FILE__, __LINE__, arena, sizeof(type) * count, ## __VA_ARGS__)

void init_arena(Arena *dest, Arena *arena, size_t size)
{
	init_arena(dest, push_size(arena, size), size);
}

#endif
