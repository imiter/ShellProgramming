#!/bin/bash
#(실행 형식) makescript.sh tools.sh
# -> /root/scripts/tools.sh
#   #!/bin/bahs
# -> chmod 700 /root/scripts/tools.sh

if [ $# -ne 1 ] ; then
    echo " usage : $0 <scriptfile>"
    exit 1
fi

scriptfile=$1
scriptroot=/root/shell

cat << EOF > $scriptroot/$scriptfile
#!/bin/bash


EOF
chmod 700 $scriptroot/$scriptfile
