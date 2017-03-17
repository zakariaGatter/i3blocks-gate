#!/bin/bash 
Disk=$(df -h "$1" | grep -v "^[A-Z]" | awk '{print $3-G"/"$2}')

if [ -z "$1" ];then 
    echo -e "Enter Your Mounted Point Name Ex : \"/\" "
else
    echo -e "  $Disk "
fi 

unset Disk 
