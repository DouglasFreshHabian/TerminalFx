#!/bin/bash

# Animate text with rainbow
function animated_rainbow() {
    local text="$1"
    local length=${#text}
    while true; do
        for (( i=0; i<length; i++ )); do
            char="${text:$i:1}"
            color=$(( 160 + (i * 10) % 96 ))  # cycling through reds to purples
            echo -ne "\e[38;5;${color}m$char\e[0m"
        done
        echo -ne "\r"  # Clear the line
        sleep 0.1
    done
}

# Run the animated rainbow
animated_rainbow "Hello, colorful world!"
