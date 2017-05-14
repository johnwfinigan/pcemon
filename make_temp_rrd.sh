#!/bin/bash

rrdtool create cputemp.rrd \
--step '600' \
'DS:CPU_Temp_Celsius:GAUGE:1200:40:80' \
'RRA:MAX:0.5:1:1200' \
'RRA:MAX:0.5:50:1200'
