#!/bin/bash

# Hide cursor, trap cleanup
tput civis
trap "tput cnorm; clear; exit" SIGINT

# Sample table data
headers=("ID" "NAME" "LEVEL" "STATUS")
rows=(
  "001 Neo        99 ACTIVE"
  "002 Trinity    98 ACTIVE"
  "003 Morpheus   95 OFFLINE"
  "004 AgentSmith 100 MALICIOUS"
)

# Dashboard loop
while true; do
  clear
  cols=$(tput cols)
  now=$(date "+%H:%M:%S %p")
  usage=$((RANDOM % 100))

  echo -e "\e[1;32m╔══════════════ HACKER DASHBOARD ══════════════╗\e[0m"
  echo -e "\e[1;32m║ Time: ${now}                                      ║\e[0m"
  echo -e "\e[1;32m╚═══════════════════════════════════════════════╝\e[0m"
  echo

  # Matrix-style Table
  echo -e "\e[1;32m+------+------------+-------+-----------+"
  printf "\e[1;32m| %-4s | %-10s | %-5s | %-9s |\n" "${headers[@]}"
  echo -e "+------+------------+-------+-----------+\e[0m"
  for row in "${rows[@]}"; do
      printf "\e[2;32m| %-4s | %-10s | %-5s | %-9s |\e[0m\n" $row
  done
  echo -e "\e[1;32m+------+------------+-------+-----------+\e[0m"

  echo
  echo -e "\e[1;34mCPU Usage:\e[0m $usage%"
  bar=""
  for ((i=0; i<usage; i+=2)); do
      color=$((34 + (i * 3) % 100))
      bar+="\033[38;5;${color}m#\033[0m"
  done
  echo -e "$bar"

  echo
  echo -e "\e[1;35m🧠 Neural Activity Monitor:\e[0m"

  declare -A data=(
    [Neo]=42
    [Trinity]=35
    [Morpheus]=28
    [AgentSmith]=50
  )

  for name in "${!data[@]}"; do
      val=${data[$name]}
      bar=""
      for ((i=0; i<val; i++)); do
          color=$((160 + (i * 2) % 96))
          bar+="\033[38;5;${color}m#\033[0m"
      done
      printf "%-12s | %3d | %b\n" "$name" "$val" "$bar"
  done

echo
echo

glitch="HACKING IN PROGRESS..."
for (( i=0; i<${#glitch}; i++ )); do
    if (( RANDOM % 6 == 0 )); then
        printf "\033[38;5;$((RANDOM%256))m%c\033[0m" $((RANDOM % 93 + 33))
    else
        printf "\033[38;5;$((RANDOM%256))m%c\033[0m" "'${glitch:$i:1}"
    fi
done
  echo 
  echo -e "\n\e[2;32m(Fresh Forensics Production...)\e[0m"
  sleep 0.5
done
