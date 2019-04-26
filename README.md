# i3Blocks Gate

Is a all in one collection of small script show you useful information about your system

## Installation requires:
    * __Font Awesome__
    * __lm-senser__
    * __alsa-utils__
    * __acpi__
    * __mpd__
    * __mpc__
    * __ncmpcpp__
    * __moc__
    * __sysstat__
    * __cmus__
    * __xdg-utils__
    * __ifconfig__

---
## Help Dialog
```
there is 35 deffirent script to use

Almost all script use the same syntax
    i3b-gate [NUMBER] [ICON]

Except :
    7  : i3b-gate 7 [MOINT_POINT] [ICON]
    12 : i3b-gate 12 [NUMBER] [ICON]

No Argument :
    34 : You give no argumment
    6  : You give no argumment
    18 : You give no argumment

Explaine :
    If you use 34, you get a status line about all workspaces u used on i3
    34 don't show you the None used Workspace

    Example : [1] 2 [*3]

    [1] : Unfocued Workspaces
    2   : the focused Workspace
    [*3] : The Urgent workspace

each 35 script and what they do

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
18 : show Volume Status
19 : Show Wifi Info
20 : Show Ethernet Info
21 : Show Number of Prosses use by this current user
22 : Show System Kernel
23 : Show Usb Pluged in your system
24 : Show Total packages in Your system (Ubuntu)
25 : Show if there is any updates (Ubuntu)
26 : Show UFW Status
27 : Show NumberLock status
28 : Show Bluetooth Status
29 : Show CapsLock Status
30 : Show x screensaver Status
31 : Show Number of Mointed Points on System
32 : Show Music Status on (CMUS)
33 : Show Apparmor Status
34 : Show i3 Workspaces Status
35 : Show User NAME
36 : Show Total packages in Your system (Arch)
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
git clone https://gitlab.com/zakariagatter/i3blocks-gate
mkdir -p ~/.local/bin
cp Ubuntu/i3b-gate ~/.local/bin
```


### configuration
```sh
[NAME]
command=i3b-gate [1-35]
interval=5
color=#XXXXXX
```

### Support

 * [Patreon](https://www.patreon.com/gatter_linux)
