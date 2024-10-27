# KIAUH and DangerKlipper

The Klipper Installation and Update Helper, aka KIAUH, is a super-useful tool to do what its name implies - install and update Klipper and a host of other related software. 
It also has provisions for installing DangerKlipper - the latest version of Klipper that enables additional but risky features not included in the regular Klipper software.

***NOTE: Do not attempt any of these steps while a print is running. Many of these will cause Klipper to restart, thus ending the current print job.***

## Contents
[Step 1: Install KIAUH](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_h/KIAUH_danger.md#step-1-install-kiauh)<br/>
[Step 2: Use KIAUH to install updates](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_h/KIAUH_danger.md#step-2-use-kiauh-to-perform-updates)<br/>
[Step 3: Use KIAHU to install additional software](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_h/KIAUH_danger.md#step-3-use-kiauh-to-install-optional-software)<br/>
[Step 4: Use KIAUH to install DangerKlipper](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_h/KIAUH_danger.md#step-4-use-kiauh-to-install-dangerklipper)<br/>

## Step 1: Install KIAUH
KIAUH can be used to install Klipper on a system where it has never been installed previously, or on a system like the Troodon 2.0 Pro where Klipper is already installed. Using KIAUH makes it easy to perform updates and install additional software beyond just the Klipper basics.
The [KIAUH GitHub repository](https://github.com/dw-0/kiauh) has the most current information, but the basic installation involves the following.

1. Login to your printer with SSH.
2. For a Troodon 2.0 Pro, the default username and password are both `biqu`.
3. Install the git command if it hasn't been installed previously by using the command `sudo apt-get update && sudo apt-get install git -y`
4. Clone the KIAUH repository using the command `cd ~ && git clone https://github.com/dw-0/kiauh.git`
5. Launch KIAUH by using the command `./kiauh/kiauh.sh`

As of this writing, an alpha version of KIAUH 6 is available for testing. Launching KIAUH gets you to the main menu which looks like this.
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
###### Perform action:
```

## Step 2. Use KIAUH to perform updates
For the software that KIAUH knows about, including the operating system, KIAUH can help keep things up to date. From the KIAUH main menu, simply select `Option 2` to get to the Updates page.
From here, use either `Option A` to update everything or selectively choose which updates you want to apply.

```
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
###### Perform action: 2
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~~~ [ Update Menu ] ~~~~~~~~~~~~~~~~~~ ║
╟───────────────────────┬───────────────┬───────────────╢
║  a) Update all        │               │               ║
║                       │ Current:      │ Latest:       ║
║ Klipper & API:        ├───────────────┼───────────────╢
║  1) Klipper           │ v0.12.0-486   │ v0.12.0-486   ║
║  2) Moonraker         │ v0.9.3        │ v0.9.3-1      ║
║                       │               │               ║
║ Webinterface:         ├───────────────┼───────────────╢
║  3) Mainsail          │ v2.12.0       │ v2.12.0       ║
║  4) Fluidd            │ -             │ v1.30.5       ║
║                       │               │               ║
║ Client-Config:        ├───────────────┼───────────────╢
║  5) Mainsail-Config   │ v1.2.1        │ v1.2.1        ║
║  6) Fluidd-Config     │ v1.2.0        │ v1.2.0        ║
║                       │               │               ║
║ Other:                ├───────────────┼───────────────╢
║  7) KlipperScreen     │ v0.4.4-17     │ v0.4.4-17     ║
║  8) Crowsnest         │ v4.1.9-1      │ v4.1.9-1      ║
║                       ├───────────────┴───────────────╢
║  9) System            │    24 upgrades available!     ║
╟───────────────────────┴───────────────────────────────╢
║                       B) « Back                       ║
╚═══════════════════════════════════════════════════════╝
###### Perform action: A
```
Once an option has been selected, KIAUH may ask for confirmation for each component being updated. Once confirmed, it will perform the update and then return to this page. Here's an example of what this looks like.

```
###### Updating all components ...
[INFO] Klipper is already up to date! Skipped ...
###### Update Moonraker now? (Y/n): y
hint: Pulling without specifying how to reconcile divergent branches is
hint: discouraged. You can squelch this message by running one of the following
hint: commands sometime before your next pull:
hint:
hint:   git config pull.rebase false  # merge (the default strategy)
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint:
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
Updating 71f9e67..4e00a07
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (1/1), 11.30 KiB | 3.77 MiB/s, done.
Fast-forward
 moonraker/components/application.py | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)
