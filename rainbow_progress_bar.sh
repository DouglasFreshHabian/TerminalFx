#!/bin/bash

# Rainbow progress bar with dynamic color change
function rainbow_progress() {
    local total=50
    local progress=0
    while [ $progress -le $total ]; do
        local color=$(( 160 + (progress * 10) % 96 ))  # cycle through colors
        printf "\e[38;5;${color}m#\e[0m"
        ((progress++))
        sleep 0.05
    done
    echo -e "\nDone!"
}

rainbow_progress
