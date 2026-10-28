#!/bin/bash

: <<comment 
This is a example of user intercation
comment

echo "What is Your name? -"
read name 
echo "My name is $name"

#Second way 
read -p "What is your name " name
echo "My name is $name"
