#!/bin/bash

set -e   ## 


# the file(functions.sh) laod
. /root/shell/functions.sh  # = ./root/shell/function.sh

# 1)  package  // httpd, mod_ssl
echo ; echo "[phase 01] complete install"
pkgInstall httpd mod_ssl

# 2)  /var/www/html/index.html
echo ; echo "[Phase 02] setting of webservice"
RandomIndex "/var/www/html/index.html" "MY HTTPS web server"
echo "[ O K ] 웹페이지가 정상적으로 생성되었습니다."

# 3) httpd.service -> webservice on(웹서비스 기동)
echo ; ServiceStart httpd.service
echo "[ O K ] 웹페이지가 정상적으로 기동되었습니다."



# 4) firewalld 
echo ; echo "[Phase 04] 방화벽 등록"
FwRule http https

#
# main function
#
