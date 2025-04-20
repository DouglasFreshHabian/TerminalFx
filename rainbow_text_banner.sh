#!/bin/bash

function rainbow_text() {
    local text="$1"
    local length=${#text}
    for (( i=0; i<length; i++ )); do
        char="${text:$i:1}"
        color=$(( 160 + (i * 10) % 96 ))  # cycling through reds to purples
        printf "\e[38;5;%sm%s\e[0m" "$color" "$char"
    done
    echo
}

rainbow_text "Hello, colorful world!"
