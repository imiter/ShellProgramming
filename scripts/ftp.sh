#!/bin/bash

#function define#
Help() {
    cat << EOF
    !		debug		mdir		sendport	site
$		dir		mget		put		size
account		disconnect	mkdir		pwd		status
append		exit		mls		quit		struct
ascii		form		mode		quote		system
bell		get		modtime		recv		sunique
binary		glob		mput		reget		tenex
bye		hash		newer		rstatus		tick
case		help		nmap		rhelp		trace
cd		idle		nlist		rename		type
cdup		image		ntrans		reset		user
chmod		lcd		open		restart		umask
close		ls		prompt		rmdir		verbose
cr		macdef		passive		runique		?
delete		mdelete		proxy		send
EOF
}

Exit() {

    exit 1
}

Invalied() {
    echo "invalied commend"
}
Open() {
    echo -n "접속 하려고 하는 FTP 서버 IP: "
    read ip1
    #echo $ip1
    ftp $ip1
}

while true
do
    echo -n "Myftp> "
    read CMD
    
    case $CMD in
        'open') Open ;;
        'help') Help ;;
        'exit')      Exit ;;
        *)     Invalied ;;
    esac
done