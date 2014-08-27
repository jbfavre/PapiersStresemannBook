#!/bin/bash

if [ $# -gt 1 ];
then
  scope="part"
  start=$1
  stop=$2
elif [ $# -eq 0 ];
then
  scope="all"
fi

for indice in $(seq -f "%05g" ${start} ${stop});
do
  if [ -f "bookocr/i${indice}.tif.txt" ];
  then
    sed ':a;N;$!ba;
         s/-\n//g;
         s/—\n//g;
         s/ \n/\n/g;
         s/\n\{2,\}/double_new_line/g;
         s/\n/ /g;
         s/double_new_line/\n\n/g;
         ' bookocr/i${indice}.tif.txt
  fi
done
