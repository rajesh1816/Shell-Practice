#!/bin/bash

FILES_TO_DELETE=$(find "source-dir/" -type f -name "*.log" -mtime +14)

while IFS= read -r line
do 
    echo $line
    rm -rf $line
done <<< $FILES_TO_DELETE
 