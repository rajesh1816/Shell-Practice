#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
   echo "you are running as a root"
else
   echo "non-root user"
fi