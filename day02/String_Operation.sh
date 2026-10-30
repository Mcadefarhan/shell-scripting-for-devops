#!/bin/bash

<<comment
Thi is an Example on
String Operation
comment

myVar="Hello Welcome to my World"
length=${#myVar}

#Converting all the string into upper charcahter
echo "Upper charchter String ... ${myVar^^}"

#Converting all the String into Lower Case
echo "Lower case ... ${myVar,,}"

#To replace a string 
new=${myVar/Welcome/Byee}
echo "new variable is ... $new" 

#Slicing in String
echo "After Slicing word is.. ${myVar:4:12}"
