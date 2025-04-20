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

# Boot-up text
boot_sequence=(
  "[ OK ] Initializing boot sector..."
  "[ OK ] Verifying system memory..."
  "[ OK ] Mounting neural interface..."
  "[ OK ] Establishing uplink..."
  "[ OK ] Starting user session..."
  ""
  "Welcome to Fresh Forensics v3.9"
  "Press any key to continue..."
)

# Display boot-up lines one at a time
clear
for line in "${boot_sequence[@]}"; do
    printf "\e[1;32m%s\e[0m\n" "$line"
    sleep 0.6
done

read -n 1 -s  # Wait for any key
clear

# Now enter noise loop
for ((i = 0; i < lines; i++)); do
    frame_buffer+=("$(generate_line)")
done

while true; do
    frame_buffer=("${frame_buffer[@]:1}")
    frame_buffer+=("$(generate_line)")

    clear

    for ((i = 0; i < lines; i++)); do
        if [[ $i -eq $logo_line ]]; then
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
