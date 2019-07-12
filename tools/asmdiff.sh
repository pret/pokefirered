#!/bin/bash

OBJDUMP="./tools/binutils/bin/arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$1 --stop-address=$2"
$OBJDUMP $OPTIONS baserom.gba > baserom.dump
$OBJDUMP $OPTIONS pokefirered.gba > pokefirered.dump
diff -u baserom.dump pokefirered.dump
