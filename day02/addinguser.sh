#!/bin/bash

read -p "Enter Username: " username

echo "You entered $username"

sudo useradd -m $username

echo "New User added"


