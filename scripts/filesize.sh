#!/bin/bash

if [ $# -ne 1 ] ; then  ## $# => 인자의 갯수

echo "usage : $0 <filename>"
exit 1

fi

FileName=$1

FileSize=$(wc -c < $FileName)
#echo $FileSize

if [ "$FileSize" -gt 5120 ]  ; then
    echo "[ Info ] $FileName($FileSize) : big file."

else 
    echo "[ Info ] $FileName($FileSize) : small file."
fi