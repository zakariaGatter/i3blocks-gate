#!/bin/bash 

Status=$(synclient -l | grep Touchpad | awk '{print $3}')

if [ "$Status" = "0" ];then 
    echo -e "  Enable "
else
    echo -e "  Disable "
fi 
