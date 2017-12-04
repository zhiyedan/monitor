#!/bin/bash
# monitor the cpu/mem/io/net and top-mem/top-cpu

# monitor time(minute)
min=5
time_sec=$min*60
echo 'monitor every '$time_sec' seconde'

folder=/home/zhiyedan/data/monitor

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

# execute the job
nohup dstat -tcmnr --top-cpu --top-mem --output $folder/$file_name $time_sec > /dev/null 2>&1 &

echo 'Running successfully'
