# KIAUH and DangerKlipper

The Klipper Installation and Update Helper, aka KIAUH, is a super-useful tool to do what its name implies - install and update Klipper and a host of other related software. 
It also has provisions for installing DangerKlipper - the latest version of Klipper that could be considered beta or even alpha, with the latest updates.

## Step 1. Install KIAUH

## Step 2. Use KIAUH to perform updates

## Step 3. Use KIAUH to install optional software

## Step 4. Use KIAUH to install DangerKlipper
In this step, what we're doing is changing the Klipper repository that KIAUH is using to maintain the Klipper installation. 

By pointing it at the DangerKlipper URL, and selecting a branch (master in this case), KIAUH has everything it needs to perform the update.

To get started, launch KIAUH and then select `Option S` to access KIAUH's settings
```
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~~~~~~ [ KIAUH ] ~~~~~~~~~~~~~~~~~~~~~ ║
║        Klipper Installation And Update Helper         ║
║ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ║
╚═══════════════════════════════════════════════════════╝
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~~~~ [ Main Menu ] ~~~~~~~~~~~~~~~~~~~ ║
╟──────────────────┬────────────────────────────────────╢
║  0) [Log-Upload] │   Klipper: Installed: 1            ║
║                  │     Owner: Klipper3d               ║
║  1) [Install]    │      Repo: klipper                 ║
║  2) [Update]     ├────────────────────────────────────╢
║  3) [Remove]     │ Moonraker: Installed: 1            ║
║  4) [Advanced]   │     Owner: Arksine                 ║
║  5) [Backup]     │      Repo: moonraker               ║
║                  ├────────────────────────────────────╢
║  S) [Settings]   │        Mainsail: Installed         ║
║                  │          Fluidd: Not installed     ║
║ Community:       │   Client-Config: Mainsail-Config   ║
║  E) [Extensions] │                                    ║
║                  │   KlipperScreen: Installed         ║
║                  │       Crowsnest: Installed         ║
╟──────────────────┼────────────────────────────────────╢
║  v6.0.0-alpha.9  │  Changelog: https://git.io/JnmlX   ║
╟──────────────────┴────────────────────────────────────╢
║                        Q) Quit                        ║
╚═══════════════════════════════════════════════════════╝
###### Perform action: S
```
Then select `Option 1` to set the Klipper source repository.
```
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~ [ KIAUH Settings ] ~~~~~~~~~~~~~~~~~ ║
╟───────────────────────────────────────────────────────╢
║ Klipper:                                              ║
║  ● Repo:   klipper                                    ║
║  ● Owner:  Klipper3d                                  ║
║  ● Branch: master                                     ║
╟───────────────────────────────────────────────────────╢
║ Moonraker:                                            ║
║  ● Repo:   moonraker                                  ║
║  ● Owner:  Arksine                                    ║
║  ● Branch: master                                     ║
╟───────────────────────────────────────────────────────╢
║ Install unstable releases:                            ║
║  [ ] Mainsail                                         ║
║  [ ] Fluidd                                           ║
╟───────────────────────────────────────────────────────╢
║ Auto-Backup:                                          ║
║  [ ] Automatic backup before update                   ║
╟───────────────────────────────────────────────────────╢
║ 1) Set Klipper source repository                      ║
║ 2) Set Moonraker source repository                    ║
║                                                       ║
║ 3) Toggle unstable Mainsail releases                  ║
║ 4) Toggle unstable Fluidd releases                    ║
║                                                       ║
║ 5) Toggle automatic backups before updates            ║
╟───────────────────────────────────────────────────────╢
║                       B) « Back                       ║
╚═══════════════════════════════════════════════════════╝
###### Perform action: 1
```
And finally, enter `https://github.com/DangerKlippers/danger-klipper` for the repository, and `master` for the branch.

