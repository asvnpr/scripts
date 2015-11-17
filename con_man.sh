#! /usr/bin/bash

#script to turn off wifi if ethernet cable is connected
#and turn wifi back on if the wifi interfaces are down and ethernet is not connected

eth_state =$(< /sys/class/net/enp0s25/carrier) #checks if ethernet cable is connected. returns 1 or 0
wifi =$(< /sys/class/net/wlp3s0/operstate) #checks pcie wifi interface status. returns "up" or "down"
usb_wifi =$(< /sys/class/net/wlp0s29u1u1/operstate) #checks usb wifi interface status. returns "up" or "down"

if [ $eth_state -eq 1 ]; then
    nmcli radio wifi off
elif [ $wifi = 'down' ] && [ $usb_wifi == 'down' ] && [ $eth_state -eq 0 ]; then
    nmcli radio wifi on
fi


sadas
