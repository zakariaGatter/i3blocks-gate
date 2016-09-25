#!/bin/bash

trash=$(ls -A -1 ~/.local/share/Trash/files/ | wc -l)

if [ "$trash" = "0" ];then 
    echo -e ""
else
    echo -e " $trash "
fi 
