#!/bin/bash

while : 
do
    ehco
    ehco -n "점(.)으로 시작하는 파일의 목록 볼 때 사용하는 ls 명령의 옵션은?"
    ehco 
    ehco -n "====(1-4 num 사이의 숫자를 선택 하세요)===="
    read correct
    
    if [ $correct=1 ]; then 
    echo "w

