#!/bin/bash

serverList=/root/shell/server.txt

for i in $(cat $serverList)
do
    ftp -n "$i" << EOF
    user root centos
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput linux203.txt
    quit
EOF

done