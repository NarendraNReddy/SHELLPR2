#!/bin/bash 

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=6 

while IFS= read -r line 
do 
    USAGE=$(echo $line)
    echo $USAGE
done <<<$DISK_USAGE