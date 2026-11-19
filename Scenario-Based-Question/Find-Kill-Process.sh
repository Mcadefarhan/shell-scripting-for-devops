#!/bin/bash

# Find and kill a process by name

process="nginx"

PIDS=$(pgrep -x "$process")

if [ -n "$PIDS" ]; then
    echo "Killing process $process (PID(s): $(echo $PIDS | tr '\n' ' '))"
    kill $PIDS        # SIGTERM first (graceful)
    sleep 2

    # Escalate only if anything is still running
    REMAINING=$(pgrep -x "$process")
    if [ -n "$REMAINING" ]; then
        echo "Still running, forcing kill..."
        kill -9 $REMAINING
    fi
else
    echo "Process $process not found"
fi
    
