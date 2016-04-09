#! /bin/sh
PSLOGFILE=~/var/log/pslog/pslog.log

date '+%Y/%m/%d %T' >> $PSLOGFILE
echo "  PID  %CPU STARTED                        UID USER            ARGS" >> $PSLOGFILE
#echo "exec command ps -eo pid,pcpu,lstart,uid,user,args | sort -rk 2,3 | head -n 6" >> $PSLOGFILE
ps -eo pid,pcpu,lstart,uid,user,args | sort -r -n -k 2,2 | head -n 5 >> $PSLOGFILE
echo "\n\n" >> $PSLOGFILE

