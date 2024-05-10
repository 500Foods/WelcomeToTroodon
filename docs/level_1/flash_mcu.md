# Flashing the MCU

A typical 3D printer these days has a bunch of electronics that coordinate all of the printer's components to get the printer to actually print. 
A common configuration uses something called an MCU - basically a small computer, like a Raspberry Pi or even just a CPU or SBC chip, combined with controllers for all the motors, fans, heaters, lights, and so on. In a Troodon 2.0 Pro, as of this writing, that MCU happens to be a custom BigTreeTech Octopus F407-v1. 

Complicating things a little more, Klipper is capable of managing the affairs of multiple such MCUs. It can be, for example, that you have a main MCU running Klipper itself that is an actual Raspberry Pi 4B all on its own. 
Then a separate MCU could be used to control the motors that move the print head around. And maybe another MCU in the printer's toolhead. And a fourth MCU that might be in a Klipper Expander or something like that. All of these then potentially each have their own firmware that will need to be updated from time to time. 
The Troodon 2.0 Pro comes with an accelerometer used for fine-tuning the printer (aka input shaping) that also is, you guessed it, an MCU that has its own firmware.

Instructions for how to update each MCU in your particular printer's configuration will vary, somtimes widely. But they need to be followed very closely to ensure that you're actually updating the right MCU with the right firmware and in such a way as to be careful not to "brick" the MCU. 
In other words, you have to be careful as it is entirely possible to mess it up in such a way that the firmware cannot be updated and the MCU becomes useless and will have to be replaced. Aka, about as useful as a brick. 
And you certainly don't want to apply firmware intended for one MCU onto another - even if they're using the same chips - something that is increasingly problematic as more and more MCUs appear in these kinds of printers.

The good news is that there are instructions for how to do these firmware updates. The bad news is that they're not always all that clear. Let's try and help with that.

## Upgrading the BTT Octopus F407
TBD.

### Reference
- Check your printer.cfg file for instructions specific to your printer
- [Klipper Documentation - SDCard Updates](https://www.klipper3d.org/SDCard_Updates.html)
- [Voron Documentation - Automating Klipper MCU Updates](https://docs.vorondesign.com/community/howto/drachenkatze/automating_klipper_mcu_updates.html)


## Updating the ADXL
Here's a start, credit to @dog2bert from the #Troodon Discord community. This has been added as "adxl_update.sh" in the "scripts" folder in this repository. We'll give this a once over a little bit later.

```
#!/usr/bin/bash

sudo service klipper stop
cd ~/klipper
git pull
make clean
make menuconfig
make
make flash FLASH_DEVICE=/dev/serial/by-id/usb-1a86_USB2.0-Serial-if00-port0
sudo service klipper start
```

In Menuconfig:
- Microcontroller: Raspberry Pi RP 2040
- Com Interface: USBSERIAL

