#!/bin/bash 
# Zakaria Barkouk ( Zakaria.gatter@gmail.com)

# Show CPU Info - 1 (Mpstat)
_CPU_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    cpu_usage=$(mpstat -P ALL | awk '/all/{print $3}');
    echo "$icon $cpu_usage%"
}

# Show Multi Cpu Info - 2 (Mpstat)
_CPUS_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    cpus_usage=$(mpstat -P ALL \
	| cut -d " " -f3- \
	| column -t \
	| awk '/^[0-9]/{print $2"%"}' \
	| tr "\n" " ");
    echo "$icon $cpus_usage"
}

# Show Memory Usage - 3 (Free)
_MEM_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    mem_usage=$(free -h | awk '/^Mem:/{print $3"/"$2}');
    echo "$icon $mem_usage"
}

# SHOW SWAP USAGE - 4 (FREE)
_SWAP_ () {

    [ -z "$1" ] && icon=" " || icon="$1"

    swap_usage=$(free -h | awk '/^Swap:/{print $3}');
    echo "$icon $swap_usage"
}



# Show Date and Time - 5 (Date)
_DATE_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    date_time=$(date +%D\ %R);
    echo "$icon $date_time"
}

# Show Battery Status - 6 (acpi)
_BAT_ () {
    Bat=$(acpi | awk '{print $4}'| tr -d "%");
    adapt=$(acpi -a | awk '{print $3}');

    if [ "$adapt" = "on-line" ];then
	icon0=""
	icon1=""
	icon2=""
	icon3=""
	icon4=""
    else
	icon0=""
	icon1=""
	icon2=""
	icon3=""
	icon4=""
    fi

    [ -z "$Bat" ] && bat="$icon0 $adapt"
    [ "$Bat" -gt "100" ] && bat="$icon4 Full"
    [ "$Bat" -gt "90" ] && bat="$icon3 $Bat %"
    [ "$Bat" -gt "60" ] && bat="$icon2 $Bat %"
    [ "$Bat" -gt "30" ] && bat="$icon1 $Bat %"
    [ "$Bat" -lt "30" ] && bat="$icon0 $Bat %"

echo "$bat"
}

# Show Disk Usage - 7 (df)
_DISK_ () {

    [ -z "$2" ] && icon="" || icon="$2"

    disk_usage=$(df -h "$1" | awk '/\/dev\//{print $3-G"/"$2}');
    echo "$icon $disk_usage"
}

# Show Keyboard Layout - 8
_KEY_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    key_layout=$(cat /etc/default/keyboard \
	| awk -F= '/XKBLAYOUT/{print $2}'\
	| tr -d '"');
    echo "$icon $key_layout"
}

#Show System language - 9
_LANG_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    echo "$icon $LANGUAGE"
}

#Show Machine Uptime - 10 (uptime)
_UPTIME_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    uptime=$(uptime -p \
	| sed -E 's/ hour/H/g; s/ hours/H/g; s/ minutes/M/g; s/ minute/M/g; s/ day/D/g; s/ days/D/; s/up //g') 

    echo "$icon $uptime"
}

#Show Trash Size - 11 (du)
_TRASH_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    TRASH_FOLDER="$HOME/.local/share/Trash/files"

    SIZE=$(du -h $TRASH_FOLDER | awk '{print $1}');

echo  "$icon $SIZE"

}

#Show Window Usage - 12 (xdotool)
_WINDOW_ () {

    [ -z "$1" ] && icon="" || icon="$1"
    [ -z "$2" ] && CAR="30" || CAR="$2"

    focus=$(xdotool getactivewindow getwindowname)
    focus_Number=$(xdotool getactivewindow getwindowname | wc -c)
    Focus_N=$(xdotool getactivewindow getwindowname | head -c $CAR )

if [ -z "$focus" ];then
        echo "$icon Welcome"
 else
    [ "$focus_Number" -gt "$CAR" ] && echo "$icon $Focus_N ..." || echo "$icon $focus"
fi
}

