#!/bin/bash

ftpusers=/etc/passwd

for name in $(cat $ftpusers | egrep -v '^#|^$' | awk -F {print $5})
do
    echo $name
done
