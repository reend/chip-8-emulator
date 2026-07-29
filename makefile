INCLUDES=-I/usr/include/SDL2 -D_GNU_SOURCE=1 -D_REENTRANT
LIBS=-lSDL2
FLAGS=-g

all:
	gcc ${FLAGS} ${INCLUDES} ./src/main.c ${LIBS} -o ./bin/main

clean:
	rm -rf ./bin/main

run:
	./bin/main