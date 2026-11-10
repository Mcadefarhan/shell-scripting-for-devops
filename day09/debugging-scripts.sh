#!/bin/bash

#We can enable the debugging of the script through which we can easly read the script how it works
set -x 

#to access the arguments
echo "Fist argument is $1"
echo "Second argument is $2"


echo "All the arguments are- $@"
echo "Number of arguments are- $#"
