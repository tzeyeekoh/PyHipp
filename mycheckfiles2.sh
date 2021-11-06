#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "Start Times"
find . -name "*.out" | xargs head -n 1

echo "End Times"
find . -name "*.out" | xargs tail -n 5