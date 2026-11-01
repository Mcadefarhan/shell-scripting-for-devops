#!/bin/bash

#Example of how to itrates value from a file

items="/home/ec2-user/new.txt"

for items in $(cat $items)
do
        echo $items
done

