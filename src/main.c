#include <stdbool.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_video.h>
#include <SDL2/SDL.h>
#include "../include/chip8.h"
#include "../include/chip8keyboard.h"

const char keyboard_map[CHIP8_TOTAL_KEYS] = {
    SDLK_0, SDLK_1, SDLK_2, SDLK_3, SDLK_4, SDLK_5,
    SDLK_6, SDLK_7, SDLK_8, SDLK_9, SDLK_a, SDLK_b,
    SDLK_c, SDLK_d, SDLK_e, SDLK_f
};

int main(int argc, char** argv)
{
    struct chip8 chip8;

    SDL_Init(SDL_INIT_EVERYTHING);
    SDL_Window *window = SDL_CreateWindow(
        EMULATOR_WINDOW_TITLE,
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        CHIP8_WIDTH * MULTIPLIER, CHIP8_HEIGHT * MULTIPLIER, SDL_WINDOW_SHOWN
    );

    
    SDL_Renderer *renderer = SDL_CreateRenderer(
        window, 
        -1,
        SDL_TEXTUREACCESS_TARGET
    );

    while(1) 
    {
        SDL_Event event;
        while(SDL_PollEvent(&event))
        {
            switch (event.type)
            {
                case SDL_QUIT:
                    SDL_DestroyWindow(window);
                    return 0;
                    break; 
                case SDL_KEYDOWN:
                {
                    char key = event.key.keysym.sym;
                    int vkey = chip8_keyboard_map(keyboard_map, key);
                    if (vkey != -1)
                    {
                        chip8_keyboard_down(&chip8.keyboard, vkey);
                    }
                    
                }
                break;
                case SDL_KEYUP:
                {
                    char key = event.key.keysym.sym;
                    int vkey = chip8_keyboard_map(keyboard_map, key);
                    if (vkey != -1)
                    {
                        chip8_keyboard_up(&chip8.keyboard, vkey);
                    }
                    
                }
                break;
            }
           
        }

        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 0);
        SDL_RenderClear(renderer);

        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 0);
        SDL_Rect r;
        r.x = 0;
        r.y = 0;
        r.w = 40;
        r.h = 40;
        SDL_RenderFillRect(renderer, &r);
        SDL_RenderPresent(renderer);
    }

    SDL_DestroyWindow(window);
    return 0;
}