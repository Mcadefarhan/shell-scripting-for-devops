#!/bin/bash

# Remove SSH keys
rm -rf ~/.ssh/authorized_keys

# Clear user credentials and history
rm -rf ~/.aws/credentials
rm -rf ~/.git-credentials
rm -rf ~/.bash_history

# Clean system logs and temporary files
rm -rf /var/log/*
rm -rf /tmp/*
rm -rf /var/tmp/*

# Remove user accounts
deluser tempuser --remove-home

# Lock root account
passwd -l root

# Reset configuration files (example for Nginx)
rm -rf /etc/nginx/nginx.conf
