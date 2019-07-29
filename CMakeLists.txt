cmake_minimum_required(VERSION 3.14)
project(huff C)

set(CMAKE_C_STANDARD 99)

add_executable(huff main.c charcount.c lib/sort.c)