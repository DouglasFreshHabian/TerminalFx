#!/bin/bash

trap "tput cnorm; clear; exit" SIGINT
tput civis

# Colors
GREEN="\033[1;32m"
RESET="\033[0m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RED="\033[1;31m"
MAGENTA="\033[1;35m"
YELLOW="\033[1;33m"

# Sample Commands for Fake Hack Simulation
commands=(
  "nmap -A 192.168.1.1"
  "curl https://darknet/api/payload"
  "decrypt -k 9C4F... --force"
  "launch --override-protocols"
  "inject binary --stealth"
)

# Function to glitch text with random characters
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

# Function to simulate typing command
function type_command() {
  local cmd="$1"
  for ((i=0; i<${#cmd}; i++)); do
    echo -ne "${GREEN}${cmd:$i:1}${RESET}"
    sleep 0.03
  done
  echo
  sleep 0.3
  glitch_line ">> Executing..."
  sleep 0.2
  glitch_line "[STATUS] SUCCESS"
  echo
}

# Function to display live system metrics
function live_metrics() {
  UPTIME=$(uptime -p)
  LOAD=$(uptime | awk -F'load average: ' '{print $2}')
  CPU=$(top -bn1 | grep "Cpu(s)" | awk '{printf("%.1f", $2 + $4)}')
  MEM=$(free -h | awk '/^Mem/ {print $3 "/" $2}')
  IP=$(hostname -I | awk '{print $1}')

  printf "${BLUE}%-15s:${RESET} %s\n" "System Uptime" "$UPTIME"
  printf "${BLUE}%-15s:${RESET} %s\n" "Load Average" "$LOAD"
  printf "${BLUE}%-15s:${RESET} %s%%\n" "CPU Usage" "$CPU"
  printf "${BLUE}%-15s:${RESET} %s\n" "Memory Usage" "$MEM"
  printf "${BLUE}%-15s:${RESET} %s\n" "IP Address" "$IP"
}

# Function for rendering dynamic bar graphs
function bargraph() {
  local label="$1"
  local value=$2
  local max=50
  local blocks=$((value * max / 100))
  local bar=""

  for ((i=0; i<blocks; i++)); do
    color=$((34 + (i * 3) % 100))
    bar+=$(printf "\033[38;5;%sm#\033[0m" "$color")
  done

  printf "%-15s [%3d%%] %b\n" "$label" "$value" "$bar"
}

# Function for real-time CPU usage graph (ASCII-style) with multi-color hashtags and animation
function cpu_graph() {
  local cpu_usage
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}') # Sum of user + system CPU usage
  cpu_usage=$(echo "$cpu_usage" | awk '{printf("%.0f", $1)}') # Round the value to nearest integer
  local max=50
  local blocks=$((cpu_usage * max / 100))  # Integer arithmetic works here now
  local bar=""
  
  # Colors for the graph
  local colors=("34" "36" "32" "33" "35" "196")  # Blue, Cyan, Green, Yellow, Magenta, Red

  # Smooth animation for the graph with multi-color hashtags
  for ((i=0; i<blocks; i++)); do
    # Pick a color from the array in a circular manner
    local color=${colors[$((i % ${#colors[@]}))]}  # Cycles through the colors

    # Append the hashtag in the chosen color
    bar+=$(printf "\033[38;5;%sm#########\033[0m" "$color")
    
    # Print the graph with the changing colors and the CPU percentage
    printf "\rCPU Usage: [%-50s] %d%%" "$bar" "$cpu_usage"
    sleep 0.1  # Speed of the animation
  done

  echo # Move to the next line after the animation
}

# Function to display live system processes
function system_processes() {
  echo -e "\n${MAGENTA}Top Processes (by CPU Usage):${RESET}"
  ps aux --sort=-%cpu | head -n 10
  echo -e "\nPress Enter to return to the menu."
  read
}

# Function for live ping scan on LAN
function live_ping_scan() {
  local network="192.168.254.1"
  echo -e "\n${MAGENTA}Live LAN Scan: Detecting Active Devices...${RESET}"
  for i in {1..255}; do
    ping -c 1 -w 1 "$network.$i" > /dev/null && echo -e "  ${CYAN}Alive${RESET}   IP: ${GREEN}$network.$i${RESET}"
  done
}

# Fake Cracking Password Simulation
function fake_crack_password() {
  echo -e "\n${CYAN}Simulating password cracking...${RESET}"
  sleep 1
  glitch_line "john: [INFO] Loaded wordlist: /usr/share/wordlists/rockyou.txt"
  sleep 1
  glitch_line "john: [INFO] Attempting hash cracking..."
  sleep 2
  glitch_line "[STATUS] Cracked Hash: $2f9e3ff5b9a5..."
  sleep 2
  glitch_line "[INFO] Password: 'letmein123' (found in rockyou.txt)"
  sleep 1
}

# Interactive menu function
function interactive_menu() {
  while true; do
    clear
    echo -e "${GREEN}╔═══════════ 👁 GOD MODE INTERFACE 👁 ═══════════╗${RESET}"
    echo -e "${GREEN}║ Interactive Cyber Terminal - Hacker Edition 🧠 ║${RESET}"
    echo -e "${GREEN}╚════════════════════════════════════════════════╝${RESET}"
    echo -e "\nChoose an option:"
    echo -e "1. Display System Metrics"
    echo -e "2. Run Live Ping Scan on LAN"
    echo -e "3. Simulate Hack Command"
    echo -e "4. Display CPU Usage Graph (Live)"
    echo -e "5. Show Top System Processes"
    echo -e "6. Simulate Fake Password Cracking (John/Hashcat)"
    echo -e "7. Exit"

    read -p "Enter your choice (1-7): " choice

    case $choice in
      1)
        live_metrics
        echo -e "\nPress Enter to return to the menu."
        read
        ;;
      2)
        live_ping_scan
        echo -e "\nPress Enter to return to the menu."
        read
        ;;
      3)
        type_command "${commands[$RANDOM % ${#commands[@]}]}"
        echo -e "\nPress Enter to return to the menu."
        read
        ;;
      4)
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{printf("%.1f", $2 + $4)}')
        cpu_graph "$cpu_usage"
        echo -e "\nPress Enter to return to the menu."
        read
        ;;
      5)
        system_processes
        ;;
      6)
        fake_crack_password
        ;;
      7)
        echo -e "${RED}Exiting God Mode...${RESET}"
        sleep 1
        clear
        exit 0
        ;;
      *)
        echo -e "${RED}Invalid option, please choose again.${RESET}"
        sleep 1
        ;;
    esac
  done
}

# Start the interactive menu
interactive_menu
