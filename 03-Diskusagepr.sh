#!/bin/bash 

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=6 

while IFS= read -r line 
do 
    USAGE=$(echo $line | grep xfs|awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    
    if [ $USAGE -ge $THRESHOLD ];
    then
        echo "$FOLDER exceeds the $THRESHOLD,current usage :$USAGE" 
    fi 
    
done <<<$DISK_USAGE

echo "This is a test mail & Date $(date)" | mail -s "message" narendra.h1b@gmail.com