#!/bin/bash 

UPTIME=$(uptime -p | sed "s/ hour/H/" | sed "s/ minutes/M/" | sed "s/up //" | sed "s/, /:/")

echo -e " $UPTIME "

