#!/bin/bash

# Backup destination folder
DEST="/home/user/backup"

# Folder nahi hai to bana do
mkdir -p "$DEST"

for filename in "$@"
do
    echo "Copying file...$filename"
    cp "$filename" "$DEST"
done
