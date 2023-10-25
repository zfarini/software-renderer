
int width = 960, height = 540;

uint32_t *pixels = (uint32_t *)malloc(width * height * 4);

SDL_Init(SDL_INIT_VIDEO);

SDL_Window *window = SDL_CreateWindow("test", 0, 0,
                                          width, height, SDL_WINDOW_SHOWN);
SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED|SDL_RENDERER_PRESENTVSYNC);
 SDL_SetWindowMinimumSize(window, game->width, game->height);
    //TODO: should these takes window or back_buffer width/height
SDL_RenderSetLogicalSize(renderer, width, height);
SDL_RenderSetIntegerScale(renderer, (SDL_bool)1);
SDL_Texture *screen_texture = SDL_CreateTexture(renderer,
                                                SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING,
                                                width, height);
int should_quit = 0;

while (!should_quit)
{
		SDL_Event ev;
		while (SDL_PollEvent(&ev))
        {
			if (ev.type == SDL_QUIT)
				should_quit = 1;
		}

		// code here..
		// red -> pixel >> 24
		
		SDL_RenderClear(renderer); // TODO: is this necessary?
        SDL_UpdateTexture(screen_texture, NULL, pixels, width * 4);
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);
}
