#!/bin/bash 
P_mpc=$(mpc | grep "^\[playing\]" | awk '{print $1}')

if [ "$P_mpc" = "[playing]" ];then 
    echo -e " $(mpc current) "
else
    echo -e " Pause "
fi
