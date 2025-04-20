#!/bin/bash

echo "TrueColor (24-bit) gradient demo (horizontal RGB blend):"

for g in {0..255..8}; do
  for r in {0..255..8}; do
    b=$((255 - r))
    printf "\e[48;2;%d;%d;%dm " "$r" "$g" "$b"
  done
  echo -e "\e[0m"
done

echo -e "\nDone."
