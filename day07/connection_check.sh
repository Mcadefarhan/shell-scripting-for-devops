#!/bin/bash

read -p "Enter a website to check connection: " site
ping -c 2 $site

if [[ $? -eq 0 ]]   #" $? " This command gives 0 output if the last command is successful otherwise it will give another number
then
        echo "Connection have been established $site"
else
        echo "Connection have not been established!!!!!"
fi
