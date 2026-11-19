#!/bin/bash

# Check disk usage and alert if it exceeds 80%

THRESHOLD=80
USAGE=$(df -P / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}%"
else
    echo "Disk usage is normal: ${USAGE}%"
fi
