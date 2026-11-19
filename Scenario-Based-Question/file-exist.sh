#!/bin/bash

<<comment
check if a file exist and create if not
comment

file="/tmp/test.txt"
if [ ! -f "$file" ]
then
    echo "File not found . creating...."
    echo "This is a new file" > "$file"
else
  echo "File already exist"
fi
