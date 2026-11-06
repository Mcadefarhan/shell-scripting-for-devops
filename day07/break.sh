
#!/bin/bash

read -p "PLease enter your number to search: " num
for i in {1..10}
do
        if [[ $num -eq $i ]]
        then
                echo "$num is found !!!!!!!"
                break
        fi
        echo "NUmber is $i "
done
