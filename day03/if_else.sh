#!/bin/bash

# Example of if else statement
read -p "Please enter your marks: " marks
if [ "$marks" -gt 40 ]
then
    echo "You are pass"
else
    echo "You are fail"
fi

# Example of if elif else statement
read -p "Please enter your age: " age
if [ "$age" -ge 18 ] && [ "$age" -le 30 ]
then
    echo "You will get 30% discount"
elif [ "$age" -gt 30 ] && [ "$age" -le 60 ]
then
    echo "You will get 20% discount"
else
    echo "You will get 10% discount"
fi
