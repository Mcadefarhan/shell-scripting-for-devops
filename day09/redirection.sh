#!/bin/bash

#This is redirecting log using ping command
ping -c 3 www.google.com > redirect.log #redirect.log cat karne par ye print hoga

ls -l >> redirect.log # >> uses for Nothing from the previous content in the existing file will be deleted; the new content will simply be added to it
