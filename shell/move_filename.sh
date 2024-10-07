#!/bin/bash

D_WORK=/test       	# working directory
T_FILE1=/tmp/.tmp1  	# tempory file1

ls -1 $D_WORK | grep '.txt$' > $T_FILE1 # ls -1 : 해당 디렉토리의 이름만 뽑아서 
for FILE in `cat $T_FILE1`
do
    mv $D_WORK/$FILE `echo $D_WORK/$FILE | sed 's/.txt$/.els/g'`
done
