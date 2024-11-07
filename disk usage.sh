#!/bin/bash

diskusage=$(dF -hT | grep -vE 'tmp|file')
diskthreshold=1
message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $diskthreshold ]
    then
        message+="High Disk Usage on $partition: $usage <br>"
    fi
done <<< $diskusage

echo -e "$message"

sh gmail.sh "Devops Team" "High Disk Usage" "$message" "Jagadishvarma99@gmail.com" "High Disk Usage ALert"
