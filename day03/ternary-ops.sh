#!/bin/bash

#This is an example of ternary operators
age=18
[[ $age -ge 18 ]] && echo "Adult" || echo "Minor"
