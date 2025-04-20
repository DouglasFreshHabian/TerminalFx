#!/bin/bash

echo "256-color foreground demo:"
for i in {0..255}; do
  # New line every 16 colors
  [[ $((i % 16)) -eq 0 ]] && echo
  printf "\e[38;5;%sm%3s\e[0m " "$i" "$i"
done

echo -e "\n\n256-color background demo:"
for i in {0..255}; do
  [[ $((i % 16)) -eq 0 ]] && echo
  printf "\e[48;5;%sm %3s \e[0m" "$i" "$i"
done

echo
