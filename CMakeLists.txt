cmake_minimum_required(VERSION 3.31)
project(untitled C)

set(CMAKE_C_STANDARD 23)

add_executable(untitled main.c
        include/json-parser.h
        include/lexer.h
)
