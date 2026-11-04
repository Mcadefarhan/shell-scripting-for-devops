#!/bin/bash

echo "Hey, choose an optin"
echo "+ = for the Addition"
echo "- = for the Substraction"
echo "x = for the Multiplication"
echo "/ = for the Division"

read -p "Your choice: " choice

#Function to perform Addition
addition(){
        a=$1
        b=$2

        let c=$a+$b

        echo "Sum of two number $a and $b is $c "
}

#Function to perform Substraction
substraction(){
        a=$1
        b=$2

        let c=$a-$b

        echo "Substraction of two number $a and $b is $c "
}



#Function to perform Multiplication
multiplication(){
        a=$1
        b=$2

        let c=$a*$b

        echo "Multiplication of two number $a and $b is $c "
}

#Function to perform Division
Divison(){
        a=$1
        b=$2

        let c=$a/$b

        echo "Divison of two number $a and $b is $c "
}

case "$choice" in
    +) addition 4 6  ;;   
    -) substraction 10 7 ;;      
    x) multiplication 2 4 ;;
    /)Divison 10 5 ;;
    *) echo "Invalid Option !" ;;


esac

                    
