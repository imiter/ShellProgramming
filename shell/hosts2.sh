#!/bin/bash

# Host=/etc/hosts
hosts=/root/shell/hosts
NET=172.16.6
ip1=$(ip addr show ens192 | grep 'inet ' | awk '{print $2}' | awk -F/ '{print $1}'| awk -F. '{print $4}')
echo $ip1


for i in $(seq 200 300)
do
    #echo $i
    #if [ $i -eq $ip1 ]; then
    #    continue
    #fi
    ## if문 대체 
    [ $i -eq $ip1 ] && continue

    echo "$NET.$i linux$i.exmaple.com linux$i" >> $hosts
done