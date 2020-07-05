#!/bin/bash
# $1: phrase to find

if [ "$2" == "" ]; then
	grep_flags="-wr"
else
	grep_flags="$2"
fi

grep "$1" "$grep_flags" --include="*.h" --include="*.s" --include="*.inc" --include="*.txt" --exclude-dir=".git" --exclude-dir=".travis" --exclude-dir="build" --exclude-dir="common_syms" --exclude-dir="data" --exclude-dir="graphics" --exclude-dir="sound" --exclude-dir="tools" --exclude-dir="berry_fix/build" --exclude-dir="berry_fix/payload/build"
