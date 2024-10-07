#!/bin/bash

basedir=/test
[ -d $basedir ] && rm -rf $basedir/*

echo "생성할 폴더의 갯수를 정해주세요"
echo
read max
for i in $(seq 1 $max )
do
    mkdir -p $basedir/$i
    for j in $(seq 1 $max)
    do
    mkdir -p $basedir/$i/$j
    done
done