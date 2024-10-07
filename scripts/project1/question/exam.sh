#!/bin/bash

num=1
basedir=$HOME/scripts/project1
tmp1=/tmp/tmp1
total_num=2
# $num: 문제 번호 
# $prob_file: 문제파일 
# $correct_num: 정답 번호 
ls -l $basedir/question/question*.txt > $tmp1

ProbView() {   ## 함수로 만들어서 위의 해당 경로 txt를 실행시킴 
    cat $1
}
#Correct_Num() {
#    cat $1
#}


while [ $num -le $total_num ]
do

    prob_num=$num
    #echo $prob_num ; read  ##1
    prob_file=$basedir/question/question$prob_num.txt
    ProbView $prob_file
    Correct_Num=$(cat $basedir/question/answer.txt \
                        | sed -n "${num}p" \
                        | awk -F: '{print $2}' )
    echo
    echo $Correct_Num
    echo
    echo -n "정답은? (1|2|3|4): "
    read answer
    #echo $answer
    #case $answers in 
    answer=$(echo "$answer" | xargs)
    Correct_Num=$(echo "$Correct_Num" | xargs)  ##shellscript 할때는 공백 오류 많음 변수 사용전에 이것 한번씩 

    if [ "$answer" = "$Correct_Num" ]; then
        echo "정답입니다,"
        num=$((num + 1)) ## == num +1
    else 
        echo "정답이 아닙니다 다시 선택해주세요."
    fi
        

done

echo "[ok] : 합격하였습니다."