#!/bin/bash

# Loop through log files and compress each one

for file in /var/log/*.log; do
    # Skip if the glob matched nothing or it's not a regular file
    [ -f "$file" ] || continue

    if gzip "$file"; then
        echo "Compressed $file"
    else
        echo "Failed to compress $file" >&2
    fi
done
