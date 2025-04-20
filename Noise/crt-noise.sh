#!/bin/bash

cols=$(tput cols)
lines=$(tput lines)

# Hide cursor and clean up on exit
tput civis
trap "tput cnorm; clear; exit" SIGINT

# Characters to use for noise
chars=('@' '#' '%' '&' '*' '+' '-' '=' '.' ' ')

# Center logo/prompt
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

# Pre-fill frame buffer
for ((i = 0; i < lines; i++)); do
    frame_buffer+=("$(generate_line)")
done

while true; do
    # Scroll frame buffer upward
    frame_buffer=("${frame_buffer[@]:1}")
    frame_buffer+=("$(generate_line)")

    clear

    for ((i = 0; i < lines; i++)); do
        # Print normally
        if [[ $i -eq $logo_line ]]; then
            # Print glowing logo over noise
            line="${frame_buffer[$i]}"
            prefix="${line:0:$logo_col}"
            suffix="${line:$((logo_col + ${#logo}))}"
            printf "\e[0;32m%s\e[1;92m%s\e[0;32m%s\e[0m\n" "$prefix" "$logo" "$suffix"
        else
            printf "\e[0;32m%s\e[0m\n" "${frame_buffer[$i]}"
        fi
    done

    sleep 0.07
done
