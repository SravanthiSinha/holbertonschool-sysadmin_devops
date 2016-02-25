#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
        if [[ $line == *"HEAD"* ]]  ; then
	    echo $line;
	fi	 
done < "$1"
