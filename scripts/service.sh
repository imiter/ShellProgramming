#!/bin/bash
#service.sh start|stop httpd
# -> systemctl enable httpd
# -> systemctl restart httpd

if [ $# -ne 2 ] ; then
    echo "인자값: $0 <start|stop> UNIT"
    exit 1
fi
Action=$1
Unit=$2

Unit_start() {
    systemctl enable $Unit
    systemctl restart $Unit
    systemctl status $Unit
}

Unit_stop() {
    systemctl disable $Unit
    systemctl stop $Unit
    systemctl is-active $Unit
}

Exit() {
    echo " 의도치 않은 오류"
    exit 1
}

case $Action in
    start) Unit_start ;;
    stop) Unit_stop ;;
    *)    Exit ;;
esac