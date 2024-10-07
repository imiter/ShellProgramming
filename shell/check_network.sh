#!/bin/bash

set -e
source /root/shell/functions.sh
################################
# 1. ping 192.168.10.2
# 2. ping 8.8.8.8
# 3. ping www.google.come
################################
read -p "핑 테스트할 ip or dns 를 입력해주세요" ping_ip
read -p "핑 테스트할 ip or dns 를 입력해주세요" ping_ip2
read -p "핑 테스트할 ip or dns 를 입력해주세요" ping_ip3

#read -p "핑 테스트할 dns 를 입력해주세요"
#ping_dns

# 1. 로컬 네트워크에 ping test
print_info "ping $ping_ip"

ping -c 2 -W 1 $ping_ip >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[  OK  ] Local Network Connection"
else
    print_error "[ FAIL ] Local Network Connection"
    
    cat << EOF
    
    (ㄱ) VMware >  Edit > Virtual Network Editor
    (ㄴ) VMware > VM > Settings > Network Adapter
    (ㄷ) # ifconfig 
EOF
    exit 1
fi

# 2. 외부 네트워크에 ping test

print_info "ping $ping_ip2"

ping -c 2 -W 1 $ping_ip2 >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[  OK  ] Local Network Connection"
else
    print_error "[ FAIL ] External Network Connection"
    
    cat << EOF
    # (ㄱ) ip route 
    # (ㄴ) netstat -nr
EOF
    exit 2
fi



# 3. 외부 이름에 ping test
print_info "ping $ping_ip3"

ping -c 2 -W 1 $ping_ip3 >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[  OK  ] DNS client configuration"
else
    print_error "[ FAIL ] DNS client configuration"
    
    cat << EOF
    # cat /etc/resolv.conf  
    # 
EOF
    exit 3
fi