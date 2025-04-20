#!/bin/bash

# Sample data
headers=("ID" "NAME" "LEVEL" "STATUS")
rows=(
  "001 Neo        99 ACTIVE"
  "002 Trinity    98 ACTIVE"
  "003 Morpheus   95 OFFLINE"
  "004 AgentSmith 100 MALICIOUS"
)

# Print header
echo -e "\e[1;32m+------+------------+-------+-----------+"
printf "\e[1;32m| %-4s | %-10s | %-5s | %-9s |\n" "${headers[@]}"
echo -e "+------+------------+-------+-----------+\e[0m"

# Print rows
for row in "${rows[@]}"; do
    printf "\e[2;32m| %-4s | %-10s | %-5s | %-9s |\e[0m\n" $row
done

echo -e "\e[1;32m+------+------------+-------+-----------+\e[0m"
