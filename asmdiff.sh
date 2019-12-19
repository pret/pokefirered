#!/bin/bash

if [ "$1" == "firered" ] || [ "$1" == "leafgreen" ] || [ "$1" == "firered_rev1" ] || [ "$1" == "leafgreen_rev1" ]; then
  buildname="$1"
  shift
else
  buildname=firered
fi

if [ "$buildname" == "firered" ]; then
  baserom=baserom
elif [ "$buildname" == "leafgreen" ]; then
  baserom=baserom_lg
elif [ "$buildname" == "firered_rev1" ]; then
  baserom=baserom_fr_rev1
elif [ "$buildname" == "leafgreen_rev1" ]; then
  baserom=baserom_lg_rev1
else
  echo unknown buildname $buildname
  exit 1
fi

OBJDUMP="$DEVKITARM/bin/arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS ${baserom}.gba > ${baserom}.dump || exit 1
$OBJDUMP $OPTIONS poke${buildname}.gba > poke${buildname}.dump
diff -u ${baserom}.dump poke${buildname}.dump
