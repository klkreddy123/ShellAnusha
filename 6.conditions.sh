#!/bin/bash

NUMBER1=$1

if [ $NUMBER1 -gt 100 ]
then
    echo "$NUMBER1 is greater than 100"
    #exit 1
else
    echo "$NUMBER1 is lesser than 100"
fi
