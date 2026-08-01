# CHIP-8 Emulator

This project is a CHIP-8 emulator written in C using SDL2. It loads a ROM file, places it into the CHIP-8 memory space, and executes the program instruction by instruction while updating the virtual machine state.

## How it works

1. The program starts in [src/main.c](src/main.c), where it reads the ROM file passed as a command-line argument.
2. The ROM is loaded into CHIP-8 memory at the standard program start address.
3. A main loop repeatedly:
   - handles keyboard events from SDL,
   - redraws the screen from the emulator's display buffer,
   - updates the delay timer,
   - reads the next opcode from memory using the program counter,
   - executes the instruction through the emulator core.
4. The emulator core in [src/chip8.c](src/chip8.c) interprets CHIP-8 instructions and updates registers, memory, the screen, the stack, and keyboard state.

## Project structure

- [src/main.c](src/main.c) — entry point, ROM loading, SDL window setup, and the main emulation loop
- [src/chip8.c](src/chip8.c) — CPU instruction execution
- [src/chip8keyboard.c](src/chip8keyboard.c) — keyboard mapping and pressed/released state
- [src/chip8memory.c](src/chip8memory.c) — memory read/write helpers
- [src/chip8screen.c](src/chip8screen.c) — display buffer and sprite drawing
- [src/chip8stack.c](src/chip8stack.c) — subroutine stack operations
- [include](include) — public headers for the emulator components

## Build

Run:

```bash
make
```

## Run

Run the emulator with a CHIP-8 ROM file:

```bash
./bin/main <rom-file>
```

You can download more CHIP-8 games from:

https://www.zophar.net/pdroms/chip8/chip-8-games-pack.html

To run a game, place the ROM file inside the [bin](bin) folder and start the emulator with that file name.

Example:

```bash
cp my-game.ch8 ./bin/
./bin/main ./bin/my-game.ch8
```

## Notes

This project is intended as a learning-oriented emulator and focuses on the basics of CHIP-8 execution, screen rendering, keyboard input, and memory handling.
