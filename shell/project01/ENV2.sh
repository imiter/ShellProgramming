#!/bin/bash

set -e
source /root/shell/functions.sh
##################
# 1. $HOME/.bashrc
# 2. $HOME/.vimrc
# 3. ?
###################

echo
echo "[$HOME/.bashrc]"

bashrc=$HOME/bashrc.txt
# bashrc=$HOME/.bashrc

bashrc_setting $bashrc
#echo "[phase 01] $bashrc 파일 생성"
#/bin/cp /etc/skel/.bashrc $bashrc
#cat << EOF >> $bashrc

#
# Sfecific configuration
#
#export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'
#alias ls='ls -h -F -i --color=auto -h'
#alias vi='/usr/bin/vim'

#EOF
echo "[ ok ] $bashrc 설정 완료"

echo 

echo "[$HOME/.vimrc]"
# 2. $HOME/.vimrc
vimrc=$HOME/.vimrc
vimrc_setting $vimrc
#echo "[phase 02] $vimrc 파일 생성"
#cat << EOF >> $vimrc
#set ts=4
#set nu
#set ai
#syntax on
#set et
#EOF
echo "[ ok ] vimrc 설정 완료"
echo