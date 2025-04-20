#!/bin/sh

for bg in $(seq 0 255); do
  # Choose readable foreground color: white on dark bg, black on light bg
  if [ $bg -gt 231 ]; then
    fg=0
  else
    fg=15
  fi

  printf "\033[38;5;%sm\033[48;5;%sm %3s \033[0m " "$fg" "$bg" "$bg"

  if [ $(( (bg + 1) % 16 )) -eq 0 ]; then
    echo
  fi
done
