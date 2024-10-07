#!/bin/bash

# variable definitions#
passwd=/etc/passwd

Menu() {
cat << EOF


(관리 목록)
---------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
---------------------------------
EOF
}

UserAdd() {
   #userlist=/root/sc
    :

}

UserVerify() {
    cat << EOF
(사용자 확인)
------------------------------------
$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' $passwd | cat -n)
------------------------------------    
EOF
}

UserDel() {
    echo -n ""
}



while true
do
    Menu
    echo -n "선택 번호? (1|2|3|4) : "
    read num

    case $num in
        1) UserAdd      ;;
        2) UserVerify   ;;
        3) UserDel      ;;
        4) break ;;
        *) echo "해당 하는 숫자를 입력하세요 - 다시 선택" ;; 
    esac

done