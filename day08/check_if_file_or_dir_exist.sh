#!/bin/bash

#Checking for a file if exist or not
file="/home/ubuntu/file.txt"

if [[ -f $file ]]
then 
    echo "File exist"
else
    echo "File does not exist !!! "
fi

#checking for a directory if exist or not
dir="/home/ubuntu/scripting"

if [[ -d $dir ]]
then 
    echo "The folder exist "
else
    echo "Folder does not exist "
fi
