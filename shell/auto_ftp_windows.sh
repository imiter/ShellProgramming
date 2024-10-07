#!/bin/bash

ip=192.168.10.1
UNAME=user01
UPASS=user01

ftp -n "$ip" << EOF
user $UNAME $UPASS
cd test
lcd /test
bin
hash
prompt
mput testfile.txt
quit
EOF