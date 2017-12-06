#!/bin/bash
# monitor the cpu/mem/io/net and top-mem/top-cpu

# intervals (minute)
min=1

# folder
folder=/data/monitor

if hash dstat 2>/dev/null; then
  echo 'exists dstat'
else
  echo 'no exists dstat,exit the process'
  exit
fi

time_sec=$[$min*60]
echo 'monitoring every '$min' minutes'

# cd to the folder
if [ ! -d "${folder}" ]; then
  mkdir $folder
fi
cd $folder

# new a file
host_name=`hostname`
time=`date "+%Y-%m-%d"`
file_name=$host_name-$time.csv
touch $file_name

echo 'the monitor file is '${folder}'/'${file_name}''
# execute the job
nohup dstat -tcmnr --top-cpu --top-mem --output $folder/$file_name $time_sec > /dev/null 2>&1 &
