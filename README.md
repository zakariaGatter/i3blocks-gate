# i3Blocks Gate

Is a all in one collection of small script show you useful information about your system

## Installation requires:
* Font Awesome
* lm-senser
* alsa-utils
* pulseaudio
* acpi
* mpd
* mpc
* ncmpcpp
* moc
* sysstat
* cmus
* xprop
* Networkmanager

---
## Help Dialog
```
there is 38 deffirent script to use

Almost all script use the same syntax
    i3b-gate [NUMBER] [ICON]

Except :
    7  : i3b-gate 7 [MOINT_POINT] [ICON]
    12 : i3b-gate 12 [NUMBER] [ICON]

No Argument :
    6  : You give no argumment
    18 : You give no argumment
    37 : You give no argumment
    39 : You give no argumment

Explaine :
    If you use 37, you get a status line about all workspaces u used on i3
    37 don't show you the None used Workspace

    Example : [1] 2 [*3]

    [1]  : Unfocued Workspaces
    2    : the focused Workspace
    [*3] : The Urgent workspace

each 39 script and what they do

 1 : Show CPU Usage
 2 : Show ALL CPUs Usage
 3 : Show MEM Usage
 4 : Show SWAP Usage
 5 : Show Date and Time
 6 : Show Battery Usage ans status
 7 : Show Disk Usage
 8 : Show Keyboard layout
 9 : Show System Language
10 : Show Uptime
11 : Show Trash Size
12 : Show Window Title
13 : Show Music Status on (Moc)
14 : Show Music Status on (Mpd)
15 : Show CPU TEMP
16 : Show GPU TEMP
17 : Show Touchpad Status
18 : show Volume Status (alsa)
19 : Show Wifi Info IP4
20 : Show Ethernet Info IP4
21 : Show Wifi Info IP6
22 : Show Ethernet Info IP6
23 : Show Number of Prosses use by this current user
24 : Show System Kernel
25 : Show Usb Pluged in your system
26 : Show Total packages in Your system (Ubuntu)
27 : Show if there is any updates (Ubuntu)
28 : Show UFW Status (systemctl)
29 : Show NumberLock status
30 : Show Bluetooth Status
31 : Show CapsLock Status
32 : Show x screensaver Status
33 : Show Number of Mointed Points on System
34 : Show Music Status on (CMUS)
35 : Show Apparmor Status
36 : Show Total packages in Your system (Arch)
37 : Show i3 Workspaces Status
38 : Show User NAME
39 : show Volume Status (pulse)
```
---

### What's New

* Give You Access to change Icons with text or any other symbol
* Add new script to show more information about your System
* ALL-IN-ONE Gather All the Scripts in one place for easy Access
* Add Help Dialog to Give You Information You need to know
* Add workspace display script using i3-msg

---

### Installation

```bash
git clone https://github.com/zakariagatter/i3blocks-gate
mkdir -p ~/.local/bin
cp Ubuntu/i3b-gate ~/.local/bin
```


### configuration
```sh
[NAME]
command=i3b-gate [1-39]
interval=[1-9]
color=#XXXXXX
```
