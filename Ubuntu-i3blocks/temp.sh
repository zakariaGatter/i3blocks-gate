#!/bin/bash 

temp=$(sensors | grep "^CPU" | awk '{print $2}' | tr -d "+" )

echo -e " $temp"