Requirement already satisfied: pip in ./moonraker-env/lib/python3.9/site-packages (24.2)
Collecting pip
  Downloading pip-24.3-py3-none-any.whl.metadata (3.7 kB)
Downloading pip-24.3-py3-none-any.whl (1.8 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.8/1.8 MB 2.1 MB/s eta 0:00:00
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 24.2
    Uninstalling pip-24.2:
      Successfully uninstalled pip-24.2
Successfully installed pip-24.3
Looking in links: /home/biqu/moonraker/scripts/python_wheels
Ignoring tornado: markers 'python_version == "3.7"' don't match your environment
Ignoring pillow: markers 'python_version == "3.7"' don't match your environment
Ignoring streaming-form-data: markers 'python_version == "3.7"' don't match your environment
Ignoring importlib_metadata: markers 'python_version == "3.7"' don't match your environment
Requirement already satisfied: tornado==6.4.1 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 4)) (6.4.1)
Requirement already satisfied: pyserial==3.4 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 5)) (3.4)
Requirement already satisfied: pyserial-asyncio==0.6 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 6)) (0.6)
Requirement already satisfied: pillow==10.3.0 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 8)) (10.3.0)
Requirement already satisfied: streaming-form-data==1.15.0 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 10)) (1.15.0)
Requirement already satisfied: distro==1.9.0 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 11)) (1.9.0)
Requirement already satisfied: inotify-simple==1.3.5 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 12)) (1.3.5)
Requirement already satisfied: libnacl==2.1.0 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 13)) (2.1.0)
Requirement already satisfied: paho-mqtt==1.6.1 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 14)) (1.6.1)
Requirement already satisfied: zeroconf==0.131.0 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 15)) (0.131.0)
Requirement already satisfied: preprocess-cancellation==0.2.1 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 16)) (0.2.1)
Requirement already satisfied: jinja2==3.1.4 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 17)) (3.1.4)
Requirement already satisfied: dbus-next==0.2.3 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 18)) (0.2.3)
Requirement already satisfied: apprise==1.8.0 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (1.8.0)
Requirement already satisfied: ldap3==2.9.1 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 20)) (2.9.1)
Requirement already satisfied: python-periphery==2.4.1 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 21)) (2.4.1)
Requirement already satisfied: importlib_metadata==8.2.0 in ./moonraker-env/lib/python3.9/site-packages (from -r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 23)) (8.2.0)
Requirement already satisfied: smart-open>=6.0 in ./moonraker-env/lib/python3.9/site-packages (from streaming-form-data==1.15.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 10)) (6.4.0)
Requirement already satisfied: async-timeout>=3.0.0 in ./moonraker-env/lib/python3.9/site-packages (from zeroconf==0.131.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 15)) (4.0.2)
Requirement already satisfied: ifaddr>=0.1.7 in ./moonraker-env/lib/python3.9/site-packages (from zeroconf==0.131.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 15)) (0.2.0)
Requirement already satisfied: MarkupSafe>=2.0 in ./moonraker-env/lib/python3.9/site-packages (from jinja2==3.1.4->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 17)) (2.1.3)
Requirement already satisfied: certifi in ./moonraker-env/lib/python3.9/site-packages (from apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (2023.5.7)
Requirement already satisfied: requests in ./moonraker-env/lib/python3.9/site-packages (from apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (2.31.0)
Requirement already satisfied: requests-oauthlib in ./moonraker-env/lib/python3.9/site-packages (from apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (1.3.1)
Requirement already satisfied: click>=5.0 in ./moonraker-env/lib/python3.9/site-packages (from apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (8.1.4)
Requirement already satisfied: markdown in ./moonraker-env/lib/python3.9/site-packages (from apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (3.4.3)
Requirement already satisfied: PyYAML in ./moonraker-env/lib/python3.9/site-packages (from apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (6.0)
Requirement already satisfied: pyasn1>=0.4.6 in ./moonraker-env/lib/python3.9/site-packages (from ldap3==2.9.1->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 20)) (0.5.0)
Requirement already satisfied: zipp>=0.5 in ./moonraker-env/lib/python3.9/site-packages (from importlib_metadata==8.2.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 23)) (3.16.0)
Requirement already satisfied: charset-normalizer<4,>=2 in ./moonraker-env/lib/python3.9/site-packages (from requests->apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (3.2.0)
Requirement already satisfied: idna<4,>=2.5 in ./moonraker-env/lib/python3.9/site-packages (from requests->apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (3.4)
Requirement already satisfied: urllib3<3,>=1.21.1 in ./moonraker-env/lib/python3.9/site-packages (from requests->apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (2.0.3)
Requirement already satisfied: oauthlib>=3.0.0 in ./moonraker-env/lib/python3.9/site-packages (from requests-oauthlib->apprise==1.8.0->-r /home/biqu/moonraker/scripts/moonraker-requirements.txt (line 19)) (3.2.2)

###### Stop moonraker.service ...
[OK] OK!

###### Updating repository 'https://github.com/Arksine/moonraker' ...

###### Updating pip ...
[OK] Updating pip successful!

###### Installing Python requirements ...
[OK] Installing Python requirements successful!

###### Start moonraker.service ...
[OK] OK!
[INFO] Mainsail is already up to date! Skipped ...
[INFO] Mainsail-Config is already up to date! Skipped ...
[INFO] Fluidd is not installed! Skipped ...
[INFO] Fluidd-Config is already up to date! Skipped ...
[INFO] KlipperScreen is already up to date! Skipped ...
[INFO] Crowsnest is already up to date! Skipped ...

┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃             [ UPGRADABLE SYSTEM UPDATES ]             ┃
┠───────────────────────────────────────────────────────┨
┃ The following packages will be upgraded:              ┃
┃                                                       ┃
┃ distro-info-data, e2fsprogs, ffmpeg, libavcodec58,    ┃
┃ libavdevice58, libavfilter7, libavformat58,           ┃
┃ libavresample4, libavutil56, libcom-err2, libext2fs2, ┃
┃ libperl5.32, libpostproc55, libsepol1-dev, libsepol1, ┃
┃ libsqlite3-0, libss2, libswresample3, libswscale5,    ┃
┃ linux-libc-dev, logsave, perl-base, perl-             ┃
┃ modules-5.32, perl                                    ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
###### Continue? (Y/n): Y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
The following packages will be upgraded:
  distro-info-data e2fsprogs ffmpeg libavcodec58 libavdevice58 libavfilter7 libavformat58 libavresample4 libavutil56 libcom-err2 libext2fs2 libperl5.32 libpostproc55 libsepol1 libsepol1-dev libsqlite3-0 libss2 libswresample3
  libswscale5 linux-libc-dev logsave perl perl-base perl-modules-5.32
24 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 21.9 MB of archives.
After this operation, 144 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian-security bullseye-security/main arm64 libperl5.32 arm64 5.32.1-4+deb11u4 [3,917 kB]
Get:2 http://deb.debian.org/debian-security bullseye-security/main arm64 perl arm64 5.32.1-4+deb11u4 [293 kB]
Get:3 http://deb.debian.org/debian-security bullseye-security/main arm64 perl-base arm64 5.32.1-4+deb11u4 [1,499 kB]
Get:4 http://deb.debian.org/debian-security bullseye-security/main arm64 perl-modules-5.32 all 5.32.1-4+deb11u4 [2,824 kB]
Get:5 http://deb.debian.org/debian-security bullseye-security/main arm64 logsave arm64 1.46.2-2+deb11u1 [74.9 kB]
Get:6 http://deb.debian.org/debian-security bullseye-security/main arm64 libext2fs2 arm64 1.46.2-2+deb11u1 [251 kB]
Get:7 http://deb.debian.org/debian-security bullseye-security/main arm64 e2fsprogs arm64 1.46.2-2+deb11u1 [588 kB]
Get:8 http://deb.debian.org/debian-security bullseye-security/main arm64 libcom-err2 arm64 1.46.2-2+deb11u1 [74.1 kB]
Get:9 http://deb.debian.org/debian-security bullseye-security/main arm64 libsepol1-dev arm64 3.1-1+deb11u1 [332 kB]
Get:10 http://deb.debian.org/debian-security bullseye-security/main arm64 libsepol1 arm64 3.1-1+deb11u1 [247 kB]
Get:11 http://deb.debian.org/debian-security bullseye-security/main arm64 distro-info-data all 0.51+deb11u7 [8,436 B]
Get:12 http://deb.debian.org/debian-security bullseye-security/main arm64 ffmpeg arm64 7:4.3.8-0+deb11u1 [1,589 kB]
Get:13 http://deb.debian.org/debian-security bullseye-security/main arm64 libavdevice58 arm64 7:4.3.8-0+deb11u1 [128 kB]
Get:14 http://deb.debian.org/debian-security bullseye-security/main arm64 libavfilter7 arm64 7:4.3.8-0+deb11u1 [1,169 kB]
Get:15 http://deb.debian.org/debian-security bullseye-security/main arm64 libswscale5 arm64 7:4.3.8-0+deb11u1 [190 kB]
Get:16 http://deb.debian.org/debian-security bullseye-security/main arm64 libavformat58 arm64 7:4.3.8-0+deb11u1 [1,004 kB]
Get:17 http://deb.debian.org/debian-security bullseye-security/main arm64 libavcodec58 arm64 7:4.3.8-0+deb11u1 [4,573 kB]
Get:18 http://deb.debian.org/debian-security bullseye-security/main arm64 libswresample3 arm64 7:4.3.8-0+deb11u1 [107 kB]
Get:19 http://deb.debian.org/debian-security bullseye-security/main arm64 libpostproc55 arm64 7:4.3.8-0+deb11u1 [92.7 kB]
Get:20 http://deb.debian.org/debian-security bullseye-security/main arm64 libavresample4 arm64 7:4.3.8-0+deb11u1 [99.7 kB]
Get:21 http://deb.debian.org/debian-security bullseye-security/main arm64 libavutil56 arm64 7:4.3.8-0+deb11u1 [304 kB]
Get:22 http://deb.debian.org/debian-security bullseye-security/main arm64 libsqlite3-0 arm64 3.34.1-3+deb11u1 [750 kB]
Get:23 http://deb.debian.org/debian-security bullseye-security/main arm64 libss2 arm64 1.46.2-2+deb11u1 [78.3 kB]
Get:24 http://deb.debian.org/debian-security bullseye-security/main arm64 linux-libc-dev arm64 5.10.226-1 [1,750 kB]
Fetched 21.9 MB in 7s (3,195 kB/s)
(Reading database ... 77689 files and directories currently installed.)
Preparing to unpack .../libperl5.32_5.32.1-4+deb11u4_arm64.deb ...
Unpacking libperl5.32:arm64 (5.32.1-4+deb11u4) over (5.32.1-4+deb11u3) ...
Preparing to unpack .../perl_5.32.1-4+deb11u4_arm64.deb ...
Unpacking perl (5.32.1-4+deb11u4) over (5.32.1-4+deb11u3) ...
Preparing to unpack .../perl-base_5.32.1-4+deb11u4_arm64.deb ...
Unpacking perl-base (5.32.1-4+deb11u4) over (5.32.1-4+deb11u3) ...
Setting up perl-base (5.32.1-4+deb11u4) ...
(Reading database ... 77689 files and directories currently installed.)
Preparing to unpack .../perl-modules-5.32_5.32.1-4+deb11u4_all.deb ...
Unpacking perl-modules-5.32 (5.32.1-4+deb11u4) over (5.32.1-4+deb11u3) ...
Preparing to unpack .../logsave_1.46.2-2+deb11u1_arm64.deb ...
Unpacking logsave (1.46.2-2+deb11u1) over (1.46.2-2) ...
Preparing to unpack .../libext2fs2_1.46.2-2+deb11u1_arm64.deb ...
Unpacking libext2fs2:arm64 (1.46.2-2+deb11u1) over (1.46.2-2) ...
Setting up libext2fs2:arm64 (1.46.2-2+deb11u1) ...
(Reading database ... 77689 files and directories currently installed.)
Preparing to unpack .../e2fsprogs_1.46.2-2+deb11u1_arm64.deb ...
Unpacking e2fsprogs (1.46.2-2+deb11u1) over (1.46.2-2) ...
Preparing to unpack .../libcom-err2_1.46.2-2+deb11u1_arm64.deb ...
Unpacking libcom-err2:arm64 (1.46.2-2+deb11u1) over (1.46.2-2) ...
Setting up libcom-err2:arm64 (1.46.2-2+deb11u1) ...
(Reading database ... 77689 files and directories currently installed.)
Preparing to unpack .../libsepol1-dev_3.1-1+deb11u1_arm64.deb ...
Unpacking libsepol1-dev:arm64 (3.1-1+deb11u1) over (3.1-1) ...
Preparing to unpack .../libsepol1_3.1-1+deb11u1_arm64.deb ...
Unpacking libsepol1:arm64 (3.1-1+deb11u1) over (3.1-1) ...
Setting up libsepol1:arm64 (3.1-1+deb11u1) ...
(Reading database ... 77689 files and directories currently installed.)
Preparing to unpack .../00-distro-info-data_0.51+deb11u7_all.deb ...
Unpacking distro-info-data (0.51+deb11u7) over (0.51+deb11u6) ...
Preparing to unpack .../01-ffmpeg_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking ffmpeg (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../02-libavdevice58_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libavdevice58:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../03-libavfilter7_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libavfilter7:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../04-libswscale5_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libswscale5:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../05-libavformat58_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libavformat58:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../06-libavcodec58_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libavcodec58:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../07-libswresample3_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libswresample3:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../08-libpostproc55_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libpostproc55:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../09-libavresample4_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libavresample4:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../10-libavutil56_7%3a4.3.8-0+deb11u1_arm64.deb ...
Unpacking libavutil56:arm64 (7:4.3.8-0+deb11u1) over (7:4.3.7-0+deb11u1) ...
Preparing to unpack .../11-libsqlite3-0_3.34.1-3+deb11u1_arm64.deb ...
Unpacking libsqlite3-0:arm64 (3.34.1-3+deb11u1) over (3.34.1-3) ...
Preparing to unpack .../12-libss2_1.46.2-2+deb11u1_arm64.deb ...
Unpacking libss2:arm64 (1.46.2-2+deb11u1) over (1.46.2-2) ...
Preparing to unpack .../13-linux-libc-dev_5.10.226-1_arm64.deb ...
Unpacking linux-libc-dev:arm64 (5.10.226-1) over (5.10.223-1) ...
Setting up distro-info-data (0.51+deb11u7) ...
Setting up perl-modules-5.32 (5.32.1-4+deb11u4) ...
Setting up libsqlite3-0:arm64 (3.34.1-3+deb11u1) ...
Setting up libsepol1-dev:arm64 (3.1-1+deb11u1) ...
Setting up linux-libc-dev:arm64 (5.10.226-1) ...
Setting up libavutil56:arm64 (7:4.3.8-0+deb11u1) ...
Setting up libss2:arm64 (1.46.2-2+deb11u1) ...
Setting up libpostproc55:arm64 (7:4.3.8-0+deb11u1) ...
Setting up libperl5.32:arm64 (5.32.1-4+deb11u4) ...
Setting up logsave (1.46.2-2+deb11u1) ...
Setting up libswscale5:arm64 (7:4.3.8-0+deb11u1) ...
Setting up e2fsprogs (1.46.2-2+deb11u1) ...
update-initramfs: deferring update (trigger activated)
e2scrub_all.service is a disabled or a static unit not running, not starting it.
Setting up libswresample3:arm64 (7:4.3.8-0+deb11u1) ...
Setting up libavresample4:arm64 (7:4.3.8-0+deb11u1) ...
Setting up perl (5.32.1-4+deb11u4) ...
Setting up libavcodec58:arm64 (7:4.3.8-0+deb11u1) ...
Setting up libavformat58:arm64 (7:4.3.8-0+deb11u1) ...
Setting up libavfilter7:arm64 (7:4.3.8-0+deb11u1) ...
Setting up libavdevice58:arm64 (7:4.3.8-0+deb11u1) ...
Setting up ffmpeg (7:4.3.8-0+deb11u1) ...
Processing triggers for man-db (2.9.4-2) ...
Processing triggers for libc-bin (2.31-13+deb11u11) ...
Processing triggers for initramfs-tools (0.140) ...
ln: failed to create hard link '/boot/initrd.img-5.16.17-sun50iw9.dpkg-bak' => '/boot/initrd.img-5.16.17-sun50iw9': Operation not permitted
update-initramfs: Generating /boot/initrd.img-5.16.17-sun50iw9
update-initramfs: Converting to u-boot format

###### Upgrading system packages ...
[OK] Packages successfully upgraded.
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~~~ [ Update Menu ] ~~~~~~~~~~~~~~~~~~ ║
╟───────────────────────┬───────────────┬───────────────╢
║  a) Update all        │               │               ║
║                       │ Current:      │ Latest:       ║
║ Klipper & API:        ├───────────────┼───────────────╢
║  1) Klipper           │ v0.12.0-486   │ v0.12.0-486   ║
║  2) Moonraker         │ v0.9.3-1      │ v0.9.3-1      ║
║                       │               │               ║
║ Webinterface:         ├───────────────┼───────────────╢
║  3) Mainsail          │ v2.12.0       │ v2.12.0       ║
║  4) Fluidd            │ -             │ v1.30.5       ║
║                       │               │               ║
║ Client-Config:        ├───────────────┼───────────────╢
║  5) Mainsail-Config   │ v1.2.1        │ v1.2.1        ║
║  6) Fluidd-Config     │ v1.2.0        │ v1.2.0        ║
║                       │               │               ║
║ Other:                ├───────────────┼───────────────╢
║  7) KlipperScreen     │ v0.4.4-17     │ v0.4.4-17     ║
║  8) Crowsnest         │ v4.1.9-1      │ v4.1.9-1      ║
║                       ├───────────────┴───────────────╢
║  9) System            │    No upgrades available.     ║
╟───────────────────────┴───────────────────────────────╢
║                       B) « Back                       ║
╚═══════════════════════════════════════════════════════╝
###### Perform action:
```

## Step 3. Use KIAUH to install optional software
The Troodon 2.0 Pro ships by default with regular Klipper, Moonraker, and KlipperScreen installed, as well as Mainsail for the user interface. 
KIAUH makes it easy to install the Fluidd user interface if you'd prefer to use that instead. It also supports the installation of Crowsnest, which is used to manage webcams. 
Simply select `Option 1` from the main menu to install one of these.
```
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
###### Perform action: 1
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~ [ Installation Menu ] ~~~~~~~~~~~~~~~ ║
╟───────────────────────────┬───────────────────────────╢
║ Firmware & API:           │ Touchscreen GUI:          ║
║  1) [Klipper]             │  7) [KlipperScreen]       ║
║  2) [Moonraker]           │                           ║
║                           │ Webcam Streamer:          ║
║ Webinterface:             │  8) [Crowsnest]           ║
║  3) [Mainsail]            │                           ║
║  4) [Fluidd]              │                           ║
║                           │                           ║
║ Client-Config:            │                           ║
║  5) [Mainsail-Config]     │                           ║
║  6) [Fluidd-Config]       │                           ║
╟───────────────────────────┴───────────────────────────╢
║                       B) « Back                       ║
╚═══════════════════════════════════════════════════════╝
###### Perform action:
```
In addition, other community-developed software, now referred to as Extensions in KIAUH, can be installed and managed by KIAUH. These can be installed by selecting `Option E` from the main menu.
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
###### Perform action: e
╔═══════════════════════════════════════════════════════╗
║ ~~~~~~~~~~~~~~~~ [ Extensions Menu ] ~~~~~~~~~~~~~~~~ ║
╟───────────────────────────────────────────────────────╢
║ Available Extensions:                                 ║
║                                                       ║
║ 1) G-Code Shell Command                               ║
║ 2) Mainsail Theme Installer                           ║
║ 3) Mobileraker                                        ║
║ 4) Klipper-Backup                                     ║
║ 5) Moonraker Telegram Bot                             ║
║ 6) Obico for Klipper                                  ║
║ 7) OctoEverywhere for Klipper                         ║
║ 8) PrettyGCode for Klipper                            ║
║ 9) OctoApp for Klipper                                ║
║ 10) SimplyPrint                                       ║
╟───────────────────────────────────────────────────────╢
║                       B) « Back                       ║
╚═══════════════════════════════════════════════════════╝
###### Perform action:
```
1. [G-Code Shell Command](https://github.com/dw-0/kiauh/blob/master/docs/gcode_shell_command.md) - We use this extension in the [Scripts](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/scripts.md) that are found here in the WelcomeToTroodon repository. This extension makes it possible to call Linux bash scripts from within G-Code macros, including passing in current print state information like the current layer or filename. These bash scripts can also output information to the Klipper log. 
2. [Mainsail Theme Installer](https://docs.mainsail.xyz/overview/features/themes/themes) - Who doesn't like themes? There isn't a huge array of themes, but there are themes that make better use of higher-resolution desktop displays.
3. [Mobileraker](https://mobileraker.com/) - Connect your phone to your printer, with various options for fully remote access.
4. [Klipper-Backup](https://github.com/Staubgeborener/klipper-backup) - Automatically backup Klipper to a GitHub repository.
5. [Moonraker Telegram Bot](https://github.com/nlef/moonraker-telegram-bot) - Connects your printer to Telegram allowing for remote monitoring and control without a VPN or other software.
6. [Obico for Klipper](https://www.obico.io/klipper.html) - A remote access option with print monitoring, optional self-hosting, and more.
7. [OctoEverywhere for Klipper](https://octoeverywhere.com/?source=klipper_welcome_page&noredirect=t) - A remote access option with print monitoring and more.
8. [PrettyGcode for Klipper](https://github.com/Kragrathea/pgcode) - A G-Code visualizer/simulator that can also be used for real-time print monitoring.
9. [OctoApp for Klipper](https://blog.octoeverywhere.com/octoapp-for-klipper-octoprint-upgrade-your-printers-main-display/) - Another option for connecting your phone to your printer if you're using one of the Octo options
10. [SimplyPrint](https://simplyprint.io/) - This is used as an alternative to Mainsail or Fluidd and can be used to manage multiple printers, even supporting tasks like sending the same print job to multiple printers.

***NOTE: KIAUH 6 doesn't currently list Spoolman (a tool for managing your filament collection) though it did previously and likely will again in the near future.***

Installation of any of these extensions is quick and easy by selecting the option from the menu and following the prompts.

## Step 4. Use KIAUH to install DangerKlipper
In this step, what we're doing is changing the Klipper repository that KIAUH is using to maintain the Klipper installation. 

By pointing it at the DangerKlipper URL, and selecting a branch (master in this case), KIAUH has everything it needs to perform the update.

***NOTE: This step only applies if you want to use DangerKlipper. For most purposes, Klipper's regular fork works very well. 
DangerKlipper is only likely to be of interest to those who are heavily modifying their printers, using an MMU, upgrading motors, or working with other software that can benefit from the latest version of Klipper.***

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

## References
- [KIAUH](https://github.com/dw-0/kiauh) - Klipper Installation and Update Helper
- [DangerKlipper](https://github.com/DangerKlippers/danger-klipper) - The "risky" fork of Klipper with additional features
  
- [G-Code Shell Command](https://github.com/dw-0/kiauh/blob/master/docs/gcode_shell_command.md)
- [Mainsail Themes](https://docs.mainsail.xyz/overview/features/themes/themes)
- [Mobileraker](https://mobileraker.com/)
- [Klipper-Backup](https://github.com/Staubgeborener/klipper-backup)
- [Moonraker Telegram Bot](https://github.com/nlef/moonraker-telegram-bot)
- [Obico for Klipper](https://www.obico.io/klipper.html)
- [OctoEverywhere for Klipper](https://octoeverywhere.com/?source=klipper_welcome_page&noredirect=t)
- [PrettyGCode for Klipper](https://github.com/Kragrathea/pgcode)
- [OctoApp for Klipper](https://blog.octoeverywhere.com/octoapp-for-klipper-octoprint-upgrade-your-printers-main-display/)
- [SimplyPrint](https://simplyprint.io/)


