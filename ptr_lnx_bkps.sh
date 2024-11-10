#!/bin/bash

## customize
path=/change/to/target/files/dir
n_times=10
##

i=0
while [ $i -lt $(($n_times+1))  ]
do
  echo "==="$i"==="
  tar -xvGf bkp${i}.tgz -C $path
  i=$((i+1))
done

ls -l $path
