#!/bin/bash

max=5
for i in $(seq 1 $max )
do 
    for j in $(seq $(expr "$max" - "$i"))
    do
    echo -n " "
    done
    for k in $(seq 1 "$i")
    do
        echo -n "*"
    done
    echo
done