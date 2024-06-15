# "Unable to load panel network"
A couple of users in the #Troodon form in the Formbot Discord have posted somethign along the lines of this:
![image](https://github.com/500Foods/WelcomeToTroodon/assets/41052272/1d065fd3-f3a8-46fd-bce1-af5c8041c680)

This was encountered during the initial setup of their Troodon printer, when they attempted to configure their WiFi connection. Hopefully this is something FormBot will address. In the interim, a workaround involves the following steps.
- Connect the Troodon to the network with an ethernet cable.
- There's an RJ45 jack at the back of the printer.
- You might have to lookup the IP address from your router to see what was assigned.
- Once you know the IP, you can login using the usual credentials.
- SSH: username: biqu password: biqu port: 22
- From here, install KIAUH - a command-line Klipper installer
- Uninstall KlipperScreen
- Reinstall KlipperScreen
- Reboot

KlipperScreen should now be able to access the network page where you can configure the WiFi connection and then no longer need the ethernet cable.
