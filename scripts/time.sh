#!/bin/bash

[ $# -eq 1 ] && iterations=$1 || iterations=3

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
for i in $(seq 1 $iterations); do
    echo "Iteration $i"
    rm -rf ../results/out/*
    ./check_security.sh > /dev/null 2> /dev/null
    file=../results/time/$(date "+%Y.%m.%d-%H.%M.%S")
    touch $file
    for x in ../results/out/*; do
	y=$(basename $x)
	printf "$y: " >> $file
	tail -1 $x | sed 's/[^0-9.]*//g' >> $file
    done
done
