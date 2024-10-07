#!/bin/bash

##################
# 1. epel-release 패키지 설치
# 2. boxes, gcc, make 패키지 설치
# 3. ?
###################

set -e

source /root/shell/functions.sh

echo "[ 필요 패키지 설치 ]" 
# 1. epel-release 패키지 설치
pkgs="epel-release"
echo "[phase 01] $pkgs 패키지 설치"
pkgInstall $pkgs
echo "[ $pkgs 패키지 설치 완료]"
echo

# 2. boxes, gcc, make 패키지 설치
pkgs2="gcc boxes make"
echo "[phase 02] $pkgs2 패키지 설치"
pkgInstall $pkgs2
echo "[ $pkgs2 패키지 설치 완료]"