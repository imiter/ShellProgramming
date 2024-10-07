#!/bin/bash

userlist=/root/shell/user.list
> $userlist

for i in $(seq 50 100)
do
    echo "user$i    user$i" >> $userlist
done