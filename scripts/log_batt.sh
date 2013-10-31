#!/bin/sh
logfile=$1
for i in `seq 10000`
do
	echo "$i" >> $logfile
	adb shell dumpsys battery >> $logfile
	sleep 60 # 1 min = 1 * 60 sec
done
