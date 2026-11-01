#!/bin/bash

#This loop will run untill the condition is wrong if the condition is right it will stop
a=10

# Loop until a equals 1
until [[ $a -eq 1 ]]; do
    echo "$a"
    a=$((a - 1))  # Arithmetic expansion
done
