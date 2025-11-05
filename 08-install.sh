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

if [ $? -eq 1 ]
then 
    dnf install nginx -y
    if [ $? -eq 0 ]
    then 
       echo "installed successfully"
    else
       echo "installation failed"
       exit 1
    fi
else 
    echo "nginx already installed"
fi

dnf list installed mysql



       
