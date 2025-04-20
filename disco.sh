#!/bin/bash

frames=('◐' '◓' '◑' '◒')
while true; do
    for i in "${frames[@]}"; do
        color=$(( RANDOM % 256 ))
        echo -ne "\e[38;5;${color}m$i DISCO MODE!\e[0m\r"
        sleep 0.1
    done
done
