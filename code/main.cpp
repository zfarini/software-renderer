#include "game.h"
#include "math.h"

#if _WIN32
#include "SDL_windows/SDL.h"
#include "SDL_windows/SDL_thread.h"
#else
#include "SDL/SDL.h"
#include "SDL/SDL_thread.h"
#include <dirent.h>
#include "dlfnc.h"
#endif

#include <time.h>
#include <sys/stat.h> 

#define CODE_RELOADING 0

#if (!CODE_RELOADING)
#include "game.cpp"
#endif

#include <pthread.h>


time_t get_last_write_time(const char *filename)
{
    time_t result = 0;

    struct stat file_status;
    if(stat(filename, &file_status) == 0)
        result = file_status.st_mtime;
    return result;
}

#if CODE_RELOADING
char *get_game_dll_name()
{
	
	DIR *dir = opendir(".");
	assert(dir);

	struct dirent *entry;
	char *dllname = 0;

	while ((entry = readdir(dir)))
	{
		char *filename = entry->d_name;
		int l = strlen(filename);
		if (l >= 7 && !strncmp(filename, "game", 4) && !strcmp(filename + l - 3, ".so"))
		{
			if (!dllname || get_last_write_time(filename) > get_last_write_time(dllname))
				dllname = filename;
		}
	}
	assert(dllname);
	dllname = strdup(dllname);
	closedir(dir);
	return dllname;
}

void *open_dll(char *dllname)
{
	void *dll = dlopen(dllname, RTLD_LAZY);
	assert(dll);
	return dll;
}
#endif

#if __WIN32
#include <windows.h>
int  WinMain(
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR     lpCmdLine,
   int       nShowCmd
)
#else
int main(void)
#endif
{
	int window_width = 512;
	int window_height = 512;

	int backbuffer_width = 512;
	int backbuffer_height = 512;

	assert(backbuffer_width  % TILES_PER_WIDTH == 0);
	assert(backbuffer_height % TILES_PER_HEIGHT == 0);

    if (SDL_Init(SDL_INIT_VIDEO))
	{
		fprintf(stderr, "SDL FAILURE: %s\n", SDL_GetError());
		return 1;
	}

    SDL_Window *window = SDL_CreateWindow("game", 0, 0,
                                          window_width, window_height, SDL_WINDOW_SHOWN);
	if (!window)
	{
		fprintf(stderr, "SDL FAILURE: %s\n", SDL_GetError());
		return 1;
	}

    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED|SDL_RENDERER_PRESENTVSYNC);
	if (!renderer)
	{
		fprintf(stderr, "SDL FAILURE: %s\n", SDL_GetError());
		return 1;
	}

    SDL_RenderSetLogicalSize(renderer, backbuffer_width, backbuffer_width);
    SDL_RenderSetIntegerScale(renderer, (SDL_bool)1);
    SDL_Texture *screen_texture = SDL_CreateTexture(renderer,
                                                    SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING,
                                                    backbuffer_width, backbuffer_height);
	if (!screen_texture)
	{
		fprintf(stderr, "SDL FAILURE: %s\n", SDL_GetError());
		return 1;
	}

	SDL_SetRelativeMouseMode((SDL_bool)0);

	// @Memory
	
	GameMemory game_memory = {};

	game_memory.permanent_storage_size = GIGABYTES(2);
	game_memory.permanent_storage = calloc(1, game_memory.permanent_storage_size);

	GameInput game_input = {};

    Game *game = (Game *)calloc(1, sizeof(*game));
    game->framebuffer.width  = backbuffer_width;
    game->framebuffer.height = backbuffer_height;
	game->next_tile_index = TILES_COUNT;

#if CODE_RELOADING
	char *dll_name = get_game_dll_name();
    void *dll = open_dll(dll_name);
    GameUpdateAndRenderFn *game_update_and_render = (GameUpdateAndRenderFn *)
            dlsym(dll, "game_update_and_render");
    GameThreadWorkFn *game_thread_work = (GameThreadWorkFn *)
            dlsym(dll, "game_thread_work");
    assert(game_update_and_render && game_thread_work);
#endif

	g_thread_info.id = 0;

