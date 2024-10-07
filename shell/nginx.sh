#!/bin/bash

set -e   ## 


# the file(functions.sh) laod
. /root/shell/functions.sh  # = ./root/shell/function.sh

# 1)  package  // nginx 설치
echo ; echo "[phase 01] complete install"
pkgInstall nginx

# 2)  /usr/share/nginx/html/index.html
echo ; echo "[Phase 02] setting of webservice"
RandomIndex "/usr/share/nginx/html/index.html" "MY nginx web server"
echo "[ O K ] 웹페이지가 정상적으로 생성되었습니다."

# 3) nginx.service -> webservice on(웹서비스 기동)
echo ; ServiceStart nginx.service
echo "[ O K ] 웹페이지가 정상적으로 기동되었습니다."



# 4) firewalld 
echo ; echo "[Phase 04] 방화벽 등록"
FwRule http https

#
# main function
#
