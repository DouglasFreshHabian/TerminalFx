#!/bin/bash

cols=$(tput cols)
lines=$(tput lines)

tput civis
trap "tput cnorm; clear; exit" SIGINT

# Characters to use for CRT-style noise
chars=('@' '#' '%' '&' '*' '+' '-' '=' '.' ' ')

# Easter pastel colors (foreground ANSI codes)
colors=(
    "38;5;218"  # pastel pink
    "38;5;151"  # mint green
    "38;5;225"  # lavender
    "38;5;229"  # pale yellow
    "38;5;159"  # baby blue
)

# Easter message and egg ASCII art
message="🐰  Happy Easter!  🐣"
#egg=(
#"		"
#"		"
#"		"
#"		"
#"		"
#"		"
#)

# Center positions
message_line=$((lines / 2 - 4))
egg_start_line=$((message_line + 2))
message_col=$(( (cols - ${#message}) / 2 ))

generate_line() {
    local line=""
    for ((j = 0; j < cols; j++)); do
        rand_char=$((RANDOM % ${#chars[@]}))
        rand_color=${colors[$((RANDOM % ${#colors[@]}))]}
        char="${chars[$rand_char]}"
        line+="\e[${rand_color}m$char\e[0m"
    done
    echo -e "$line"
}

while true; do
    clear
    for ((i = 0; i < lines; i++)); do
        # Center message
        if [[ $i -eq $message_line ]]; then
            printf "%*s\e[1;95m%s\e[0m\n" "$message_col" "" "$message"
        # Egg art lines
        elif (( i >= egg_start_line && i < egg_start_line + ${#egg[@]} )); then
            egg_line="${egg[$((i - egg_start_line))]}"
            egg_col=$(( (cols - ${#egg_line}) / 2 ))
            printf "%*s\e[1;93m%s\e[0m\n" "$egg_col" "" "$egg_line"
        # Flicker line (occasional inverted glitch)
        elif (( RANDOM % 25 == 0 )); then
            printf "\e[7;35m%s\e[0m\n" "$(generate_line)"
        else
            printf "%s\n" "$(generate_line)"
        fi
    done
    sleep 0.08
done
