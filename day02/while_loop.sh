#!/bin/bash

: <<comment 
This is a example of While loop

comment

num=0
while [ $num -le 5 ]
do
	echo "lol"
	((num++))
done

