#!/bin/bash


function date(num) {
    if [ $num -ne 2] ; then 
        echo "정확한 요구사항을 입력"
    else
        date
        exit 1
}




while true
do

echo "===================================================="
echo "  (1). who      (2). date     (3). pwd              "
echo "===================================================="

echo -n "1-3번 중 고르세요. "
read num

case $num in
    1) who ;;
    2) date(num) ;;
    3) pwd ;;
    *) echo "error"
        exit 1 ;; 
esac
done

