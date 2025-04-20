#!/bin/bash

cols=$(tput cols)
lines=$(tput lines)

tput civis
trap "tput cnorm; clear; exit" SIGINT

# Pastel colors (256-color codes)
colors=(
    "38;5;218"  # pastel pink
    "38;5;151"  # mint green
    "38;5;225"  # lavender
    "38;5;229"  # pale yellow
    "38;5;159"  # baby blue
)

# Egg ASCII (3 lines tall)
egg_art=(
"  __  "
" /  \\ "
" \\__/ "
)
egg_height=${#egg_art[@]}
egg_width=${#egg_art[0]}

# Characters for CRT noise
chars=('@' '#' '%' '&' '*' '+' '-' '=' '.' ' ')

# Number of eggs to bounce
egg_count=5

# Initialize egg positions and velocities
declare -a egg_x egg_y vel_x vel_y color_idx

for ((i = 0; i < egg_count; i++)); do
    egg_x[$i]=$(( RANDOM % (cols - egg_width) ))
    egg_y[$i]=$(( RANDOM % (lines - egg_height - 1) ))
    vel_x[$i]=$(( RANDOM % 2 == 0 ? 1 : -1 ))
    vel_y[$i]=$(( RANDOM % 2 == 0 ? 1 : -1 ))
    color_idx[$i]=$(( RANDOM % ${#colors[@]} ))
done

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

# Frame buffer for background noise
declare -a frame_buffer

for ((i = 0; i < lines; i++)); do
    frame_buffer[i]="$(generate_line)"
done

while true; do
    # Scroll noise background upward
    frame_buffer=("${frame_buffer[@]:1}")
    frame_buffer+=("$(generate_line)")

    clear

    # Draw background noise
    for ((i = 0; i < lines; i++)); do
        echo -e "${frame_buffer[$i]}"
    done

    # Draw bouncing eggs
    for ((i = 0; i < egg_count; i++)); do
        x=${egg_x[$i]}
        y=${egg_y[$i]}
        color="\e[${colors[${color_idx[$i]}]}m"

        for ((j = 0; j < egg_height; j++)); do
            if (( y + j >= 0 && y + j < lines )); then
                tput cup $((y + j)) $x
                printf "${color}${egg_art[$j]}\e[0m"
            fi
        done

        # Update egg position
        ((egg_x[$i] += vel_x[$i]))
        ((egg_y[$i] += vel_y[$i]))

        # Bounce off walls
        (( egg_x[$i] <= 0 || egg_x[$i] >= cols - egg_width )) && (( vel_x[$i] *= -1 ))
        (( egg_y[$i] <= 0 || egg_y[$i] >= lines - egg_height )) && (( vel_y[$i] *= -1 ))

        # Cycle colors
        (( color_idx[$i] = (color_idx[$i] + 1) % ${#colors[@]} ))
    done

    sleep 0.08
done
