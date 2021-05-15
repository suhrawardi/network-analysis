#!/bin/sh

# souffle -F./input -D./output reachable.dl

# souffle -g reachable.cpp reachable.dl
# clang++ -std=c++17 -O3 reachable.cpp -o reachable

souffle -o analysis ./src/analysis.dl

cp ./input/nodes.csv ./input/nodes-intermediate.csv

for i in {1..5}
do
  echo "IterationL $i"
  time ./analysis -F ./input/ -D ./output
  mv ./output/out.csv ./output/out-$i.csv
  cp ./output/out-$i.csv ./input/nodes-intermediate.csv
done

time ./analysis -F ./input/ -D ./output
