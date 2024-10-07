#!/bin/bash

if [ $# -ne 2 ]; then
    echo "usage: $0 source destination"
    exit 1
fi

src="$1"
dst="$2"

serverlist=/root/shell/server.txt

for i in $(cat $serverlist)
do
    echo "---------------$i---------------"
    scp "$src" "$i:$dst"
    echo "complete"
done