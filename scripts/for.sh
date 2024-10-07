#!/bin/bash

for var in A B C D
do  
    echo $var
done

for var in {1..10}
do
    echo $var
done

for var in $(seq 1 5)
do 
    echo $var 
done