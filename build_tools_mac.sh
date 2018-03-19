#!/bin/sh
make -C tools/gbagfx CXX=clang++
make -C tools/scaninc CXX=clang++
make -C tools/preproc CXX=clang++
make -C tools/bin2c CXX=clang++
make -C tools/rsfont CXX=clang++
make -C tools/aif2pcm CXX=clang++
make -C tools/ramscrgen CXX=clang++
