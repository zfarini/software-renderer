#include "game.h"
#include "math.h"
#include "SDL/SDL.h"
#include "SDL/SDL_thread.h"
#include <dirent.h>
#include "dlfnc.h"
#include <time.h>
#include <sys/stat.h> 

#define CODE_RELOADING 0

#if (!CODE_RELOADING)
#include "game.cpp"
#endif

time_t get_last_write_time(const char *filename)
{
    time_t result = 0;

    struct stat file_status;
    if(stat(filename, &file_status) == 0)
        result = file_status.st_mtime;
    return result;
}

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

int main(void)
{
	int window_width = 512;
	int window_height = 512;

	int backbuffer_width = window_width;
	int backbuffer_height = window_height;

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

    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);//|SDL_RENDERER_PRESENTVSYNC);
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

#if THREADS
	SDL_Thread *thread_ids[CORE_COUNT];
	for (int i = 1; i < CORE_COUNT; i++)
		thread_ids[i] = SDL_CreateThread(game_thread_work, 0, game);
#endif

	int mouse_left_button_is_down = 0;

	int mouse_x, mouse_y;
	SDL_GetMouseState(&mouse_x, &mouse_y);

	int is_pressed[256] = {};
	int was_pressed[256];

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

		for (int i = 0; i < ARRAY_LENGTH(was_pressed); i++)
			was_pressed[i] = is_pressed[i];

		SDL_Event ev;
		while (SDL_PollEvent(&ev))
        {
            if (ev.type == SDL_QUIT)
				game->should_quit = 1;
			else if (ev.type == SDL_KEYDOWN || ev.type == SDL_KEYUP)
            {
                int is_down = (ev.type == SDL_KEYDOWN);

                SDL_Keycode keycode = ev.key.keysym.sym;

				if (keycode < ARRAY_LENGTH(is_pressed))
					is_pressed[keycode] = is_down;
			}
        	else if (ev.type == SDL_MOUSEBUTTONDOWN || ev.type == SDL_MOUSEBUTTONUP)
        	{
        	     if (ev.button.button == SDL_BUTTON_LEFT)
					 mouse_left_button_is_down = !(mouse_left_button_is_down);
        	}
			else if (ev.type == SDL_MOUSEMOTION && (mouse_left_button_is_down || SDL_GetRelativeMouseMode()))
			{
				int sign = SDL_GetRelativeMouseMode() ? -1 : 1;
				game->camera_rotation.y += sign * ev.motion.xrel * (PI * DT * 0.1f);
				game->camera_rotation.x += sign * ev.motion.yrel * (PI * DT * 0.1f);
			}
		}
		float dx = 8;

		game->camera_dp = V3(0, 0, 0);

		if (is_pressed[SDLK_ESCAPE])
		    game->should_quit = 1;
		if (is_pressed[SDLK_w])
			game->camera_dp += game->camera_z;
		if (is_pressed[SDLK_a])
			game->camera_dp += -game->camera_x;
		if (is_pressed[SDLK_s])
			game->camera_dp += -game->camera_z;
		if (is_pressed[SDLK_d])
			game->camera_dp += game->camera_x;
		if (is_pressed[SDLK_q])
			game->camera_dp += game->camera_y;
		if (is_pressed[SDLK_e])
		   game->camera_dp += -game->camera_y;
		if (is_pressed[SDLK_r])
		    game->camera_rotation.z += 0.01f * PI;
		if (is_pressed[SDLK_f])
		    game->camera_rotation.z -= 0.01f * PI;

		game->camera_dp = noz(game->camera_dp) * dx;

		if (is_pressed[SDLK_SPACE] && !was_pressed[SDLK_SPACE])
			SDL_SetRelativeMouseMode((SDL_bool)!SDL_GetRelativeMouseMode());
			
		game->is_mouse_left_pressed = mouse_left_button_is_down;

		SDL_LockTexture(screen_texture, 0, (void **)(&game->framebuffer.pixels), &game->framebuffer.pitch);
		assert(game->framebuffer.pitch % 4 == 0);

		game_update_and_render(game);
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
}
