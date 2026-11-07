#!/bin/bash

#Checking if user is root or not
if [[ $UID -eq 0 ]]
then
    echo "User is root"
else
    exho "User is not root"
fi
