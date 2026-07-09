#!/bin/bash

<<comment
This script is a for loop example script
comment

for((i=1; i<=5; i++));
do
	mkdir  demo$i
done
echo "Files has Been Created"

