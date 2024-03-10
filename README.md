# x729-pi5
This script pack is **ONLY** for Raspberry Pi **5**. For anyother model, the stock scripts should be used: https://wiki.geekworm.com/X729-script

Unzip the scripts into their own folder.

The following should be added to ```/boot/firmware/config.txt``` near or at the end under "```all```"
```
dtoverlay=pwm-2chan,pin2=13,func2=4
dtoverlay=i2c-rtc,ds1307
```
In a terminal, cd to the directory you unzipped them to and run the following commands.
```
chmod +x install.sh
./install.sh
```
Reboot and you're ready to go.

The following pins are considered reserved, and should NOT be used by other applications.
```
GPIO5 (29)
GPIO6 (31)
GPIO12 (32)
GPIO13 (33)
GPIO26 (37)
```
