#!/bin/bash

# Install a package if it isn't already installed

PKG="curl"

if ! command -v "$PKG" &> /dev/null; then
    echo "$PKG not found. Installing..."
    sudo apt-get update && sudo apt-get install -y "$PKG"
else
    echo "$PKG is already installed"
fi
