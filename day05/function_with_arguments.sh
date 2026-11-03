#!/bin/bash
#how to use arguments in functions

adding(){
        num1=$1
        num2=$2
        let sum=$num1+$num2

        echo "Sum of $num1 and $num2 is $sum"
}

adding 5 10

