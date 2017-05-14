#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin
umask 0077

if [ ! -d /dev/shm/mon ] ; then
	mkdir /dev/shm/mon
	cp /home/mon/rrd/*.rrd  /dev/shm/mon/
fi

cd /dev/shm/mon || exit
counter=0

while true ; do 

#sensors | grep temp1 | sed -e "s/[+°C]//g" | awk '{print "rrdtool update cputemp.rrd N:" $2}' | bash
sensors_out=$(sensors | grep temp1 | sed -e "s/[\s\+]/°/g" | cut -d'°' -f2)
rrdtool update cputemp.rrd N:"$sensors_out"

vmstat_out=$(vmstat -SM | tail -1 | sed -e"s/\s\+/:/g")
rrdtool update vmstat.rrd N"$vmstat_out"







if [ $counter -gt 60 ] ; then
	counter=0
	cp /dev/shm/mon/*.rrd /home/mon/rrd/
	/home/mon/mon/render.sh
else
	counter=$(($counter+1))
fi
sleep 60
done





