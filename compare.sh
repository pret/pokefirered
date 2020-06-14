#!/bin/sh
# Compares baserom.gba and pokefirered.gba

# create baserom.txt if necessary
if [ ! -f baserom.txt ]; then
	hexdump -C baserom.gba > baserom.txt # can create an empty baserom.txt if no baserom.gba
fi

hexdump -C pokefirered.gba > pokefirered.txt

diff -u baserom.txt pokefirered.txt | less
