#!/bin/bash 

Mem=$(free -h | grep "^Mem:" | awk '{print $3}')
Swap=$(free -h | grep "^Swap:" | awk '{print $3}')

if [ -z "$1" ];then 
    echo -e " $0 : no Argument \n\t -m : Show Memory usage \n\t -s : Show Swap usage "
fi 

case "$1" in 
    "-m" )
        echo -e "  $Mem"
        ;;
    "-s" )
        echo -e "  $Swap"
        ;;
esac 

unset Mem
unset Swap