NOTE: There are other options if you want to use the cutting-edge version of DangerKlipper. See the [DangerKlipper](https://github.com/DangerKlippers/danger-klipper) GitHub repository for more information. 
This would likely only be of interest if you're testing out some new feature of Klipper and the regular version of DangerKlipper has a bug in it or something.
```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃                     [ ATTENTION ]                     ┃
┠───────────────────────────────────────────────────────┨
┃ There is no input validation in place! Make sure your ┃
┃ the input is valid and has no typos or invalid        ┃
┃ characters! For the change to take effect, the new    ┃
┃ repository will be cloned. A backup of the old        ┃
┃ repository will be created.                           ┃
┃                                                       ┃
┃ Make sure you don't have any ongoing prints running,  ┃
┃ as the services will be restarted during this         ┃
┃ process! You will loose any ongoing print!            ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
###### Enter new repository URL: https://github.com/DangerKlippers/danger-klipper
###### Enter new branch name: master
```
At this point, it will take a few minutes for KIAUH to clone the DangerKlipper repository and get it installed.
```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ New Klipper repository URL:                           ┃
┃ ● https://github.com/DangerKlippers/danger-klipper    ┃
┃ New Klipper repository branch:                        ┃
┃ ● master                                              ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
###### Apply changes? (Y/n): y
Cloning into '/home/biqu/klipper'...
remote: Enumerating objects: 48448, done.
remote: Counting objects: 100% (456/456), done.
remote: Compressing objects: 100% (240/240), done.
remote: Total 48448 (delta 230), reused 409 (delta 212), pack-reused 47992 (from 1)
Receiving objects: 100% (48448/48448), 109.44 MiB | 4.09 MiB/s, done.
Resolving deltas: 100% (37102/37102), done.
Updating files: 100% (2237/2237), done.
Already on 'master'
Your branch is up to date with 'origin/master'.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Note, selecting 'libusb-1.0-0-dev' for regex 'libusb-1.0'
Note, selecting 'libusb-1.0-doc' for regex 'libusb-1.0'
Note, selecting 'libusb-1.0-0' for regex 'libusb-1.0'
libusb-1.0-0 is already the newest version (2:1.0.24-3).
libusb-1.0-0-dev is already the newest version (2:1.0.24-3).
libusb-1.0-doc is already the newest version (2:1.0.24-3).
0 upgraded, 0 newly installed, 0 to remove and 24 not upgraded.
created virtual environment CPython3.9.2.final.0-64 in 1090ms
  creator CPython3Posix(dest=/home/biqu/klippy-env, clear=False, no_vcs_ignore=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=/home/biqu/.local/share/virtualenv)
    added seed packages: pip==20.3.4, pkg_resources==0.0.0, setuptools==44.1.1, wheel==0.34.2
  activators BashActivator,CShellActivator,FishActivator,PowerShellActivator,PythonActivator,XonshActivator
Requirement already satisfied: pip in /home/biqu/klippy-env/lib/python3.9/site-packages (20.3.4)
Collecting pip
  Downloading pip-24.3-py3-none-any.whl (1.8 MB)
     |████████████████████████████████| 1.8 MB 2.2 MB/s
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 20.3.4
    Uninstalling pip-20.3.4:
      Successfully uninstalled pip-20.3.4
Successfully installed pip-24.3
Ignoring greenlet: markers 'python_version >= "3.12"' don't match your environment
Collecting cffi==1.15.1 (from -r /home/biqu/klipper/scripts/klippy-requirements.txt (line 5))
  Downloading cffi-1.15.1-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl.metadata (1.1 kB)
Collecting pyserial==3.4 (from -r /home/biqu/klipper/scripts/klippy-requirements.txt (line 6))
  Downloading pyserial-3.4-py2.py3-none-any.whl.metadata (1.6 kB)
Collecting greenlet==2.0.2 (from -r /home/biqu/klipper/scripts/klippy-requirements.txt (line 7))
  Downloading greenlet-2.0.2-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl.metadata (4.1 kB)
Collecting Jinja2==3.1.4 (from -r /home/biqu/klipper/scripts/klippy-requirements.txt (line 9))
  Using cached jinja2-3.1.4-py3-none-any.whl.metadata (2.6 kB)
Collecting python-can==3.3.4 (from -r /home/biqu/klipper/scripts/klippy-requirements.txt (line 10))
  Using cached python_can-3.3.4-py2.py3-none-any.whl
Collecting markupsafe==2.1.5 (from -r /home/biqu/klipper/scripts/klippy-requirements.txt (line 11))
  Downloading MarkupSafe-2.1.5-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl.metadata (3.0 kB)
Collecting numpy==1.25.2 (from -r /home/biqu/klipper/scripts/klippy-requirements.txt (line 12))
  Downloading numpy-1.25.2-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl.metadata (5.6 kB)
Collecting pycparser (from cffi==1.15.1->-r /home/biqu/klipper/scripts/klippy-requirements.txt (line 5))
  Downloading pycparser-2.22-py3-none-any.whl.metadata (943 bytes)
Collecting aenum (from python-can==3.3.4->-r /home/biqu/klipper/scripts/klippy-requirements.txt (line 10))
  Downloading aenum-3.1.15-py3-none-any.whl.metadata (3.7 kB)
Collecting wrapt~=1.10 (from python-can==3.3.4->-r /home/biqu/klipper/scripts/klippy-requirements.txt (line 10))
  Downloading wrapt-1.16.0-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl.metadata (6.6 kB)
Downloading cffi-1.15.1-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (448 kB)
Downloading pyserial-3.4-py2.py3-none-any.whl (193 kB)
Downloading greenlet-2.0.2-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (607 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 607.6/607.6 kB 2.1 MB/s eta 0:00:00
Using cached jinja2-3.1.4-py3-none-any.whl (133 kB)
Downloading MarkupSafe-2.1.5-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (26 kB)
Downloading numpy-1.25.2-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (14.2 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 14.2/14.2 MB 3.8 MB/s eta 0:00:00
Downloading wrapt-1.16.0-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (80 kB)
Downloading aenum-3.1.15-py3-none-any.whl (137 kB)
Downloading pycparser-2.22-py3-none-any.whl (117 kB)
Installing collected packages: pyserial, aenum, wrapt, pycparser, numpy, markupsafe, greenlet, python-can, Jinja2, cffi
Successfully installed Jinja2-3.1.4 aenum-3.1.15 cffi-1.15.1 greenlet-2.0.2 markupsafe-2.1.5 numpy-1.25.2 pycparser-2.22 pyserial-3.4 python-can-3.3.4 wrapt-1.16.0
[OK] Changes saved!

###### Switching to Klipper's new source repository ...

###### Stopping all Klipper instances ...

###### Stop klipper.service ...
[OK] OK!

###### Creating backup of klipper in /home/biqu/kiauh-backups/klipper-backups/Klipper3d ...
[OK] Backup successful!

###### Creating backup of klippy-env in /home/biqu/kiauh-backups/klipper-backups/Klipper3d ...
[OK] Backup successful!

###### Cloning repository from 'https://github.com/DangerKlippers/danger-klipper'
[OK] Clone successful!
[OK] Checkout successful!

###### Installing dependencies ...
[INFO] The following packages need installation:
● libusb-1.0
[OK] Packages successfully installed.

###### Recreating Klipper virtualenv ...

###### Set up Python virtual environment ...

###### Set up Python virtual environment ...
[OK] Setup of virtualenv successful!

###### Updating pip ...
[OK] Updating pip successful!

###### Installing Python requirements ...
[OK] Installing Python requirements successful!
[OK] Switched to https://github.com/DangerKlippers/danger-klipper at branch master!

###### Restarting all Klipper instances ...

###### Start klipper.service ...
[OK] OK!
```
Check the output for errors, but assuming nothing went wrong, the installation of DangerKlipper should be complete. Select `Option B` to go back to the main menu to see the updated details.
```
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~ [ KIAUH Settings ] ~~~~~~~~~~~~~~~~~ ║
╟───────────────────────────────────────────────────────╢
║ Klipper:                                              ║
║  ● Repo:   klipper                                    ║
║  ● Owner:  Klipper3d                                  ║
║  ● Branch: master                                     ║
╟───────────────────────────────────────────────────────╢
║ Moonraker:                                            ║
║  ● Repo:   moonraker                                  ║
║  ● Owner:  Arksine                                    ║
║  ● Branch: master                                     ║
╟───────────────────────────────────────────────────────╢
║ Install unstable releases:                            ║
║  [ ] Mainsail                                         ║
║  [ ] Fluidd                                           ║
╟───────────────────────────────────────────────────────╢
║ Auto-Backup:                                          ║
║  [ ] Automatic backup before update                   ║
╟───────────────────────────────────────────────────────╢
║ 1) Set Klipper source repository                      ║
║ 2) Set Moonraker source repository                    ║
║                                                       ║
║ 3) Toggle unstable Mainsail releases                  ║
║ 4) Toggle unstable Fluidd releases                    ║
║                                                       ║
║ 5) Toggle automatic backups before updates            ║
╟───────────────────────────────────────────────────────╢
║                       B) « Back                       ║
╚═══════════════════════════════════════════════════════╝
###### Perform action: B

╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~~~~~~ [ KIAUH ] ~~~~~~~~~~~~~~~~~~~~~ ║
║        Klipper Installation And Update Helper         ║
║ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ║
╚═══════════════════════════════════════════════════════╝
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~~~~ [ Main Menu ] ~~~~~~~~~~~~~~~~~~~ ║
╟──────────────────┬────────────────────────────────────╢
║  0) [Log-Upload] │   Klipper: Installed: 1            ║
║                  │     Owner: DangerKlippers          ║
║  1) [Install]    │      Repo: danger-klipper          ║
║  2) [Update]     ├────────────────────────────────────╢
║  3) [Remove]     │ Moonraker: Installed: 1            ║
║  4) [Advanced]   │     Owner: Arksine                 ║
║  5) [Backup]     │      Repo: moonraker               ║
║                  ├────────────────────────────────────╢
║  S) [Settings]   │        Mainsail: Installed         ║
║                  │          Fluidd: Not installed     ║
║ Community:       │   Client-Config: Mainsail-Config   ║
║  E) [Extensions] │                                    ║
║                  │   KlipperScreen: Installed         ║
║                  │       Crowsnest: Installed         ║
╟──────────────────┼────────────────────────────────────╢
║  v6.0.0-alpha.9  │  Changelog: https://git.io/JnmlX   ║
╟──────────────────┴────────────────────────────────────╢
║                        Q) Quit                        ║
╚═══════════════════════════════════════════════════════╝
###### Perform action: q
###### Happy printing!
```


