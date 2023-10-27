#include "game.h"
#include "math.h"
#include "SDL/SDL.h"
#include "SDL/SDL_thread.h"

#include "dlfnc.h"
#include <time.h>
#include <sys/stat.h> 

#define CODE_RELOADING 1

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

#include <dirent.h>

char *get_new_dllname(char *prev_name)
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
			if ((!prev_name || strcmp(prev_name, filename))
				&& (!dllname || get_last_write_time(filename) > get_last_write_time(dllname))
				&& (!prev_name || get_last_write_time(filename) > get_last_write_time(prev_name)))
				dllname = filename;
		}
	}
	
	if (!dllname)
		dllname = prev_name;
	else
		dllname = strdup(dllname);

	assert(dllname);

	closedir(dir);
	return dllname;
}

void *open_dll(char **name)
{
	char *dllname = get_new_dllname(*name);

	*name = dllname;
	void *dll = dlopen(dllname, RTLD_LAZY);
	assert(dll);
	return dll;
}

int main(void)
{
    Game *game = (Game *)calloc(1, sizeof(*game));
	
    game->width = 512;
    game->height = 512;


	assert(game->width % TILES_PER_WIDTH == 0);
	assert(game->width % TILES_PER_HEIGHT == 0);

	int relative_mouse_mode = 0;


    SDL_Init(SDL_INIT_VIDEO);

    SDL_Window *window = SDL_CreateWindow("texor", 0, 0,
                                          game->width, game->height, SDL_WINDOW_SHOWN);
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED|SDL_RENDERER_PRESENTVSYNC);


	SDL_SetRelativeMouseMode((SDL_bool)0);
#if CODE_RELOADING
	char *dllname = 0;
    void *dll = open_dll(&dllname);
    GameUpdateAndRenderFn *game_update_and_render = (GameUpdateAndRenderFn *)
            dlsym(dll, "game_update_and_render");
    GameThreadWorkFn *game_thread_work = (GameThreadWorkFn *)
            dlsym(dll, "game_thread_work");

    assert(dll);
	printf("%s\n", dllname);
    assert(game_update_and_render && game_thread_work);

#endif
#if THREADS
		 SDL_Thread *thread_ids[CORE_COUNT];
		 for (int i = 1; i < CORE_COUNT; i++)
			 thread_ids[i] = SDL_CreateThread(game_thread_work, 0, game);
#endif

    SDL_SetWindowMinimumSize(window, game->width, game->height);
    //TODO: should these takes window or back_buffer width/height
    SDL_RenderSetLogicalSize(renderer, game->width, game->height);
    SDL_RenderSetIntegerScale(renderer, (SDL_bool)1);
    SDL_Texture *screen_texture = SDL_CreateTexture(renderer,
                                                    SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING,
                                                    game->width, game->height);
	game->pixels = (uint32_t *)malloc(game->width * game->height * sizeof(uint32_t));

	assert(window && renderer && screen_texture && game->pixels);

	int mouse_left_button_is_down = 0;

	int mouse_x, mouse_y;
	SDL_GetMouseState(&mouse_x, &mouse_y);

	int is_pressed[256] = {};
	int was_pressed[256];

	while (!game->should_quit)
	{
#if CODE_RELOADING
        { // TODO: kill threads and reload their function??
		


			char *new_name = get_new_dllname(dllname);
			if (new_name != dllname)
            {
				printf("updating dll...\n");
#if THREADS
				game->thread_kill_yourself = 1;
				for (int i = 1; i < CORE_COUNT; i++)
					SDL_WaitThread(thread_ids[i], 0);
				game->thread_kill_yourself = 0;
#endif
				unlink(dllname);
				dllname = new_name;
				dlclose(dll);
                dll = open_dll(&dllname);
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
			}
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
			else if (ev.type == SDL_MOUSEMOTION && (mouse_left_button_is_down || relative_mouse_mode))
			{
				int sign = relative_mouse_mode ? -1 : 1;
				game->camera_rotation.y += sign * ev.motion.xrel * (PI * DT * 0.1f);
				game->camera_rotation.x += sign * ev.motion.yrel * (PI * DT * 0.1f);
			}
//          else if (ev.type == SDL_MOUSEWHEEL)
//          {
//              input.mouse_scroll_y = ev.wheel.y;
//          }


		}
		float dx = 8;

		game->camera_dp = V3(0, 0, 0);

         if (is_pressed[SDLK_ESCAPE])
             game->should_quit = 1;
		 if (is_pressed[SDLK_w])
		 	game->camera_dp += +dx * game->camera_z;
		 if (is_pressed[SDLK_a])
		 	game->camera_dp += -dx * game->camera_x;
		 if (is_pressed[SDLK_s])
		 	game->camera_dp += -dx * game->camera_z;
		 if (is_pressed[SDLK_d])
		 	game->camera_dp += +dx * game->camera_x;
		 if (is_pressed[SDLK_q])
		 	game->camera_dp += +dx * game->camera_y;
		 if (is_pressed[SDLK_e])
			game->camera_dp += -dx * game->camera_y;
		 if (is_pressed[SDLK_r])
			 game->camera_rotation.z += 0.01f * PI;
		 if (is_pressed[SDLK_f])
			 game->camera_rotation.z -= 0.01f * PI;
		 if (is_pressed[SDLK_SPACE] && !was_pressed[SDLK_SPACE])
		 {
		 	relative_mouse_mode = !relative_mouse_mode;
		 	SDL_SetRelativeMouseMode((SDL_bool)!SDL_GetRelativeMouseMode());
		 }
			
		 game->is_mouse_left_pressed = mouse_left_button_is_down;
		game_update_and_render(game);
		
		{
			char s[128];
			snprintf(s, sizeof(s), "%.2fms %.2fms", game->last_frame_time, game->total_time / (game->frame + 1));
			SDL_SetWindowTitle(window, s);
		}

        SDL_RenderClear(renderer); // TODO: is this necessary?
        SDL_UpdateTexture(screen_texture, NULL, game->pixels, game->width * sizeof(uint32_t));
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);
	}
	unlink(dllname);
}
