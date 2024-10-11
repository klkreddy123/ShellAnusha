#!/bin/bash
DATE=$(date +%F)
SCRIPTNAME=$0
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "logged in user is not root user. Please login as root user"
    exit 1
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql is failure"
    exit 1
else
    echo "installation is sucess"
fi
