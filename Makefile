CC = gcc
CFLAGS = -std=c90 -Wall -Wextra -MMD -MP -I./src -lcurl

SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c, build/%.o, $(SRC))
DEP := $(OBJ:.o=.d)
BIN := OpenMeteoCLI

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $@

build/%.o: src/%.c | build
	$(CC) $(CFLAGS) -c $< -o $@

build:
	mkdir -p build

run: $(BIN)
	./$(BIN)

clean:
	$(RM) -r build $(BIN)

-include $(DEP)

.PHONY: all run clean build
