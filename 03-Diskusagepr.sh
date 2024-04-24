#!/bin/bash 

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=6 
MESSAGE=""

while IFS= read -r line 
do 
    USAGE=$(echo $line | grep xfs|awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    
    if [ $USAGE -ge $THRESHOLD ];
    then
        MESSAGE+="$FOLDER exceeds the $THRESHOLD,current usage :$USAGE \n" 
    fi 
    
done <<<$DISK_USAGE

echo -e "$MESSAGE" | mail -s "message" narendra.h1b@gmail.com