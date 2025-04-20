#!/bin/bash

trap "tput cnorm; clear; exit" SIGINT
tput civis

commands=(
  "nmap -A 192.168.1.1"
  "curl https://darknet/api/payload"
  "decrypt -k 9C4F... --force"
  "launch --override-protocols"
  "inject binary --stealth"
)

function glitch_line() {
  local text="$1"
  local out=""
  for (( i=0; i<${#text}; i++ )); do
    if (( RANDOM % 6 == 0 )); then
      out+=$(printf "\\x$(printf %x $((RANDOM % 93 + 33)))")
    else
      out+="${text:$i:1}"
    fi
  done
  echo -e "\e[38;5;$((RANDOM%255))m$out\e[0m"
}

function type_command() {
  local cmd="$1"
  for ((i=0; i<${#cmd}; i++)); do
    echo -ne "\e[1;32m${cmd:$i:1}\e[0m"
    sleep 0.03
  done
  echo
  sleep 0.3
  glitch_line ">> Executing..."
  sleep 0.2
  glitch_line "[STATUS] SUCCESS"
  echo
}

function live_metrics() {
  echo -e "\e[1;34mSystem:\e[0m $(uptime -p)"
  echo -e "\e[1;34mCPU Load:\e[0m $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
  echo -e "\e[1;34mMem:\e[0m $(free -h | awk '/^Mem/ {print $3 "/" $2}')"
  echo -e "\e[1;34mIP:\e[0m $(hostname -I)"
}

bargraph() {
  local label="$1"
  local value=$2
  local max=50
  local blocks=$((value * max / 100))
  local bar=""

  for ((i=0; i<blocks; i++)); do
    color=$((34 + (i * 3) % 100))
    bar+=$(printf "\033[38;5;%sm#\033[0m" "$color")
  done

  # Display label, percentage, and colorized bar
  printf "%-15s [%3d%%] %b\n" "$label" "$value" "$bar"
}

function countdown_timer() {
  echo -e "\e[1;31mINITIATING SELF-DESTRUCT SEQUENCE...\e[0m"
  for i in {5..1}; do
    echo -ne "\e[1;31m$i...\e[0m\r"
    sleep 1
  done
  echo -e "\n\e[1;91m💥 BOOM 💥\e[0m System compromised. (Just kidding.)"
  sleep 2
}

# MAIN LOOP
while true; do
  clear
  echo -e "\e[1;32m╔═══════════ 👁 GOD MODE INTERFACE 👁 ═══════════╗\e[0m"
  echo -e "\e[1;32m║ Interactive Cyber Terminal - Hacker Edition 🧠 ║\e[0m"
  echo -e "\e[1;32m╚════════════════════════════════════════════════╝\e[0m"
  echo
  live_metrics
  echo
  bargraph "Network Util" $((RANDOM % 100))
  bargraph "CPU Usage" $((RANDOM % 100))
  bargraph "Memory Load" $((RANDOM % 100))
  echo
  echo -e "\e[1;36m>> Simulated Command Console:\e[0m"
  type_command "${commands[$RANDOM % ${#commands[@]}]}"
  echo -e "\n\e[2;32m[Running diagnostics... hold tight]\e[0m"
  sleep 1
done
