#!/bin/bash

text="ACCESS GRANTED"

while true; do
    glitched=""
    for (( i=0; i<${#text}; i++ )); do
        char="${text:$i:1}"
        if (( RANDOM % 5 == 0 )); then
            # Replace with random ASCII character
            glitched+="$(printf "\\x$(printf %x $((RANDOM % 93 + 33)))")"
        else
            glitched+="$char"
        fi
    done
    color=$(( RANDOM % 256 ))
    echo -ne "\e[38;5;${color}m$glitched\e[0m\r"
    sleep 0.07
done
