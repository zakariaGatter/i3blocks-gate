# i3Blocks Gate

my i3blocks Scripts For Arch Linux more simple and more useful

| i3blocks Script | Arch Depen        | Ubuntu Depen     | ScreenShot |
|-----------------|-------------------|------------------|------------|
| bat.sh          | ACPI              | ACPI             | ![img](./screenshot/bat.png)
| date.sh         | ------            | ------           | ![img](./screenshot/date.png)
| focus.sh        | Xdotool           | Xdotool          | ![img](./screenshot/focus.png)
| mem.sh          | ------            | ------           | ![img](./screenshot/mem.png)
| mpd.sh          | Mpd, Ncmpcpp, Mpc | Mpd, Ncmpcpp, Mpc| ![img](./screenshot/mpd.png)
| temp.sh         | xsensors          | xsensors         | ![img](./screenshot/temp.png)
| trash.sh        | ----              | -----            | ![img](./screenshot/trash.png)
| vol.sh          | alsa              | alsa             | ![img](./screenshot/vol.png)
| cpu.sh          | sysstat           | sysstat          | ![img](./screenshot/cpu.png)
| disk.sh         | ------            | -----            | ![img](./screenshot/disk.png)
| key_l.sh        | ------            | -----            | ![img](./screenshot/key_layout.png)
| mocp.sh         | Moc               | Moc              | ![img](./screenshot/mocp.png)
| net.sh          | ------            | -----            | ![img](./screenshot/net.png)
| touchpad.sh     | ------            | -----            | ![img](./screenshot/touchpad.png)
| update.sh       | checkupdates AUR  | -----            | ![img](./screenshot/update.png)

---

### Configuration

##### Battery
```sh
[Bat]
command=~/.config/i3blocks/scripts/bat.sh
interval=30
color=#CC0099
```

##### Time
```sh
[Time]
command=~/.config/i3blocks/scripts/date.sh
interval=60
color=#6699FF
```

##### Focus Window
```sh
[Focus]
command=~/.config/i3blocks/scripts/focus.sh
interval=1
color=#FF6666
```

##### Ram Memory
```sh
[Ram]
command=~/.config/i3blocks/scripts/mem.sh -m
interval=10
color=#FF6600
```

##### Swap Memory
```sh
[Swap]
command=~/.config/i3blocks/scripts/mem.sh -s
interval=10
color=#6699FF
```

##### MPD
```sh
[MPD]
command=~/.config/i3blocks/scripts/mpd.sh
interval=5
color=#66CCFF
```

##### Cpu Temp
```sh
[Temp]
command=~/.config/i3blocks/scripts/temp.sh
interval=60
color=#6699FF
```

##### Trash
```sh
[Trash]
command=~/.config/i3blocks/scripts/trash.sh
interval=60
color=#c68c53
```

##### Volume
```sh
[Vol]
command=~/.config/i3blocks/scripts/Vol.sh
interval=3
color=#9933FF
```

##### Cpu usage
```sh
[Cpu]
command=~/.config/i3blocks/scripts/cpu.sh
interval=5
color=#FFFF66
```

##### Disk usage
```sh
[Disk]
command=~/.config/i3blocks/scripts/disk.sh /
interval=60
color=#CC6699
```

##### Keyboard Layout
```sh
[Key]
command=~/.config/i3blocks/scripts/key_l.sh
interval=once
color=#33ff33
```

##### Mocp
```sh
[Mocp]
command=~/.config/i3blocks/scripts/mocp.sh
interval=60
color=#66CCFF
```

##### Net Ethernet
```sh
[Ether]
command=~/.config/i3blocks/scripts/net.sh -e
interval=10
color=#CC99FF
```

##### Net Wifi
```sh
[Ether]
command=~/.config/i3blocks/scripts/net.sh -w
interval=10
color=#CC99FF
```

##### Touchpad
```sh
[Touchpad]
command=~/.config/i3blocks/scripts/touchpad.sh
interval=10
color=#4d4dff
```

##### Update
```sh
[Update]
command=~/.config/i3blocks/scripts/update.sh
interval=600
color=#FFCC99
```

### [!] NOTE :
- if the scipt not useful no more it will stop display like _Update Script and Network_ they will just disappear until they use again

- In some cases you need install the icons:
  - Ubuntu
  ```bash
  apt-get install fonts-font-awesome
  ```
