#!/bin/bash

focus=$(xdotool getactivewindow getwindowname)

if [ "$focus" = "" ];then 
    echo -e " : Gatter Linux "
else
    echo -e " : $focus"
fi 
