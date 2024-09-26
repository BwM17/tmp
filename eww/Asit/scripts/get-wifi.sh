#!/usr/bin/env bash
OUT=""
print_networks() {
  local WIFI=$(nmcli --fields SSID,RATE,BARS dev wifi list | sed 1d)   
  local buff="" 

  while IFS= read -r line; do  
    read -r SSID RATE MBITS BARS <<< $line  
    local buff+="(eventbox :class \"wifi-inner\" (box :orientation \"h\" (label :text \"$SSID $RATE $MBITS $BARS\")))"  
  done <<< "$WIFI"   
  
  $OUT="(box :class \"wifi-outer\" (scroll :vscroll true $buff))"  
}  

print_networks
eww update wifi-menu="$OUT" 
eww open wifi



