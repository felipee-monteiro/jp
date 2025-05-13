CC = gcc
AS = gcc
CFLAGS = -O3 -march=native -flto -no-pie \
         -Wall -Wextra \
         -fomit-frame-pointer -fstrict-aliasing \
         -pipe -fno-stack-protector -fno-PIC \
         main.c

SRC_C = $(wildcard main)
SRC_ASM = $(wildcard asm/*.S)
OBJ_C = $(SRC_C:.c=.o)
OBJ_ASM = $(SRC_ASM:.S=.S)
OBJECTS = $(OBJ_C) $(OBJ_ASM)
TARGET = jp
GENERATED_ASM = $(SRC_C:main.c=.s)

.PHONY: all clean asm

all: $(TARGET)

asm: $(GENERATED_ASM)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^
	$(CC) -S -Xassembler -masm=intel main.c -o asm/$@.S

clean:
	rm -f $(TARGET) $(OBJECTS) $(GENERATED_ASM)