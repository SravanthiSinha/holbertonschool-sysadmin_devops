#!/bin/bash
a=0;
b=0;
c=1;
while IFS='' read -r line || [[ -n "$line" ]]; do
        if [[ $line == *"HEAD"* ]]  ; then
	    a=$((a+1))		 
	elif [[ $line == *"GET"* ]]  ; then
	    b=$((b+1))
	fi
done < "$1"
echo $a
echo $b
