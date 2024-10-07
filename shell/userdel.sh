#!/bin/bash

userlist=/root/shell/user.list

cat $userlist | while read Uname Upass
do
    userdel -r "$Uname"
    > $userlist
    
    [ $? -eq 0 ] \
    && echo "[OK] 모든 사용자 삭제 완료." \
    || echo "[fail]"

done