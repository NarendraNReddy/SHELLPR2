#!/bin/bash 

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=6 

while IFS= read -r line 
do 
    USAGE=$(echo $line | grep xfs|awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    echo $FOLDER
    
done <<<$DISK_USAGE