#Show Mocp playing song and status - 13 (moc)
_MOCP_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    Title=$(mocp -Q %title)
    F_Title=$(mocp -Q %file)
    Status=$(mocp -Q %state)


if [ "$Status" != "PLAY" ];then 
        echo "$icon Pause"
elif [ -z "$Title" ];then 
    echo "$icon $(basename $F_Title)"
else
    echo "$icon $Title"
fi
}

#Show mpd Playing song and status - 14 (mpd; ncmpccp, mpc)
_MPD_ () {

    [ -z "$1" ] && icon="" || icon="$1"

NCMP=$(mpc | awk '/^\[playing\]/{print $1}')
_NCMP=$(mpc | head -1 )

if [ "$NCMP" = "[playing]" ];then 
    echo "$icon $(basename $(mpc current)) "
else
    echo "$icon Pause "
fi
}

#Show Cpu Temp - 15 (xsenser)
_TEMP_ () {

    [ -z "$1" ] && icon="" || icon="$1"

temp=$(sensors | awk '/^CPU/{print $2}' | tr -d "+" )

echo "$icon $temp"
}

#Show Gpu Temp - 16 (xsenser)
_GPU_TEMP_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    gpu_temp=$(sensors | awk '/^GPU/{print $2}' | tail -1 | tr -d "+" );

    echo "$icon $gpu_temp"
}

#Show Touchpad status - 17 (sysclient)
_TOUCHPAD_ () {

    [ -z "$1" ] && icon="" || icon="$1"

Status=$(synclient -l | awk '/Touchpad/{print $3}')

[ "$Status" = "0" ] && echo "$icon Enable" || echo "$icon Disable"

}

#Show Volume Status - 18 (alsa)
_VOLUME_ () {
Vol=$(amixer -c 0 get Master | awk '/Mono:/{print $4}' | tr -d "[ %]")
Mute=$(amixer -c 0 get Master | awk '/Mono:/{print $6}' | tr -d "[-]")

if [ "$Mute" = "off" ];then 
    echo -e " Mute"
else
    if [ "$Vol" -gt "80" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -gt "60" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -gt "40" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -gt "20" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -eq "0" ];then 
        echo -e " $Vol%"
    fi 
fi
}

#Show Wifi info ; ip ; connected name - 19 (ifconfig; nmcli)
_WIFI_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    
(nmcli d | awk '/wifi/{print $1}') | while read W ; do 
    W_C=$(nmcli d | awk '/'"$W"'/{print $3}');
    W_N=$(nmcli d | awk '/'"$W"'/{print $4}');
    W_IP=$(ifconfig "$W" | awk '/inet /{print $2}' | cut -d: -f2);

    [ "$W_C" == "connected" ] && echo -n "$icon $W_IP ($W_N) " || echo -n "$icon --- "

done
}

#Show Ethernet info ; ip ; connected name - 20 (ifconfig; nmcli)
_ETHERNET_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    
(nmcli d | awk '/ethernet/{print $1}') | while read E ; do 
    E_C=$(nmcli d | awk '/'"$E"'/{print $3}');
    E_N=$(nmcli d | awk '/'"$E"'/{print $4}');
    E_IP=$(ifconfig $E | awk '/inet addr/{print $2}' | cut -d: -f2);

    [ "$E_C" == "connected" ] && echo -n "$icon $E_IP ($E_N) " || echo -n "$icon --- "

done
}

#Show prosses use by this User - 21 (ps)
_PS_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    ps_usage=$(ps -U $USER | wc -l);

    echo "$icon $ps_usage"
}

#Show System Kerenel - 22 (uname)
_KERNEL_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    kernel_name=$(uname -r);

    echo "$icon $kernel_name"
}

#Show Usb Plug in ur Computer - 23 (lsblk)
_USB_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    USBS=$(lsblk -l -o 'TRAN' | grep "usb" | wc -l);

    echo "$icon $USBS"
}

#Show Total pkgs install in your system - 24 (dpkg)
_PKGS_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    pkgs=$(dpkg -l | awk '/^ii/{print }' | wc -l);

    echo "$icon $pkgs"
}

