#!/bin/bash

for i in {1..10}
do
        if (( $i%2 == 0 ))
then
        echo "Number $i is even"

else
        echo "Number is $i odd"
fi
done
