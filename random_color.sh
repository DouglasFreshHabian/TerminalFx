#!/bin/bash

# Random color 256 (16–231 is safest for vivid colors)
color=$(( RANDOM % 216 + 16 ))
message=${1:-"🌈 Random Color Vibes!"}

echo -e "\e[38;5;${color}m${message}\e[0m"
