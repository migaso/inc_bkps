#!/bin/bash

path=/change/to/target/files/dir

for i in $(ls bkp*) 
do
  echo "==="$i"==="
  tar -xvGf $i -C $path
done

ls -l $path 
