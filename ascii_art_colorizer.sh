#!/bin/bash

# Ensure figlet is installed
if ! command -v figlet &> /dev/null; then
    echo "Figlet not found, please install it!"
    exit
fi

# Get some ASCII art in rainbow colors
figlet "Art Time!" | while read line; do
    for i in {0..255}; do
        echo -e "\e[38;5;${i}m${line}\e[0m"
        sleep 0.1
    done
done
