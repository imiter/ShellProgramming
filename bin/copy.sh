#!/bin/bash

echo "------------- main -------------"
ssh 192.168.10.10 $2
echo ; echo
echo "------------- server1 -------------"
ssh 192.168.10.20 $2
echo ; echo
echo "------------- server2 -------------"
ssh 192.168.10.30 $2
echo ; echo
