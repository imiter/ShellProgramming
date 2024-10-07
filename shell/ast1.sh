#!/bin/bash

##############
#


max=5

for i in $(seq 1 $max)
do
    num=$i
    blank_num=$(expr $max - $i)
    blank_num2=$(expr $i - 1)
    #echo $blank_num
    #echo "$blank_num : $num"
    for j in $(seq $blank_num )
    do
            echo -n "-"
            
    done
    for k in $(seq 1 $i) 
    do
        echo -n "*"   
    done
    for t in $(seq $(expr $blank_num2) )
    do
        echo -n "*"
    done
    echo

    

    
done