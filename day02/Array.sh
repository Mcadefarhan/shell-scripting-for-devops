#!/bin/bash

: <<comment
This is a Array Example
comment

#Array
myArray=( 1 2 Hello "Hey Man")

#Getting values from array
echo "${myArray[0]}"
echo "${myArray[1]}"

#For all the elements
echo "${myArray[@]}"

#How to find no. of values in an array
echo "Number of values, length of an array is ${#myArray[*]}"


#How to get specific values?
echo "${myArray[*]:1}"
echo "${myArray[*]:1:2}"
