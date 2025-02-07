#!/bin/bash

for directory in data/maps/* ; do
	pory_exists=$(find $directory -name $"scripts.pory" | wc -l)
	if [[ $pory_exists -eq 0 ]]; 
	then
		inc_exists=$(find $directory -name $"scripts.inc" | wc -l)
		if [[ $inc_exists -ne 0 ]]; 
		then
			echo "Converting: $directory/scripts.inc"
			touch "$directory/scripts.pory"
			echo 'raw `' >> "$directory/scripts.pory"
			cat "$directory/scripts.inc" >> "$directory/scripts.pory"
			echo '`' >> "$directory/scripts.pory"
		fi
	fi 	
done