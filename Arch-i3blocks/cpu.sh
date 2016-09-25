#!/bin/bash 

Cpu=$(mpstat -u | grep "all" | awk '{print $4"%"}')

echo -e " $Cpu"
