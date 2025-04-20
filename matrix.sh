#!/bin/bash

# Matrix-style rain
cols=$(tput cols)
lines=$(tput lines)

# Create an array for column positions
for ((i=0; i<cols; i++)); do
    col_pos[i]=0
done

while true; do
    for ((i=0; i<cols; i++)); do
        # Random char
        char=$(printf "\\x$(printf %x $((RANDOM % 93 + 33)))")
        # Set color: green matrix style
        echo -ne "\e[2;32m\e[${col_pos[i]};${i}H$char\e[0m"
        # Update position
        col_pos[i]=$(( (col_pos[i]+1) % lines ))
    done
    sleep 0.05
done
