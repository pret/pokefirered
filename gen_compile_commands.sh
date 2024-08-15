#!/usr/bin/env bash

set -euo pipefail

which compiledb || { echo compiledb not found, please install using "pip install compiledb"; exit 1; }

CC=arm-none-eabi-gcc CXX=arm-none-eabi-g++ compiledb make
