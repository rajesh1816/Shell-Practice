#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
   echo "you are running as a root"
else
   echo "please run as a rootuser"
   exit 1
fi



dnf list installed nginx

