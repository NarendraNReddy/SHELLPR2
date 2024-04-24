#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=6


while IFS= read -r line 
do 
    USAGE=$($DISK_USAGE | awk -F " " 'print {$6F}')
    echo $USAGE
done <<<$DISK_USAGE
