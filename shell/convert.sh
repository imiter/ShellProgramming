#!/bin/bash
InputFile=/share/output.txt
OutputFile=/share/output.csv

cat $InputFile | while read ID NAME EMAIL PHONE ADDR
do
    echo "$ID,$NAME,$EMAIL,$PHONE,$ADDR" #>>  $OutputFile
done

cat $OutputFile