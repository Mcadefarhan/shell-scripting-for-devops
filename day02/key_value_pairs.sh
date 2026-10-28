#!/bin/bash

#How to stpore the key values
declare -A array
array=( [name]=Farhan [age]=25 [city]=Patna )
echo "My name is ${array[name]} and my age is ${array[age]} and my city is ${array[city]}"

declare -A student
student=( [name] =Rehan [date_of_birth]=19-09-26 [school]=TMU )
echo "Student name is ${student[name]} and his date of birth is ${student[date_of_birth]} and his school name is ${student[school]}"

