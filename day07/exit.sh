#!/bin/bash

if [[ $# -eq 0 ]]
then
        echo "Please provide arguments first "
        exit   #If there willl be no arguments given code will be exited
fi

echo "First argument $1"
echo "Other arguments are $@"
