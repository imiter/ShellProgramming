#!/bin/bash

ip=172.16.6.203
#
#auto telnet
#
Cmd() {
    sleep 2 ; echo 'root'
    sleep 0.5 ; echo 'centos'
    sleep 0.5 ; echo 'hostname'
    sleep 0.5 ; echo 'tar cvzf /tmp/linux203.tar.gz /home'
    sleep 0.5 ; echo 'exit'

}

Cmd | telnet $ip
#
#auto ftp
#
ftp -n $ip << EOF
    user root centos
    cd /tmp
    lcd /root
    bin
    hash
    prompt
    mget linux203.txt
    quit
EOF

echo
echo "-------result-------"
ls -l /root/linux*.txt