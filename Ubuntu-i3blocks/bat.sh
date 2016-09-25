#!/bin/bash 

Bat=$(acpi | cut -d " " -f4 | tr -d "%,")
Adapt=$(acpi -a | cut -d " " -f3)

if [ "$Adapt" = "on-line" ];then
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

if [ -z "$Bat" ];then 
    bat="$icon0 $Adapt"
elif [ "$Bat" -gt "100" ];then 
     bat="$icon4 Full"
elif [ "$Bat" -gt "90" ];then 
     bat="$icon3 $Bat %"
elif [ "$Bat" -gt "60" ];then 
     bat="$icon2 $Bat %"
elif [ "$Bat" -gt "30" ];then 
     bat="$icon1 $Bat %"
elif [ "$Bat" -lt "30" ];then
    bat="$icon0 $Bat %"
fi 

echo -e "$bat"
