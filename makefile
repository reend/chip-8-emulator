INCLUDES=-I./include -I/usr/include/SDL2 -D_GNU_SOURCE=1 -D_REENTRANT
LIBS=-lSDL2
FLAGS=-g

OBJECTS=./build/chip8memory.o ./build/chip8stack.o ./build/chip8keyboard.o

all: $(OBJECTS)
	gcc $(FLAGS) $(INCLUDES) ./src/main.c $(OBJECTS) $(LIBS) -o ./bin/main

./build/chip8memory.o: ./src/chip8memory.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8memory.c -o ./build/chip8memory.o

./build/chip8stack.o: ./src/chip8stack.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8stack.c -o ./build/chip8stack.o

./build/chip8keyboard.o: ./src/chip8keyboard.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8keyboard.c -o ./build/chip8keyboard.o	

clean:
	rm -rf ./bin/main ./build/*.o

run:
	./bin/main