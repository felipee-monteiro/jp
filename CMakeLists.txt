cmake_minimum_required(VERSION 3.31)
project(untitled C)

set(CMAKE_C_STANDARD 23)

add_executable(untitled main.c
        include/libjp.h
        include/lexer.h
        include/tokenizer.h
        include/ds.h
        include/utils.h
)
