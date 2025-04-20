#!/bin/bash

declare -A data=(
  [Neo]=42
  [Trinity]=35
  [Morpheus]=28
  [AgentSmith]=50
)

max=50
for name in "${!data[@]}"; do
    val=${data[$name]}
    bar=""
    for ((i=0; i<val; i++)); do
        color=$((160 + (i * 2) % 96))
        bar+="$(echo -e "\033[38;5;${color}m#\033[0m")"
    done
    printf "%-12s | %3d | %s\n" "$name" "$val" "$bar"
done
