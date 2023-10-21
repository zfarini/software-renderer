#include "game.h"
#include "math.h"
#include "SDL/SDL.h"
#include "dlfnc.h"
#include <time.h>
#include <sys/stat.h> 

time_t get_last_write_time(const char *filename)
{
    time_t result = 0;

    struct stat file_status;
    if(stat(filename, &file_status) == 0)
        result = file_status.st_mtime;
    return result;
}

int main(void)
{
    Game *game = (Game *)calloc(1, sizeof(*game));
	
    game->width = 512;
    game->height = 512;

    
	int relative_mouse_mode = 0;

    SDL_Init(SDL_INIT_VIDEO);

    SDL_Window *window = SDL_CreateWindow("texor", 0, 0,
                                          game->width, game->height, SDL_WINDOW_SHOWN);
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED|SDL_RENDERER_PRESENTVSYNC);


    const char *dll_name = "game.so";
    time_t dll_last_write_time = get_last_write_time(dll_name);
    void *dll = dlopen(dll_name, RTLD_LAZY);
    GameUpdateAndRenderFn *game_update_and_render = (GameUpdateAndRenderFn *)
            dlsym(dll, "game_update_and_render");

    assert(dll);
    assert(game_update_and_render);

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

	while (!game->should_quit)
	{
        {
            time_t wt = get_last_write_time(dll_name);
            if (wt != dll_last_write_time)
            {
                dll_last_write_time = wt;
                dlclose(dll);
                dll = dlopen(dll_name, RTLD_LAZY);
                game_update_and_render = (GameUpdateAndRenderFn *)
                    dlsym(dll, "game_update_and_render");
            }
            if (!dll)
                printf("ERROR: failed to load dll\n");
            else if (!game_update_and_render)
                printf("ERROR: failed to load game_update_and_render\n");
        }

		SDL_Event ev;
		while (SDL_PollEvent(&ev))
        {
            if (ev.type == SDL_QUIT)
				game->should_quit = 1;
			else if (ev.type == SDL_KEYDOWN || ev.type == SDL_KEYUP)
            {
                int is_down = (ev.type == SDL_KEYDOWN);

                SDL_Keycode keycode = ev.key.keysym.sym;
				if (is_down)
				{
					float dx = 0.4f;

                	if (keycode == SDLK_ESCAPE)
                	    game->should_quit = 1;
					else if (keycode == SDLK_w)
						game->camera_p += +dx * game->camera_z;
					else if (keycode == SDLK_a)
						game->camera_p += -dx * game->camera_x;
					else if (keycode == SDLK_s)
						game->camera_p += -dx * game->camera_z;
					else if (keycode == SDLK_d)
						game->camera_p += +dx * game->camera_x;
					else if (keycode == SDLK_q)
						game->camera_p += +dx * game->camera_y;
					else if (keycode == SDLK_e)
						game->camera_p += -dx * game->camera_y;
					else if (keycode == SDLK_SPACE)
					{
						relative_mouse_mode = !relative_mouse_mode;
						SDL_SetRelativeMouseMode((SDL_bool)!SDL_GetRelativeMouseMode());
					}
				}

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
        if (game_update_and_render)
		    game_update_and_render(game);
		
		{
			char s[128];
			snprintf(s, sizeof(s), "%.2fms", game->last_frame_time);
			SDL_SetWindowTitle(window, s);
		}

        SDL_RenderClear(renderer); // TODO: is this necessary?
        SDL_UpdateTexture(screen_texture, NULL, game->pixels, game->width * sizeof(uint32_t));
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);
	}
}
