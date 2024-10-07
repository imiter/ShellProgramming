#!/bin/bash

if [ $# -ne 3 ]; then
    echo "usage : $0 <directory> <source> <destination>"
    exit 1
fi

D_WORK="$1"       	# working directory
src=".$2"
dst=".$3"
T_FILE1=/tmp/.tmp1  	# tempory file1


ls -1 $D_WORK | find . | grep "${src}$" > $T_FILE1 # ls -1 : 해당 디렉토리의 이름만 뽑아서 
for FILE in `cat $T_FILE1`
do
    mv $D_WORK/$FILE `echo $D_WORK/$FILE | sed "s/${src}$/${dst}/g"`
done
