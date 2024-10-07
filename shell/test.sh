#!/bin/bash



# 변수 percentage 
# 변수 '=' count 갯수 증가  
num=1
percentage=10

while [ $num -le 10 ]
do

    while [ $percentage -le 100 ]
    do
        echo  "$percentage%"
        #num=$(echo -ne '=')
        sleep 1
        percentage=$(expr $percentage + 10 )
        
    done
        echo -ne '='
        sleep 1
        num=$(expr $num + 1)
        
    #for j in $(seq $percent_num 100)
    #do
    #percent_num=$(expr $percentage + 10)
    #sleep 1
    #echo -ne "$percent_num% |"
    
    #done
    #echo -ne "="
    #sleep 1
done
echo -ne '| complete'