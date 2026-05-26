CC = gcc
CFLAGS = -O3 -Wall -Wextra -Wpedantic -fsanitize=address -g
LIBS = -lm
TARGET = tetris_agent

SRC = $(shell find src -name '*.c')

# Règle principale (compilation)
$(TARGET): $(SRC)
	$(CC) $(SRC) $(CFLAGS) -o $(TARGET) $(LIBS)

# Règle pour nettoyer les fichiers générés
clean:
	rm -f $(TARGET)
