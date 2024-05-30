# Moonraker Warnings
Updating Klipper and all the rest of the components using the Mainsail interface is an easy way to to keep all the software current. 
However, there may be an issue after rebooting where Moonraker seems to 'forget' about Crowsnest (the software that supports cameras) and the Timelapse module may go AWOL as well. 
In the case of Crowsnest, there's usually a very prominent message about this. With Timelapse, the functionality is just not visible in the interface any more.

To address this, login to the printer using SSH. For Troodon printers with the stock BTT-CB1 board, the username is 'biqu' and the password is 'biqu' and SSH is running on port 22. 
Once logged in, CD to the 'crowsnest' directory run the 'sudo make install' command. Then do the same for moonraker-timelapse. 
```
cd ~/crowsnest
sudo make install
cd ~moonraker-timelapse
sudo make install
```
