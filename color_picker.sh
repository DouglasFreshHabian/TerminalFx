#!/bin/bash

echo -e "🎨 \e[1mTerminal Color Picker (256 colors)\e[0m"
echo "Enter color code (0-255) to preview. Type 'exit' to quit."

while true; do
    read -p "Color code: " input
    [[ "$input" == "exit" ]] && break

    if [[ "$input" =~ ^[0-9]+$ ]] && [ "$input" -ge 0 ] && [ "$input" -le 255 ]; then
        echo -e "\e[38;5;${input}m Sample text in color ${input} \e[0m"
    else
        echo "❌ Invalid input. Enter a number between 0–255."
    fi
done
