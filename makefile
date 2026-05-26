CC = gcc
CFLAGS = -O3 -Wall -Wextra -Wpedantic -fsanitize=address -g
LIBS = -lm
TARGET = tetris_agent

SRC = $(shell find src -name '*.c')

$(TARGET): $(SRC)
	$(CC) $(SRC) $(CFLAGS) -o $(TARGET) $(LIBS)

clean:
	rm -f $(TARGET)
