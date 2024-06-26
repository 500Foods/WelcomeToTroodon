# Moonraker Warnings
Updating Klipper and all the rest of the components using the Mainsail interface is an easy way to to keep all the software current. 
However, there may be an issue after rebooting where Moonraker seems to 'forget' about Crowsnest (the software that supports cameras) and the Timelapse module may go AWOL as well. 
In the case of Crowsnest, there's usually a very prominent message about this. With Timelapse, the functionality is just not visible in the interface any more.

To address this, login to the printer using SSH. For Troodon printers with the stock BTT-CB1 board, the username is 'biqu'. The password is 'biqu'. SSH is running on port 22 (the regular SSH port). 

Once logged in, run the following commands.
```
cd ~/crowsnest
sudo make install
cd ~/moonraker-timelapse
sudo make install
```
If you've made changes to the crowsnest.cfg file, you will have to make those changes again. Normally backups of this file are available, so you can look through those to find any previous changes that have been made.

#
Next: [Level One](https://github.com/500Foods/WelcomeToTroodon#-level-one---welcome)
