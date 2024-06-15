# "Unable to load panel network"
A couple of users in the #Troodon forum in the [Formbot Discord](https://discord.gg/spAGFK2PnN) have posted something along the lines of this:

![image](https://github.com/500Foods/WelcomeToTroodon/assets/41052272/1d065fd3-f3a8-46fd-bce1-af5c8041c680)

This was encountered during the initial setup of their Troodon printer when they attempted to configure their WiFi connection. Hopefully, this is something FormBot will address. In the interim, a workaround involves the following steps.
- Connect the Troodon to the network with an ethernet cable.
- There's an RJ45 jack at the back of the printer.
- You might have to look up the IP address from your router to see what was assigned.
- Once you know the IP address, you can log in using SSH with the usual credentials.
- Username: biqu &nbsp;&nbsp;&nbsp; Password: biqu &nbsp;&nbsp;&nbsp; SSH port: 22.
- From there, install [KIAUH](https://github.com/dw-0/kiauh) - a command line Klipper installer.
- Use KIAUH to uninstall KlipperScreen.
- Use KIAUH to reinstall KlipperScreen.
- Reboot ('sudo reboot now' from the command line).

KlipperScreen should now be able to access the network page where you can configure the WiFi connection and then no longer need the ethernet cable.
