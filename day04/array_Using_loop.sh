#!/bin/bash
#arrays using loop
myArray=( 1 2 5 8 Farhan Kalim )
length=${#myArray[*]}
for (( i=0; i<$length; i++ ))
do
        echo "Value of array is ${myArray[i]}"
done
