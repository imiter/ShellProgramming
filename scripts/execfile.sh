#!/bin/bash

while true
do
echo -n " 실행가능한 파일의 이름을 적어주세요. : "
read FileName

if [ -x "$FileName" ] ; then
    $FileName

continue

elif [ -f "$FileName" ] ; then
    echo  " 파일 만 존재 합니다. 실행 권한 파일 이름: ($FileName)" 
    echo ""
    
continue

else 
    echo "찾을 수 없는 파일 입니다. 해당하는 파일을 다시 입력하세요"
    
fi

done 