#!/usr/bin/bash

ITERATIONS=299
SLEEP_TIME=0.5


for iteration in $(seq 1 $ITERATIONS);
do
    for interface in $(find eeproms/* -type d | sed 's/eeproms\///')
    do
        file=$(printf eeproms/$interface/$interface-%09d $iteration)
        if test -f "$file";
        then
            ln -sf ../$file interfaces/$interface
        fi
    done
    sleep $SLEEP_TIME
done
