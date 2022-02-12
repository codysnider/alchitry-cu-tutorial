yosys -p 'synth_ice40 -top top -blif rot.blif' rot.v
arachne-pnr -d 8k -P cb132 -o rot.asc -p rot.pcf rot.blif
icepack rot.asc rot.bin
