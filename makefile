INCLUDES=-I./include -I/usr/include/SDL2 -D_GNU_SOURCE=1 -D_REENTRANT
LIBS=-lSDL2
FLAGS=-g -no-pie

OBJECTS=./build/chip8memory.o ./build/chip8stack.o ./build/chip8keyboard.o ./build/chip8.o ./build/chip8screen.o 

all: $(OBJECTS)
	gcc $(FLAGS) $(INCLUDES) ./src/main.c $(OBJECTS) $(LIBS) -o ./bin/main

./build/chip8memory.o: ./src/chip8memory.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8memory.c -o ./build/chip8memory.o

./build/chip8stack.o: ./src/chip8stack.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8stack.c -o ./build/chip8stack.o

./build/chip8keyboard.o: ./src/chip8keyboard.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8keyboard.c -o ./build/chip8keyboard.o	

./build/chip8.o: ./src/chip8.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8.c -o ./build/chip8.o	

./build/chip8screen.o: ./src/chip8screen.c
	gcc $(FLAGS) $(INCLUDES) -c ./src/chip8screen.c -o ./build/chip8screen.o		

clean:
	rm -rf ./bin/main ./build/*.o

run:
	./bin/main