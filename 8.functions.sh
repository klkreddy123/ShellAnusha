#!/bin/bash

FILENAME=$0
DATE=$(date +%F)
LOGFILE=/tmp/$FILENAME-$DATE.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failure $N"
        exit 1
    else
        echo -e "$2 is $G success $N"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Logged in user is not root user"
    exit 1
else
    echo "Logged in user is root user"
fi

yum install postfix -y &>>$LOGFILE 

VALIDATE $? "Installing postfix"

yum install nginx -y &>>$LOGFILE 

VALIDATE $? "Installing nginx"