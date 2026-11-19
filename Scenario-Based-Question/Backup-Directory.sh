#!/bin/bash

# Back up a directory into a timestamped tar.gz archive

SRC="/var/www/html"
BACKUP_DIR="/backup"
DATE=$(date +%F_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Make sure the backup directory exists
mkdir -p "$BACKUP_DIR" || { echo "Cannot create $BACKUP_DIR" >&2; exit 1; }

# -C changes into the parent dir so the archive stores "html/..." not "var/www/html/..."
if tar -czf "$ARCHIVE" -C "$(dirname "$SRC")" "$(basename "$SRC")"; then
    echo "Backup created: $ARCHIVE"
else
    echo "Backup failed" >&2
    exit 1
fi
