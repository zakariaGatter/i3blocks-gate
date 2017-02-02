#!/bin/bash 

Title=$(mocp -i | grep "^Title:" | cut -d ":" -f2)
NUM_Title=$(echo -e "$Title" | wc -c )
S_Title=$(echo -e "$Title" | head -c 30)
Status=$(mocp -i | grep "^State:" | cut -d ":" -f2)

if [ "$Status" != " PLAY" ];then 
        echo -e " : Pause"
else
    if [ "$NUM_Title" -lt 30 ];then 
        echo -e " : $Title "
    else
        echo -e " : $S_Title ... "
    fi 
fi
