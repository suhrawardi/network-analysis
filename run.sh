#!/bin/sh

# souffle -F./input -D./output reachable.dl

# souffle -g reachable.cpp reachable.dl
# clang++ -std=c++17 -O3 reachable.cpp -o reachable

souffle -o analysis ./src/analysis.dl

time ./analysis -F ./input/ -D ./output
