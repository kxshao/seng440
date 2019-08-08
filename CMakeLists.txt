cmake_minimum_required(VERSION 3.14)
project(huff C)

set(CMAKE_C_STANDARD 99)

add_executable(hufe huff_enc.c)
add_executable(hufd huff_dec.c)
add_executable(hufe0 huff_enc_0_unoptimized.c)
add_executable(hufd0 huff_dec_0_unoptimized.c)
add_executable(hufe1 huff_enc_1_pre_weights.c)
add_executable(hufd1 huff_dec_1_pre_weights.c)
add_executable(hufe2 huff_enc_2_cache.c)
add_executable(hufd2 huff_dec_2_cache.c)