#Check if there is any Update in ur system - 25 (apt-get)
_UPDATE_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    U_PKGS=$(apt-get -s -o APT::Get::Show-User-Simulation-Note=0 dist-upgrade | grep "^\s\s" | wc -w);

    echo "$icon $U_PKGS"
}

#Show ufw Status - 26 (ufw)
_UFW_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    S_UFW=$(systemctl status ufw | awk '/Active:/{print $2}');

    [ "$S_UFW" == "active" ] && echo "$icon On" || echo "$icon Off"
}

#Show number lock status - 27 
_NUM_LOCK_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    NUM_LOCK=$(xset -q | awk '/00:/{print $8}');

    [ "$NUM_LOCK" == "on" ] && echo "$icon On" || echo "$icon Off"
}

#Show Bluetooth Status - 28 
_BLUETOOTH_ () {

    [ -z "$1" ] && icon="" || icon="$1"


    S_BLU=$(systemctl status bluetooth.target | awk '/Active:/{print $2}');

    [ "$S_BLU" == "active" ] && echo "$icon On" || echo "$icon Off"
    
}

#Show Caps lock status - 29 
_CAPS_LOCK_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    CAPS_LOCK=$(xset -q | awk '/00:/{print $4}');

    [ "$CAPS_LOCK" == "on" ] && echo "$icon On" || echo "$icon Off"
}

#Display X screensaver state - 30
_X_SCREENSAVER_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    X_SCREEN=$(xssstate -s);

    [ "$X_SCREEN" = "off" ] && echo "$icon Off" || echo "$icon On"
}

#Calcule Mount Points on System - 31
_MOUNT_ () {

    [ -z "$1" ] && icon="" || icon="$1"

    MP=$(cat /proc/mounts | grep "^/dev/s*" | wc -l)

echo "$icon $MP"
}

#Usage Dialog 
USAGE () {
echo -e "
$(basename $0) : Simple script Collaction for i3blocks 

	Utils : 
	    (1)  :
		-  Show CPU Info * Deps : (Mpstat)
		    usage : $0 1 \"\$ICON\"
	    (2)  :
		-  Show Multi Cpu Info * Deps : (Mpstat)
		    usage : $0 2 \"\$ICON\"
	    (3)  :
		-  Show Memory Usage * Deps : (Free)
		    usage : $0 3 \"\$ICON\"
	    (4)  :
		-  Show Swap Usage * Deps : (Free)
		    usage : $0 4 \"\$ICON\"
	    (5)  :
		-  Show Date and Time * Deps : (Date)
		    usage : $0 5 \"\$ICON\"
	    (6)  :
		-  Show Battery Status * Deps : (acpi)
		    usage : $0 6 
	    (7)  :
		-  Show Disk Usage * Deps : (df)
		    usage : $0 7 \"\$PARTITION\" \"\$ICON\" 
		    example : $0 7 \"/home\" \"\"
	    (8)  :
		-  Show Keyboard Layout
		    usage : $0 8 \"\$ICON\"
	    (9)  :
		-  Show System language
		    usage : $0 9 \"\$ICON\"
	    (10) :
		-  Show Machine Uptime * Deps : (uptime)
		    usage : $0 10 \"\$ICON\"
	    (11) :
		-  Show Trash Size * Deps : (du)
		    usage : $0 11 \"\$ICON\"
	    (12) :
		-  Show Window Usage * Deps : (xdotool)
		    usage : $0 12 \"\$ICON\"
	    (13) :
		-  Show Mocp playing song and status * Deps : (moc)
		    usage : $0 13 \"\$ICON\"
	    (14) :
		-  Show mpd Playing song and status * Deps : (mpd; ncmpccp, mpc)
		    usage : $0 14 \"\$ICON\"
	    (15) :
		-  Show Cpu Temp * Deps : (xsenser)
		    usage : $0 15 \"\$ICON\"
	    (16) :
		-  Show Gpu Temp * Deps : (xsenser)
		    usage : $0 16 \"\$ICON\"
	    (17) :
		-  Show Touchpad status * Deps : (sysclient)
		    usage : $0 17 \"\$ICON\"
	    (18) :
		-  Show Volume Status * Deps : (alsa)
		    usage : $0 18  
	    (19) :
		-  Show Wifi info ; ip ; connected name * Deps : (ifconfig; nmcli)
		    usage : $0 19 \"\$ICON\"
	    (20) :
		-  Show Ethernet info ; ip ; connected name *Deps : (ifconfig; nmcli)
		    usage : $0 20 \"\$ICON\"
	    (21) :
		-  Show prosses use by this User * Deps : (ps)
		    usage : $0 21 \"\$ICON\"
	    (22) :
		-  Show System Kerenel * Deps : (uname)
		    usage : $0 22 \"\$ICON\"
	    (23) :
		-  Show Usb Plug in ur Computer * Deps : (lsblk)
		    usage : $0 23 \"\$ICON\"
	    (24) :
		-  Show Total pkgs install in your system * Deps : (dpkg)
		    usage : $0 24 \"\$ICON\"
	    (25) :
		-  Check if there is any Update in ur system * Deps : (apt-get)
		    usage : $0 25 \"\$ICON\"
	    (26) :
		-  Show ufw Status * Deps : (ufw)
		    usage : $0 26 \"\$ICON\"
	    (27) :
		-  Show number lock status 
		    usage : $0 27 \"\$ICON\"
	    (28) :
		-  Show Bluetooth Status 
		    usage : $0 28 \"\$ICON\"
	    (29) :
		-  Show Caps Lock Status
		    usage : $0 29 \"\$ICON\"
	    (30) :
		-  Show X screensaver status
		    usage : $0 30 \"\$ICON\"
	    (31) :
		-  Calcule Mount Points on System - 31
		    usage : $0 31 \"\$ICON\"
	    (-h): 
		- Show this help message 
" |less
}


