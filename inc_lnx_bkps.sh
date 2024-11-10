#!/bin/bash

##customize
src=/change/from/origin/files/dir
path=/change/to/target/files/dir
script_path=/chage/to/dir/scripts/files
##
yr=$(date +"%Y")
path=$path/${yr}
mkdir -p $path
num=$(ls -l $path/bkp* | tail -1 | awk -F"bkp" '{print $3}' | cut -b1)
if [ -z $num ]; then
  num=-1
fi
n_num=$( echo "$num+1" | bc )

echo "=====================BKP_start====================================="
echo "taking incremental backup number:" $n_num
time tar -cvzf $path/bkp${n_num}.tgz -g $path/snapshot.snar $src
echo "=====================BKP_completed================================="
echo -e "\n"
echo "=====================BKP_summary==================================="
tar -tvvGf $path/bkp${n_num}.tgz

cp -p $script_path/restore_lnx_bkps.sh $path/

echo "=====================BKP_done==================================="
date
