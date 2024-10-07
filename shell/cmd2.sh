#!/bin/bash

if [ $# -ne 0 ]; then
    echo "usage: $0 <cmd option args>"
    exit 1
fi

CMD="$*"

serverlist=/root/shell/server.list
cat << EOF > $serverlist

    172.16.6.227
    172.16.6.202
    172.16.6.250

EOF

for i in $(cat $serverlist)
do
    echo "---------------$i---------------"
    ssh "$i" "$CMD"
done