#!/bin/bash 

Vol=$(amixer -c 0 get Master | grep "Mono:" | awk '{print $4}' | tr -d "[ %]")
Mute=$(amixer -c 0 get Master | grep "Mono:" | awk '{print $6}' | tr -d "[-]")

if [ "$Mute" = "off" ];then 
    echo -e " Mute"
else
    if [ "$Vol" -gt "80" ];then
        echo -e " $Vol %"
    elif [ "$Vol" -gt "60" ];then
        echo -e " $Vol %"
    elif [ "$Vol" -gt "40" ];then
        echo -e " $Vol %"
    elif [ "$Vol" -gt "20" ];then
        echo -e " $Vol %"
    elif [ "$Vol" -eq "0" ];then 
        echo -e " $Vol %"
    fi 
fi 
 
unset Vol
unset Mute
