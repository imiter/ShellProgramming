#!/bin/bash

if [ $# -ne 2 ] ; then

    echo "인자 값 : $0 <pattern> <filename>"
    exit 1
fi
Pattern="$1" ##위의 $0 이외 인자 값이 $1으로 저장
Filename="$2"

Count=$(wc -l $Filename)
grep "$Pattern" "$Filename" > /dev/null 2>&1
if [ $? -eq 0 ] ; then
    
    echo " ok  and count  = $Count "
else 
    echo " fail " 
fi
