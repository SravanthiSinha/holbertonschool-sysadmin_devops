#!/bin/bash
deci=$(echo -|awk '{printf "%.1f", "'$2'"/10}')
sleep $(echo - |awk '{print "'$1'" + "'$deci'"}')

