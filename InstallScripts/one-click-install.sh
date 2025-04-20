#!/bin/bash
mkdir -p ~/hacker-vibes && cd ~/hacker-vibes

# Matrix
cat << 'EOF' > matrix.sh
cols=$(tput cols); lines=$(tput lines)
for ((i=0; i<cols; i++)); do col_pos[i]=0; done
while true; do
  for ((i=0; i<cols; i++)); do
    char=$(printf "\\x$(printf %x $((RANDOM % 93 + 33)))")
    echo -ne "\e[2;32m\e[${col_pos[i]};${i}H$char\e[0m"
    col_pos[i]=$(( (col_pos[i]+1) % lines ))
  done
  sleep 0.05
done
EOF

# Disco
cat << 'EOF' > disco.sh
frames=('◐' '◓' '◑' '◒')
while true; do
  for i in "${frames[@]}"; do
    color=$(( RANDOM % 256 ))
    echo -ne "\e[38;5;${color}m$i DISCO MODE!\e[0m\r"
    sleep 0.1
  done
done
EOF

# Glitch
cat << 'EOF' > glitch.sh
text="ACCESS GRANTED"
while true; do
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
  echo -ne "\e[38;5;${color}m$glitched\e[0m\r"
  sleep 0.07
done
EOF

chmod +x *.sh
echo -e "✅ Installed in ~/hacker-vibes:\n- ./matrix.sh\n- ./disco.sh\n- ./glitch.sh"
