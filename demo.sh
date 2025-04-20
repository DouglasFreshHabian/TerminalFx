#!/bin/bash

# Define text styles
echo -e "\e[1mBold\e[0m"
echo -e "\e[3mItalic\e[0m"
echo -e "\e[4mUnderline\e[0m"
echo -e "\e[9mStrikethrough\e[0m"
echo -e "\e[1;3;4;9mBold Italic Underlined Strikethrough\e[0m"
echo

# Foreground color names and codes
colors=( "Black" "Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "White" )
for i in {0..7}; do
    echo -e "\e[3${i}m${colors[$i]}\e[0m"
done

echo

# Bright foreground colors
for i in {0..7}; do
    echo -e "\e[9${i}mBright ${colors[$i]}\e[0m"
done

echo

# Background color example
for i in {0..7}; do
    echo -e "\e[3${i};4${i}m${colors[$i]} on ${colors[$i]} background\e[0m"
done
