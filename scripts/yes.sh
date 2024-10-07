#!/bin/bash

YES() {
    echo
    echo "YES IN FUNCTION"
}

NO() {
    echo "NO"
}

FAIL() {
    echo "Fail"
    exit 1
}







echo -n "선택하세요!(y/n) : "
read etc

case $etc in
    yes | y | Yes | Y | YES) YES ;; 
    no | N | NO | n | No) NO ;;
    *) FAIL
esac