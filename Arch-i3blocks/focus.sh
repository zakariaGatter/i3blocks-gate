#!/bin/bash

focus=$(xdotool getactivewindow getwindowname)
focus_Number=$(xdotool getactivewindow getwindowname | wc -c)
Focus_N=$(xdotool getactivewindow getwindowname | head -c 40 )

if [ "$focus" = "" ];then
    echo -e " : Gatter Linux "
else
    if [ "$focus_Number" -gt "40" ];then
        echo -e " : $Focus_N ..."
    else
        echo -e " : $focus"
    fi
fi
