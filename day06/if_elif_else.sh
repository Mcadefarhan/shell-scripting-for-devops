#!/bin/bash
# if-elif-else with numeric check
read -p "Whats your age? : " age

if [[ $age -le 5 ]]; then
    echo "YOu can not go outside "
elif [[ $age -gt 5 && $age -le 18 ]]; then
    echo "You can go outside but with your parents "
else
    echo "You can go alone outside "
fi
