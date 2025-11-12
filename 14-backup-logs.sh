#!/bin/bash

#step0: cheking user excuting the script as sudo/root 
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
     echo "ERROR: Please excute the script as a sudo/root"
     exit 1
else 
     echo "running as a root user"
fi


#step1: usage function
usage(){
      echo "<script.sh> <source-dir> <dest-dir> [Days]"
      echo "source-dir is mandatory"
      echo "dest dir is mandatory"
      echo "days are optional filed"
      exit 1
}


#step2: Assigning arguments
SOURCE_DIR=$1
DEST_DIR=$2
DAYS="${3:-14}" #default 14 days if user not provide days


#step3: checking user is passing atleast 2 arguments while excuting the script

if [ $# -lt 2 ]
then 
     usage
fi 

#step4: cheking source dir exist or not 

if [ ! -d $SOURCE_DIR ]
then 
     echo "source directory $SOURCE_DIR does not exist"
     exit 1
fi

#step5:checking dest dir exist or not 

if [ ! -d $DEST_DIR ]
then 
    echo "dest dir $DEST_DIR does not exist"
    exit 1
fi

#step6: find the files older than 14 days

LOG_FILES=$(find "$SOURCE_DIR" -type f -name "*.log" -mtime +"$DAYS")

echo $LOG_FILES

if [ -z "$LOG_FILES" ]
then 
    echo "no log files found older than $DAYS days"
    exit 0
fi 


#step7: zip the files

TIMESTAMP=$(date +"%y%m%d_%H%M%S")
ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"


echo "zipping the files"

find "$SOURCE_DIR" -type f -name "*.log" -mtime +"$DAYS" | zip -@ "$ZIP_FILE"

if [ $? -ne 0 ]
then 
   echo "moving zip file from tmp to dest dir failed "
   exit 1
fi

#step9: verify dest dir zip files exist or not

if [ -f $DEST_DIR/$ZIP_FILE ]
then 
    echo "backup successful"
    while IFS= read -r line
    do 
        echo $line
        rm -rf $line
    done <<< $LOG_FILES
    echo "successfully deleted log files from source dir older than $DAYS days"
else
    echo "zip file not found in dest dir"
    exit 1
fi


   
