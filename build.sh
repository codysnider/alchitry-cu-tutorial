#!/bin/bash

yosys -p 'synth_ice40 -top top -blif main.blif' main.v
# arachne-pnr -d 8k -P cb132 -o main.asc -p main.pcf main.blif
nextpnr-ice40 --hx8k --top top --package cb132

icepack main.asc main.bin
