#!/bin/bash 

Update=$(apt list --upgradable | cut -d "/" -f1 | grep -v "Listing" | wc -l)

if [ "$Update" = "0" ];then 
    echo -e ""
else
    echo -e " $Update "
fi 
