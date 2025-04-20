#!/bin/bash

# Display a 256-color gradient background bar
for i in {0..255}; do
    printf "\e[48;5;${i}m%3s\e[0m" "$i"
done
echo
