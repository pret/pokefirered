#!/bin/bash

# Pokemon Fire Red Build Script
# Sets up all required environment variables

# devkitPro settings
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM

# Add devkitPro tools, Homebrew, and ARM compiler to PATH
export PATH="/opt/homebrew/bin:/opt/devkitpro/tools/bin:$DEVKITARM/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# Homebrew library paths for host tools (not for ARM compilation)
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig"
export CFLAGS="-I/opt/homebrew/include"
export CXXFLAGS="-I/opt/homebrew/include"
export LDFLAGS="-L/opt/homebrew/lib"

# Run make with all arguments passed to this script
cd "$(dirname "$0")"
make MODERN=1 "$@"
