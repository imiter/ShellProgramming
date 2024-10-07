pkgInstall() {
    pkglist="$*"
    yum -q -y install $pkglist
    [ $? -eq 0 ] \
        && echo "[ OK ] $pkglist complete install" \
        || echo "[FAIL] $pkglist fail of install"

}
RandomIndex() {
    IndexFile="$1"
    messages="$2"
    file1=/root/shell/boxlist
    max_num=$(wc -l < $file1)
    random_num=$(($RANDOM% $max_num+1))
    boxstr=$(sed -n "${random_num}p" "$file1")
    
cat << EOF > "$IndexFile"

<pre>

$(echo "$messages" | boxes -d "$boxstr")

</pre>
EOF
}

ServiceStart() {
    svc="$1"
    systemctl restart "$svc" >/dev/null 2>1
    Return=$(systemctl is-active "$svc")
    if [ "$Return" = 'active'  ]; then
        echo "[ O K ] 정상적으로 $svc가 실행."
        systemctl enable "$svc" >/dev/null 2>1
    else
        echo "[fail] $svc 서비스가 실행 실패 "
    fi
}

FwRule() {
    rules="$*"          # http https > {http,https} 이런식으로 바꾸어야 firewall 등록가능
    custom_rule=$(echo $rules | sed -e 's/ /,/' -e 's/^/{/' -e 's/$/}/')
    
    fwcmd='firewall-cmd --permanent'
    
    for i in $rules
    do
        #if [ "$rules" -eq 1]; then 
        fwcmd="$fwcmd --add-service=${i}"
        
    done
    echo $fwcmd
    
    firewall-cmd --reload >/dev/null 2>&1
    echo "[ O K ] $* 방화벽에 등록되었습니다."

    #echo $custom_rule
}

bashrc_setting() {
    #bashrc=$HOME/bashrc.txt
    /bin/cp /etc/skel/.bashrc $bashrc
    cat << EOF >> $bashrc

    #
    # Sfecific configuration
    #
    export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'
    alias ls='ls -h -F -i --color=auto -h'
    alias vi='/usr/bin/vim'
EOF
}

vimrc_setting() {
    #vimrc=$HOME/.vimrc
    cat << EOF >> $vimrc
    set ts=4
    set nu
    set ai
    syntax on
    set et
EOF
}

function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}
