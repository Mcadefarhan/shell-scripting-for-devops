#!/bin/bash

dice=$(( RANDOM % 6 + 1 ))  #Kisi bhi number ko 6 se divide karo to remainder sirf 0, 1, 2, 3, 4, 5 mein se hi aa sakta hai. Isse zyada kabhi nahi.
echo "Dice roll: $dice"
