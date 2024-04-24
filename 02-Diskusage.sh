#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=6


while IFS= read -f line 
do 
    echo $line
done <<<$DISK_USAGE
