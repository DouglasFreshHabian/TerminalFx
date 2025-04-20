#!/bin/sh

for color in $(seq 0 255); do
  # Print the color code with that background color
  printf "\033[48;5;%sm%3s\033[0m " "$color" "$color"

  # Newline every 16 colors for readability
  if [ $(( (color + 1) % 16 )) -eq 0 ]; then
    echo
  fi
done
