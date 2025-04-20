![header image](https://github.com/DouglasFreshHabian/TerminalFx/blob/main/Assets/3.png)
 
## 🎨 Terminal Color Reference Scripts:

### A simple set of scripts and tools for visualizing ANSI terminal colors in both standard and extended 256-color modes.
#### Included:

* 🥊 ansi-foreground.sh – Displays all 256 foreground colors (38;5;<n>) in a grid.

* 🤙 ansi-background.sh – Shows all 256 background colors (48;5;<n>) in a grid.

* 🤡 ansi-combined.sh – Displays background colors with automatically chosen contrasting foreground text for readability.

* 💈 terminal-256-colors.html – An HTML visual reference for all 256 terminal colors using inline RGB styles and dynamic contrast.

Perfect for developers, themers, and CLI artists who want a quick, visual way to reference terminal color codes.

## 🖋️ Text Styles & Colors Scripts:
bash script that demos all the main text styles and foreground colors your terminal might support:
```bash
   ./demo.sh
```
### Here are scripts for both 256-color and 24-bit TrueColor (RGB) modes, depending on your terminal's power.

## 🎨 256-Color Palette Demo
```bash
   ./colors256.sh
```
## 🌈 TrueColor (24-bit RGB) Gradient Demo
```bash
   ./truecolor.sh
```
## 🖥️ Check Terminal Compatibility:
Most modern terminals (iTerm2, GNOME Terminal, Kitty, Alacritty, etc.) support both 256-color and TrueColor.

To check if your terminal supports TrueColor:
```bash
   echo -e "\e[38;2;255;100;0mTrueColor?\e[0m"
```

## Rainbow text banners & Color Pickers in Bash
We’re entering full color nerdvana now — banners, rainbows, even interactive pickers if you want!

## 🌈 Rainbow Text Banner (Horizontal)

#### bash function that prints any text in a rainbow gradient using ANSI 256-colors
```bash
   ./rainbow_text_banner.sh
```
## 🧑‍🎨 Interactive Color Picker (Terminal)

#### This uses a loop to let you “scroll” through 256-colors and preview text:
```
   ./color_picker.sh
```
## 🎨 Gradient Background Bars
#### A dynamic color bar that changes through the full 256 colors:
```bash
   ./gradient_background_bars.sh
```
## 🌈 Rainbow Progress Bar
#### Watch the progress bar cycle through rainbow colors while a task runs. Let's make it dynamic with a bash function:
```bash
   ./rainbow_progress_bar.sh
```
## ⚡ ASCII Art Colorizer
#### Want to create colorful ASCII art with your text? This combines figlet and color magic:
```bash
   ./ascii_art_colorizer.sh		# This one will create a moving rainbow effect with each line of ASCII art.
```
## 🏁 Animate the Text! (Rainbow Animation)
#### This function lets the text change colors in a looping animation:
```bash
   ./animate_text.sh			# This will keep animating the text in a rainbow gradient!
```

## Let’s bring you the holy trinity of rainbow bash bling:
- ✅ Randomized Text Color
- ✅ Animated Rainbow Clock
- ✅ Interactive Color Picker

## 🎲 Randomized Text Color Script
### Prints your message in a totally random color every time.
Save as random_color.sh
```
   ./random_color.sh "Your custom message here"
```
## ⏰ Rainbow Clock (Animated)
### Live rainbow-colored clock ticking in your terminal.
```bash
   ./rainbow_clock.sh
```
## 🎨 Interactive Color Picker (256-Color Terminal Tool)
### Browse 256 ANSI colors, preview them, and pick your favorite.
```
   ./color_picker.sh
```
## 🧰 Optional Bundle Installer (Lazy Mode™)
### Wanna install all three at once? Here's a quick setup script:
```
   ./bundle_installer.sh
```
## YOOO 🔥💥 Let’s get WILD AF with it. We’re talking:

- 🎬 Retro Matrix Rain
- 🪩 Disco Ball Animation
- 👾 Glitchy Hacker Text Vibes

## 💚 MATRIX RAIN (Terminal Style)

### his one simulates the classic Matrix falling code rain. So. Damn. Cool.
Works best full-screen!
```bash
   ./matrix.sh    # Stop with Ctrl+C
```
## 🪩 DISCO BALL TERMINAL SPINNER
### This one loops a shiny spinner with rainbow color flash. So extra. So necessary.
```bash
   ./disco.sh    # Ctrl+C to end the party
```
## 👾 GLITCH EFFECT / HACKER VIBES
### A jittery, flickering text like you're in a cyberpunk terminal or watching Mr. Robot.
```
   ./glitch.sh
```
## 💽 ONE-CLICK INSTALL FOR ALL 3
### Wanna drop them all in one shot? Here’s a bundle script:
```bash
   ./one-click-install.sh
```
## 🧪 What Are “Scanlines”?
### Scanlines simulate the horizontal lines you'd see on vintage CRT screens giving your terminal that retro green glow + flicker. 
```bash
   ./scanlines.sh
```
## 🕶️ Add Hacker Text Over the Scanlines
### Want to overlay some creepy blinking text or terminal commands? Modify the middle of the loop:
```bash
   ./scanlines_with_text.sh
```
### Or show rotating text
```bash
   ./scanlines_with_rotating_text.sh
```
## Here are some juicy terminal-based table/graph concepts:
### 📐 Retro-Styled Terminal Table (Green Matrix look)
```
   ./matrix_table.sh
```
### 📊 Horizontal Bar Graph (256-color style)
```
./bargraph.sh
```
### 📈 Live Updating Line Graph (Simulated CPU Load)
```bash
   ./cpugraph
```
>**💡Tip:**
> You can use the column command to create fancy tables.
```bash
echo -e "ID\tName\tStatus\n1\tNeo\tActive\n2\tAgent Smith\tCorrupt" | column -t
echo -e "\e[1;32m$(echo -e "ID\tName\tStatus\n1\tNeo\tActive\n2\tAgent Smith\tCorrupt" | column -t)\e[0m"
```

## 💾 Hacker Dashboard Script: hacker_dashboard.sh
### YOOOO 🤖🔓💾
Welcome to Cyberpunk Command Center v1.0 — we’re about to go full Mr. Robot, Tron, and Watch_Dogs rolled into one glorious terminal hallucination.
```bash
   ./cyberpunk_terminal.sh
```
### 💥 Features:

* 🔍 Fake hacking command interface

* 💹 Live system stats (real uptime, load, etc.)

* 📡 Ping scanner animation

* 🕵️‍♂️ Glitchy output renderer

* 🎨 Retro CRT scanlines

* 🔁 Everything updates live


## 🚨👁️‍🗨️🛸 INITIATING: GOD MODE 🛸👁️‍🗨️🚨
### You just unlocked FULL-SYSTEM OVERRIDE — the kind of terminal dashboard that would make even Elliot Alderson, Neo, and Ghost in the Shell blush.

#### Welcome To: 💀 CYBERPUNK TERMINAL: GOD MODE™
```bash
   ./god_mode_terminal.sh
```
* 👨‍💻 Interactive Command Typing Interface
* 🧠 Live System Metrics Feed (real stats)
* 🌐 Auto IP Scanning Display
* 📉 Dynamic CPU + Memory Graphs
* 🔓 Glitch Text Effects + Terminal Animations
* ⏳ Countdown Timers, Alerts & Self-Destruct Mode
* 📺 Optional Retro VHS & Scanline Overlays

### If you have not done so already, please head over to the channel and hit that subscribe button to show some support. Thank you!!!

### 👍 [STAY FRESH](https://www.youtube.com/@DouglasHabian-tq5ck) 


<!-- 
 _____              _       _____                        _          
|  ___| __ ___  ___| |__   |  ___|__  _ __ ___ _ __  ___(_) ___ ___ 
| |_ | '__/ _ \/ __| '_ \  | |_ / _ \| '__/ _ \ '_ \/ __| |/ __/ __|
|  _|| | |  __/\__ \ | | | |  _| (_) | | |  __/ | | \__ \ | (__\__ \
|_|  |_|  \___||___/_| |_| |_|  \___/|_|  \___|_| |_|___/_|\___|___/
        dfresh@tutanota.com Fresh Forensics, LLC 2025 -->

 

