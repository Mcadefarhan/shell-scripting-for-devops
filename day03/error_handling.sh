#!/bin/bash

: <<comment
This is a example pf error handling 
comment

create_directory(){
	mkdir demo
}
if ! create_directory; then
	echo "THe code is being exited as the directory already exist"
	exit 1
fi
echo "File has been created"


