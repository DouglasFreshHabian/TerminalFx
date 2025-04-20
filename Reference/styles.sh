#!/bin/bash

echo -e "\e[1mbold\e[0m"             # Bold text
echo -e "\e[3mitalic\e[0m"           # Italic text (may not work in all terminals)
echo -e "\e[3m\e[1mbold italic\e[0m" # Bold + Italic
echo -e "\e[4munderline\e[0m"        # Underlined text
echo -e "\e[9mstrikethrough\e[0m"    # Strikethrough (may not work everywhere)
echo -e "\e[31mHello World\e[0m"     # Red text
echo -e "\x1B[31mHello World\e[0m"   # Also red, \x1B is same as \e
