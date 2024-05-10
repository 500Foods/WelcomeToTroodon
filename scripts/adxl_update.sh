#!/usr/bin/bash

sudo service klipper stop
cd ~/klipper
git pull
make clean
make menuconfig
make
make flash FLASH_DEVICE=/dev/serial/by-id/usb-1a86_USB2.0-Serial-if00-port0
sudo service klipper start

# In Menuconfig:
#    Microcontroller: Raspberry Pi RP 2040
#    Com Interface: USBSERIAL
