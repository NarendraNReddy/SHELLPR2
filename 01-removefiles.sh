#!/usr/bin

SOURCE_DIRECTORY=/tmp/app-logs

if [ -d $SOURCE_DIRECTORY ];
then 
    echo "Dir exists"
else 
    echo "Dir not exists"    
fi 

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)



while IFS= read -r line
do 
    echo "removing the file:$line"
    rm -rf $line 

done <<< $FILES
