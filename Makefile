CC = gcc
AS = gcc
CFLAGS = -O3 -march=native -flto -no-pie \
         -Wall -Wextra \
         -fomit-frame-pointer -fstrict-aliasing \
         -pipe -fno-stack-protector -fno-PIC \
         main.c

SRC_C = $(wildcard main)
OBJ_C = $(SRC_C:.c=.o)
OBJECTS = $(OBJ_C) 
TARGET = jp

.PHONY: all clean 

all: $(TARGET)

asm: $(GENERATED_ASM)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(TARGET) $(OBJECTS) 
