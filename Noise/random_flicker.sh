#!/bin/bash

cols=$(tput cols)
lines=$(tput lines)

tput civis
trap "tput cnorm; clear; exit" SIGINT

chars=('@' '#' '%' '&' '*' '+' '-' '=' '.' ' ')
logo=">> ACCESS TERMINAL <<"
logo_line=$((lines / 2))
logo_col=$(( (cols - ${#logo}) / 2 ))
frame_buffer=()

generate_line() {
    local line=""
    for ((j = 0; j < cols; j++)); do
        rand=$((RANDOM % ${#chars[@]}))
        line+="${chars[$rand]}"
    done
    echo "$line"
}

for ((i = 0; i < lines; i++)); do
    frame_buffer+=("$(generate_line)")
done

while true; do
    frame_buffer=("${frame_buffer[@]:1}")
    frame_buffer+=("$(generate_line)")

    clear

    for ((i = 0; i < lines; i++)); do
        line="${frame_buffer[$i]}"
        
        # Random glitch effect
        if (( RANDOM % 30 == 0 )); then
            printf "\e[7;32m%s\e[0m\n" "$line"  # inverted
        elif [[ $i -eq $logo_line ]]; then
            prefix="${line:0:$logo_col}"
            suffix="${line:$((logo_col + ${#logo}))}"
            printf "\e[0;32m%s\e[1;92m%s\e[0;32m%s\e[0m\n" "$prefix" "$logo" "$suffix"
        else
            printf "\e[0;32m%s\e[0m\n" "$line"
        fi
    done

    sleep 0.07
done
