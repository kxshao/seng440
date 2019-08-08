#!/usr/bin/env bash
echo "encoder test"
time ./cmake-build-debug/hufe0 < text/in_CAPS.txt > /dev/null
time ./cmake-build-debug/hufe1 < text/in_CAPS.txt > /dev/null
time ./cmake-build-debug/hufe2 < text/in_CAPS.txt > /dev/null
echo "decoder test"
time ./cmake-build-debug/hufd0 < text/enc_with_table.txt > /dev/null
time ./cmake-build-debug/hufd1 < text/enc.txt > /dev/null
time ./cmake-build-debug/hufd2 < text/enc.txt > /dev/null
time ./cmake-build-debug/hufd3 < text/enc.bin > /dev/null
