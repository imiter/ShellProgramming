#!/bin/bash

userlist=/root/shell/user.list

cat $userlist | while read Uname Upass
do
    useradd "$Uname"
    echo "$Upass" | passwd --stdin $Uname

done