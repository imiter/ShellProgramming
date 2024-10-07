#!/bin/bash
##########################
# 
# *서비스 on/off*
#
##########################
set -e

source /root/shell/functions.sh

########################################
# 1. telnet 서비스
#  1) 패키지 설치 - telnet-server, telnet
#  2) 서비스 기동 - telnet.socket
#  3) 방화벽 등록 - telnet
########################################
# 2. vsftpd 서비스
#   1) 패키지 설치 - vsftpd, ftp 
#   2) 서비스 설정 - /etc/vsftpd/{ftpusers,user_list}
#   3) 서비스 기동 - vsftpd.service
#   4) 방화벽 등록 - ftp
########################################

### 기존에 함수 정의해놓은 functions.sh 에서 해당 함수 불러와서 사용

##telnet service package 설치##
echo "텔넷 서비스"
pkg_user="telnet-server telnet"
echo "[phase 01] $pkg_user 패키지 설치"
pkgInstall $pkg_user

echo 

##telnet service on/off##
svcs="telnet.socket"
echo "[phase 02] $svcs 서비스 기동"
ServiceStart $svcs
echo

##telnet 방화벽 ##
rules="telnet"
echo "[phase 03] $ruels 방화벽 등록"
FwRule $rules
echo

echo "텔넷 서비스"
##ftp package 설치##
pkg="vsftpd ftp"
echo "[phase 01] $pkg 패키지 설치"
pkgInstall $pkg
echo 

##ftp service root 설정##
ftpusers=/etc/vsftpd/ftpusers
user_list=/etc/vsftpd/user_list
echo "[phase 02] $ftpusers, $user_list 설정"
for i in $ftpusers $user_list
do
    sed -i 's/^root/#root/' $i
done
echo " [ ok ] root 사용자 허용 설정 완료 "

##vsftp service on/off##
svcs="vsftpd.service"
echo "[phase 03] $svcs 서비스 기동"
ServiceStart $svcs
echo

##telnet 방화벽 ##
rules="ftp"
echo "[phase 04] $ruels 방화벽 등록"
FwRule $rules
echo
