#!/bin/bash

: <<'comment'
This is an example of case
comment

echo "Hey, choose an option"
echo "a = to see the current date"
echo "b = list all the files in the current directory"
read -p "Your choice: " choice

case "$choice" in
    a|A) date ;;    #A gives “Not a valid input”. You can allow both with a|A).
    b|B) ls ;;      #B gives “Not a valid input”. You can allow both with a|B).
    *) echo "Not a valid input!" ;;
esac


#Other example
echo "Please choose your option"
echo "1 = for Sunday"
echo "2 = for Monday"
echo "3 = for Tuesday"
echo "4 = for Wednesday"
echo "5 = for Thursday"
echo "6 = for Friday"
echo "7 = for Saturday"

read -p "Your choice: " days

case "$days" in
    1) echo "Sunday" ;;
    2) echo "Monday" ;;
    3) echo "Tuesday" ;;
    4) echo "Wednesday" ;;
    5) echo "Thursday" ;;
    6) echo "Friday" ;;
    7) echo "Saturday" ;;
    *) echo "Not a valid input!" ;;
esac
