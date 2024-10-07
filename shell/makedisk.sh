#!/bin/bash

# 디스크 확인
if lsblk | grep -q "^sda"; then
    if lsblk | grep -q "cs-root"; then
        echo echo "/dev/sda가 존재합니다. sda를 제외하고 디스크 작업이 가능합니다."
    
    else 
        echo "sda에 운영체제가 동작하지 않습니다." 
    fi
else
    echo "/dev/sda가 다른 디스크로 돌아가고 있습니다. reboot"
    reboot
fi

echo
echo "---------partition work----------------"
echo

#if [ $# -ne 3 ]; then
#    echo "usage: $0 partition <count | partition1_size1 | partition2_size> "

#fi
#partition_count=$1
#partition_size1=$2
#partition_size2=$3
# 사용자에게 파티션 개수 입력 받기
read -p "파티션 개수를 입력하세요: " partition_count

# 사용자에게 파티션1의 크기 입력 받기
read -p "파티션1의 크기를 입력하세요 (예: 500M): " partition_size1

# 사용자에게 파티션2의 크기 입력 받기
read -p "파티션2의 크기를 입력하세요 (예: 1G): " partition_size2

# 사용자에게 파일 시스템 입력 받기
read -p "파일 시스템을 선택해 주세요. <xfs | ext4> " choice_filesystem 

# 입력된 값 출력
echo "partition_count : $partition_count"
echo "partition_size1 : $partition_size1"
echo "partition_size2 : $partition_size2"
echo "choice_filesystem : $choice_filesystem"


ehco ">>>>>>>>>>>파티션 생성 중>>>>>>>>>>"
if [ $partition_count -eq 1 ]; then
    parted /dev/sdb mklabel gpt
    parted /dev/sdb mkpart primary $choice_filesystem 0% $partition_size1
    if [$choice_filesystem = xfs]
            ; then
    fi 
    mkfs.$choice_filesystem /dev/sdb1
elif [ $partition_count -eq 2]; then
    if [ $choice_filesystem = ]
    parted /dev/sdb mklabel gpt
    parted /dev/sdb mkpart primary $choice_filesystem 0# $partition_size1
    parted /dev/sdb mkpart primary $choice_filesystem $partition_size2 100%       
else 
    echo "파티션 갯수 및 설정이 잘못되었습니다."
fi

echo ">>>>>>>>>>>파일 시스템 설정>>>>>>>>>>"
if [ $choice_filesystem = xfs ]; then 
    mkfs.$choice_filesystem /dev/sdb1
fi



