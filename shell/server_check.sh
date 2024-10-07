#!/bin/bash
export LANG=en_US.UTP-8

#function#
paste() {
    enterLine=$1
    for i in $enterLine
    do
        enterLine="$enterLine $i"
    done
    echo $enterLine

}


#date 변수
date=$(date +'%F %T')

#name 변수
: <<EOF
yesno=
while [ "$yesno" != 'y' ]
do
echo
echo -n "작성자 이름(ex: Baik,SeungChan): "
read name 
echo ; echo "작성자 이름: $name"
echo -n "작성된 내용이 맞습니까? (y/n)"
read yesno
done
EOF
name='Mun,GH'

# os 변수
os=$(cat /etc/centos-release)

# KERNEL 변수
kernel=$(uname -sr)

# cpu
cpu_num=$(lscpu -e | tail -n +2 | wc -l)
cpu_type=$(echo $(cat /proc/cpuinfo | grep 'model name' | uniq | awk -F : '{print $2}' ))
cpu="$cpu_num ($cpu_type)"

#mem
mem=$(free -h | grep '^Mem:' | awk '{print $2}')

#disk count
disk=$(lsblk | grep 'disk' | wc -l)



cat <<EOF

Server Vul. Checker version 1.0

DATE: $date
NAME: $name


(1) Server Information
============================================
OS     : $os  
Kernel : $kernel 
CPU    : $cpu
MEM    : $mem 
DISK   : $disk
 
EOF



#network
netint=$(nmcli device | tail -n +2 | grep -v '^lo' | awk '{print $1}')
for i in $netint
do
    nic=$i
    ip=$(echo $(nmcli device show $i | grep 'IP4.ADDRESS\[.\]:' | awk -F: '{print $2}'))
    gw=$(echo $(nmcli device show $i | grep 'IP4.ROUTE\[2\]' | awk -F, '{print $2}' | awk -F= '{print $2}'))
    dnsLine=$(nmcli device show $i | grep '^IP4.DNS' | awk '{print $2}')
    dns=$(paste $dnsLine)
    cat << EOF
Network: $nic 
IP : $ip
GW : $gw
DNS: $dns

EOF

done


