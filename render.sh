#!/bin/bash
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin

cd /home/mon/rrd || exit 

vnstati  -i enp1s0 -hs -o /var/www/html/vnstaths.png
vnstati  -i enp1s0 -d -o /var/www/html/vnstatd.png
vnstati  -i enp1s0 -m -o /var/www/html/vnstatm.png

rrdtool graph '/var/www/html/cputemp.png' \
--width '400' \
--height '100' \
--start end-1w \
'DEF:CPUT=cputemp.rrd:CPU_Temp_Celsius:MAX' \
'LINE1:CPUT#FF0066:CPU Degrees C'


rrdtool graph '/var/www/html/vmstat.png' \
--width '400' \
--height '200' \
--start end-1w \
'DEF:Z=vmstat.rrd:vmstat_proc_r:MAX' \
'LINE1:Z#0000FF:Runnable' \
'DEF:A=vmstat.rrd:vmstat_proc_b:MAX' \
'LINE2:A#8A2BE2:Unint Sleeping' \
'DEF:B=vmstat.rrd:vmstat_swap_si:MAX' \
'LINE3:B#DC143C:Swap in' \
'DEF:C=vmstat.rrd:vmstat_swap_so:MAX' \
'LINE4:C#8B0000:Swap out' \
'DEF:D=vmstat.rrd:vmstat_io_bi:MAX' \
'LINE5:D#008B8B:Block in' \
'DEF:E=vmstat.rrd:vmstat_io_bo:MAX' \
'LINE6:E#B8860B:Block out' \
'DEF:F=vmstat.rrd:vmstat_sy_in:MAX' \
'LINE7:F#FF8C00:Interrupts' \
'DEF:G=vmstat.rrd:vmstat_sy_cs:MAX' \
'LINE8:G#556B2F:Context Switches'



rrdtool graph '/var/www/html/vmstat_cpu.png' \
--width '400' \
--height '200' \
--start end-1w \
'DEF:Z=vmstat.rrd:vmstat_cpu_us:MAX' \
'LINE1:Z#0000FF:User' \
'DEF:A=vmstat.rrd:vmstat_cpu_sy:MAX' \
'LINE2:A#FF8C00:System' \
'DEF:B=vmstat.rrd:vmstat_cpu_id:MAX' \
'LINE3:B#006400:Idle' \
'DEF:C=vmstat.rrd:vmstat_cpu_wa:MAX' \
'LINE4:C#DC143C:IO wait' \
'DEF:D=vmstat.rrd:vmstat_cpu_st:MAX' \
'LINE5:D#B8860B:Steal'



rrdtool graph '/var/www/html/vmstat_mem.png' \
--width '400' \
--height '200' \
--start end-1w \
'DEF:Z=vmstat.rrd:vmstat_mem_free:MAX' \
'LINE1:Z#0000FF:Free' \
'DEF:A=vmstat.rrd:vmstat_mem_cache:MAX' \
'LINE2:A#FF8C00:Cache' \
'DEF:B=vmstat.rrd:vmstat_mem_buff:MAX' \
'LINE3:B#006400:Buffer' \
'DEF:C=vmstat.rrd:vmstat_mem_swpd:MAX' \
'LINE4:C#DC143C:Swapped' 
