#!/bin/bash 

Key=$(cat /etc/default/keyboard | grep XKBLAYOUT | cut -d "=" -f2 | tr -d '"')

echo -e " $Key"
