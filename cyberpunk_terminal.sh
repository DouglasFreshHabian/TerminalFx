#!/bin/bash

tput civis
trap "tput cnorm; clear; exit" SIGINT

draw_scanlines() {
  cols=$(tput cols)
  lines=$(tput lines)
  for ((i=1; i<lines; i++)); do
    if (( i % 2 == 0 )); then
      printf "\e[2;32m%${cols}s\e[0m\n" " "
    else
      printf "\n"
    fi
  done
}

render_header() {
  echo -e "\e[1;32m╔════════════════════════════════════╗"
  echo -e "║   CYBERPUNK TERMINAL INTERFACE 🧠  ║"
  echo -e "╚════════════════════════════════════╝\e[0m"
}

fake_hack_output() {
  cmds=("nmap -sV 10.0.0.1"
        "accessing: /etc/shadow"
        "injecting shellcode..."
        "decrypting payload..."
        "establishing reverse shell...")

  for cmd in "${cmds[@]}"; do
    printf "\e[38;5;$((RANDOM % 150 + 50))m> $cmd...\e[0m\n"
    sleep 0.3
  done
}

real_sys_info() {
  uptime_info=$(uptime -p)
  load_avg=$(uptime | awk -F'load average: ' '{print $2}')
  echo -e "\e[1;34mSystem Uptime:\e[0m $uptime_info"
  echo -e "\e[1;34mLoad Average:\e[0m $load_avg"
}

ping_scan() {
  for i in {1..10}; do
    dots=$(printf '%*s' $((i % 4)) | tr ' ' '.')
    printf "\r\e[38;5;$((30 + i * 2))mPinging target 192.168.0.${i} $dots\e[0m"
    sleep 0.2
  done
  echo
}

glitch_text() {
  text="ACCESS GRANTED"
  glitched=""
  for (( i=0; i<${#text}; i++ )); do
    char="${text:$i:1}"
    if (( RANDOM % 5 == 0 )); then
      glitched+="$(printf "\\x$(printf %x $((RANDOM % 93 + 33)))")"
    else
      glitched+="$char"
    fi
  done
  color=$(( RANDOM % 256 ))
  echo -e "\e[38;5;${color}m$glitched\e[0m"
}

main_loop() {
  while true; do
    clear
    render_header
    echo
    fake_hack_output
    echo
    real_sys_info
    echo
    ping_scan
    echo
    glitch_text
    echo
    draw_scanlines
    sleep 1
  done
}

main_loop
