#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
   echo "you are running as a root"
else
   echo "please run as a rootuser"
   exit 1
fi

#nginx installation
dnf list installed nginx

if [ $? -eq 1 ]
then 
    dnf install nginx -y
    if [ $? -eq 0 ]
    then 
       echo "nginx installed successfully"
    else
       echo "nginx installation failed"
       exit 1
    fi
else 
    echo "nginx already installed"
fi


# mysql installation
dnf list installed mysql

if [ $? -eq 1 ]
then 
    dnf install mysqlbbbh -y
    if [ $? -eq 0 ]
    then 
       echo "mysql installed successfully"
    else
       echo "mysql installation failed"
       exit 1
    fi
else 
    echo "mysql already installed"
fi





       
