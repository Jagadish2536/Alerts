#!/bin/bash

SOURCE="/tmp/logs"
if [ ! -d $SOURCE ]
then
    echo "source directory is not exist"
    exit 1
fi

Delete=$(find $SOURCE -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "deleting file: $line"
    rm -rf $line
done <<< $Delete