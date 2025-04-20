#!/bin/bash

function rainbow_clock() {
    while true; do
        now=$(date +"%H:%M:%S")
        output=""
        for (( i=0; i<${#now}; i++ )); do
            char="${now:$i:1}"
            color=$(( (i * 36 + $(date +%s)) % 256 ))
            output+="\e[38;5;${color}m${char}\e[0m"
        done
        echo -ne "\r${output}"
        sleep 1
    done
}

rainbow_clock
