#!/bin/bash

FILENAME=$0
DATE=$(date +%F)
LOGFILE= /tmp/$FILENAME-$DATE.log
USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failure"
        exit 1
    else
        echo "$2 is success"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Logged in user is not root user"
    exit 1
else
    echo "Logged in user is root user"
fi

yum install postfix -y

VALIDATE $? "Installing postfix"

yum install nginx -y

VALIDATE $? "Installing nginx"