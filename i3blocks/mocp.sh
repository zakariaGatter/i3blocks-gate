#!/bin/bash 

Title=$(mocp -i | grep "^Title:" | cut -d ":" -f2)
Status=$(mocp -i | grep "^State:" | cut -d ":" -f2)

if [ "$Status" != " PLAY" ];then 
    echo -e " Pause"
else
    echo -e " $Title "
fi
