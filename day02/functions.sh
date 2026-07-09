#!/bin/bash

: <<comment
This is a Function Example
comment

#Function name
function age_check(){
echo "Enter Your age : "
read age 

if [[ $age -ge 18 ]]
then 
	echo "You are eligible to vote"
else 
	echo "You are not eligible to vote"
fi
}
age_check

