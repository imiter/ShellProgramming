#!/bin/bash

# while 문
# 함수 사용
# case문 

Add() {
    local num1=$1
    local num2=$2
    local sum=$((num1 + num2))
    ehco "$num1 + $num2 = $sum"
}

Sub() {
    sub=$num1 - $num2
    return $sub
}

Multiple() {
    mul=$num1 \* $num2
    return $mul
}





while true
do
    
    echo -n "계산기 프로그램을 실행 합니다."
    echo -n "첫번째 숫자를 입력: "
    read num1
    echo -n "연산자를 선택해 주세요."
    read op
    echo -n "두번째 숫자를 입력: "
    read num2

    case $op in
        '+') Add() ;;
        '-') Sub() ;;
        'x') Multiple() ;;
        '/') Share() ;;
    esac
        

done