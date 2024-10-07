  1 #!/bin/bash
  2 #(실행 형식) makescript.sh tools.sh
  3 # -> /root/scripts/tools.sh
  4 #   #!/bin/bahs
  5 # -> chmod 700 /root/scripts/tools.sh
  6 
  7 if [ $# -ne 1 ] ; then
  8     ehco " usage : $0 <scriptfile>"
  9     exit 1
 10 fi
 11 
 12 scriptfile=$1
 13 scriptroot=/root/shell
 14 
 15 cat << EOF > /root/$scriptroot/$scriptfile
 16 #!/bin/bash
 17 
 18 
 19 EOF
 20 chmod 700 $scriptroot/$scriptfile
~                                                                                                               
~                                                                                                               
~                                      