case $1 in 
    1 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _CPU_ "$2"
	;;
    2 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _CPUS_ "$2"
	;;
    3 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _MEM_ "$2"
	;;
    4 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _SWAP_ "$2"
	;;
    5 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _DATE_ "$2"
	;;
    6 )
	[ "$#" -gt "1" ] && {echo " $0 : To many Argument " && return 0 }
	    _BAT_
	;;
    7 )
	[ "$#" -gt "3" ] && {echo " $0 : To many Argument " && return 0 }
	    _DISK_ "$2" "$3"
	;;
    8 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _KEY_ "$2"
	;;
    9 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _LANG_ "$2"
	;;
    10 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _UPTIME_ "$2"
	;;
    11 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _TRASH_ "$2"
	;;
    12 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _WINDOW_ "$2" "$3"
	;;
    13 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _MOCP_ "$2"
	;;
    14 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _MPD_ "$2"
	;;
    15 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _TEMP_ "$2"
	;;
    16 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _GPU_TEMP_ "$2"
	;;
    17 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _TOUCHPAD_ "$2"
	;;
    18 )
	[ "$#" -gt "1" ] && {echo " $0 : To many Argument " && return 0 }
	    _VOLUME_
	;;
    19 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _WIFI_ "$2"
	;;
    20 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _ETHERNET_ "$2"
	;;
    21 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _PS_ "$2"
	;;
    22 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _KERNEL_ "$2"
	;;
    23 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _USB_ "$2"
	;;
    24 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _PKGS_ "$2"
	;;
    25 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _UPDATE_ "$2"
	;;
    26 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _UFW_ "$2"
	;;
    27 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _NUM_LOCK_ "$2"
	;;
    28 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _BLUETOOTH_ "$2"
	;;
    29 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _CAPS_LOCK_  "$2"
	;;
    30 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _X_SCREENSAVER_ "$2"
	;;
    31 )
	[ "$#" -gt "2" ] && {echo " $0 : To many Argument " && return 0 }
	    _MOUNT_ "$2"
	;;
    -h | --help )
	[ "$#" -gt "1" ] && {echo " $0 : To many Argument " && return 0 }
	    USAGE
	;;
    * )
	echo -e " $0 \n\t-h | --help : to Show Help Dialog"
	;;
esac
