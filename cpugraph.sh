#!/bin/bash

while true; do
    usage=$((RANDOM % 100))
    bar=""
    for ((i=0; i<usage; i+=2)); do
        color=$((34 + (i * 3) % 100))
        bar+="$(echo -e "\033[38;5;${color}m#\033[0m")"
    done
    printf "\rCPU Usage: %3d%% [%s]" "$usage" "$bar"
    sleep 0.2
done
