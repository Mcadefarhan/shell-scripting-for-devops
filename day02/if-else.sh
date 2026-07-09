#!/bin/bash

<<comment
if else in shell scripting example
comment

read -p "Enter your age: " age

if [[ $age -ge 18 ]]
then
    echo "You are now eligible to vote"
else
    echo "You are not eligible to vote"
fi
