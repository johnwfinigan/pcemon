#!/bin/bash


#procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
# r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
# 1  0      2   1621      0   1168    0    0     5    76   35   74  2  1 95  2  0
# 1  2      3    4        5   6       7    8     9    10   11   12  13 14 15 16 17 




rrdtool create vmstat.rrd \
--step '600' \
'DS:vmstat_proc_r:GAUGE:1200:0:500' \
'DS:vmstat_proc_b:GAUGE:1200:0:500' \
'DS:vmstat_mem_swpd:GAUGE:1200:0:4096' \
'DS:vmstat_mem_free:GAUGE:1200:0:4096' \
'DS:vmstat_mem_buff:GAUGE:1200:0:4096' \
'DS:vmstat_mem_cache:GAUGE:1200:0:4096' \
'DS:vmstat_swap_si:GAUGE:1200:0:500' \
'DS:vmstat_swap_so:GAUGE:1200:0:500' \
'DS:vmstat_io_bi:GAUGE:1200:0:500' \
'DS:vmstat_io_bo:GAUGE:1200:0:500' \
'DS:vmstat_sy_in:GAUGE:1200:0:500' \
'DS:vmstat_sy_cs:GAUGE:1200:0:500' \
'DS:vmstat_cpu_us:GAUGE:1200:0:100' \
'DS:vmstat_cpu_sy:GAUGE:1200:0:100' \
'DS:vmstat_cpu_id:GAUGE:1200:0:100' \
'DS:vmstat_cpu_wa:GAUGE:1200:0:100' \
'DS:vmstat_cpu_st:GAUGE:1200:0:100' \
'RRA:MAX:0.5:1:1200' \
'RRA:MAX:0.5:50:1200'


