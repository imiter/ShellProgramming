#!/bin/bash

start=200
end=230
net=172.16.6
result=/tmp/tmp1
>$result
for i in $(seq $start $end)
do
    ping -c 1 -W 0.5 $net.$i >/dev/null 2>&1
    if [ $? -eq 0 ]; then    
        echo "[ o k ] $net.$i " | tee -a $result
    else 
        echo "[ fail ] $net.$i " >> $result    
    fi
done




#while true
#do
#    ping -t $net.$i >/dev/null 2>&1
    