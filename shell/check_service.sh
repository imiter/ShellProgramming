#!/bin/bash

if [ $# -ne 2 ]; then
    echo "usage : $0 <ip1> <ip2>"
    exit 1
fi
server="$1"
remote="$2"



export LANG=en_US.UTF-8 
tmp1=/tmp/tmp1
tmp2=/tmp/tmp2
tmp3=/tmp/tmp3

ssh "$server"systemctl -t service | grep -v '^●' | awk '{print $1, $3}' | sed -n '2,/^LOAD/p' | sed '$d' >$tmp1

ssh "$server"systemctl -t service | grep '^●' | awk '{print $2, $4}' >> $tmp1



ssh "$remote" systemctl -t service | grep -v '^●' | awk '{print $1, $3}' | sed -n '2,/^LOAD/p' | sed '$d' >$tmp2

ssh "$remote"systemctl -t service | grep '^●' | awk '{print $2, $4}' >> $tmp2

diff $tmp1 $tmp2 > $tmp3

echo "----- $server -----"
cat $tmp3 | fgrep '<' | cut -c3-

echo

echo "----- $remote ------"
cat $tmp3 | fgrep '>' | cut -c3-
echo