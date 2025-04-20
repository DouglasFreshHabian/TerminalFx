#!/bin/bash

mkdir -p ~/rainbow-scripts && cd ~/rainbow-scripts

cat << 'EOF' > random_color.sh
# Random Color Script
color=$(( RANDOM % 216 + 16 ))
message=\${1:-"🌈 Random Color Vibes!"}
echo -e "\e[38;5;\${color}m\${message}\e[0m"
EOF

cat << 'EOF' > rainbow_clock.sh
# Rainbow Clock
while true; do
    now=\$(date +"%H:%M:%S")
    output=""
    for (( i=0; i<\${#now}; i++ )); do
        char="\${now:\$i:1}"
        color=\$(( (\$i * 36 + \$(date +%s)) % 256 ))
        output+="\e[38;5;\${color}m\${char}\e[0m"
    done
    echo -ne "\r\${output}"
    sleep 1
done
EOF

cat << 'EOF' > color_picker.sh
# Color Picker
echo -e "🎨 \e[1mTerminal Color Picker (256 colors)\e[0m"
echo "Enter color code (0-255) to preview. Type 'exit' to quit."
while true; do
    read -p "Color code: " input
    [[ "\$input" == "exit" ]] && break
    if [[ "\$input" =~ ^[0-9]+$ ]] && [ "\$input" -ge 0 ] && [ "\$input" -le 255 ]; then
        echo -e "\e[38;5;\${input}m Sample text in color \${input} \e[0m"
    else
        echo "❌ Invalid input. Enter a number between 0–255."
    fi
done
EOF

chmod +x *.sh
echo -e "✅ Scripts installed in ~/rainbow-scripts\nRun them with:\n  ./random_color.sh\n  ./rainbow_clock.sh\n  ./color_picker.sh"