#if THREADS
	pthread_t thread_ids[CORE_COUNT];
	for (int i = 1; i < CORE_COUNT; i++)
		pthread_create(&thread_ids[i], 0, game_thread_work, game);
#endif

	while (!game->should_quit)
	{
#if CODE_RELOADING
        { 
			char *new_dll_name = get_game_dll_name();

			if (get_last_write_time(new_dll_name) > get_last_write_time(dll_name))
            {
				printf("updating dll...\n");
#if THREADS
				game->thread_kill_yourself = 1;
				for (int i = 1; i < CORE_COUNT; i++)
					SDL_WaitThread(thread_ids[i], 0);
				game->thread_kill_yourself = 0;
#endif
				unlink(dll_name);
				dlclose(dll);
                dll = open_dll(new_dll_name);
                game_update_and_render = (GameUpdateAndRenderFn *)
                    dlsym(dll, "game_update_and_render");
    			game_thread_work = (GameThreadWorkFn *)
            		dlsym(dll, "game_thread_work");

				assert(game_update_and_render && game_thread_work);
#if THREADS
				game->next_thread_index = 0;
				for (int i = 1; i < CORE_COUNT; i++)
			 		thread_ids[i] = SDL_CreateThread(game_thread_work, 0, game);
#endif
				free(dll_name);
				dll_name = new_dll_name;
			}
			else
				free(new_dll_name);
		}
#endif
		game_input.mouse_rel_dp.x = 0;
		game_input.mouse_rel_dp.y = 0;

		SDL_Event ev;
		while (SDL_PollEvent(&ev))
        {
            if (ev.type == SDL_QUIT)
				game->should_quit = 1;
			else if (ev.type == SDL_MOUSEMOTION)
			{
				game_input.mouse_rel_dp.x = ((float)ev.motion.xrel / (window_width * 0.5f));
				game_input.mouse_rel_dp.y = -((float)ev.motion.yrel / (window_height * 0.5f));
			}
		}

		{
			int keystate_len;
			const uint8_t *keystate = SDL_GetKeyboardState(&keystate_len);

			assert(keystate_len <= ARRAY_LENGTH(game_input.buttons));

			for (int i = 0; i < keystate_len; i++)
			{
				game_input.buttons[i].was_down = game_input.buttons[i].is_down;
				game_input.buttons[i].is_down = keystate[i];
			}
		}
		{
			int mouse_x, mouse_y;
			uint32_t mouse_state = SDL_GetMouseState(&mouse_x, &mouse_y);

			for (int i = 0; i < MouseButton_Count; i++)
			{
				game_input.mouse_buttons[i].was_down = game_input.mouse_buttons[i].is_down;
				game_input.mouse_buttons[i].is_down = (mouse_state & SDL_BUTTON(i + 1)) != 0;
			}
			game_input.prev_mouse_p = game_input.mouse_p;
			game_input.mouse_p.x = ((float)mouse_x / window_width) * 2 - 1;
			game_input.mouse_p.y = -(((float)mouse_y / window_height) * 2 - 1);

			game_input.mouse_relative_mode = SDL_GetRelativeMouseMode() ? 1 : 0;
		}

		if (game_input.buttons[SDL_SCANCODE_SPACE].is_down &&
			!game_input.buttons[SDL_SCANCODE_SPACE].was_down)
			SDL_SetRelativeMouseMode((SDL_bool)!SDL_GetRelativeMouseMode());
			
		SDL_LockTexture(screen_texture, 0, (void **)(&game->framebuffer.pixels), &game->framebuffer.pitch);
		assert(game->framebuffer.pitch % 4 == 0);

		game_update_and_render(game, &game_memory, &game_input);

		if (game_input.buttons[SDL_SCANCODE_ESCAPE].is_down)
		    game->should_quit = 1;

		{
			char s[128];
			snprintf(s, sizeof(s), "%.2fms %.2fms", game->last_frame_time, game->total_time / (game->frame + 1));
			SDL_SetWindowTitle(window, s);
		}

		SDL_UnlockTexture(screen_texture);
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);
	}
	//unlink(dll_name);
	return 0;
}
