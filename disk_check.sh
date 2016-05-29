#! /bin/sh
TO="to のアドレス"

df -H | grep -E "/dev/disk0s2|vfstool" | awk '{print $5 " " $1}' | while read output;
do
    #echo $output
    usep=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
    partition=$(echo $output | awk '{print $2}')
    if [ $usep -ge 90 ]; then
        echo "Running out of space \"$partition ($usep%)\" on $(hostname) as of $(date)" | mail -s "Alert: Almost out of disk space $usep%" $TO
    fi
done

