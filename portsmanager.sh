#!/usr/bin/env bash

#####							       #####
###   this is my little bash script to open and close my ports   ###
#####							       #####

read -p $'\e[38;5;36mPress Enter to OPEN ports\e[0m:' foo

### colorful, waits for input, does nothing else

printf "\n" ### newline

sudo iptables -A INPUT -p udp -m udp --dport 49490 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 49490 -j ACCEPT
sudo iptables -A OUTPUT -p udp -m udp --dport 49490 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m tcp --dport 49490 -j ACCEPT

### opens port 49490 for both tcp and udp

read -p "Listing iptables rules for sanity check" </dev/tty  ### waits

printf "\n" ### newline

sudo iptables --list ### listing rules

printf "\n"

read -p $'\e[38;5;199mPress Enter to CLOSE ports (flush rules)\e[0m: ' foo
printf "\n"

sudo iptables -F 

###^^^ flushes all rules

read -p "Listing iptables rules for sanity check" </dev/tty  

printf "\n"

sudo iptables --list

### final list for parity
