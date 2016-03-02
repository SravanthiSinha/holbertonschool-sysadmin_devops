#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo  $line | awk -F\" ' {print $1, substr($3,1,4)}'  | awk '{print $1, $6}'    
done <"$1"
