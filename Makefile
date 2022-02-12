rot.bin: rot.v rot.pcf
	yosys -q -p "synth_ice40 -blif rot.blif" rot.v
	arachne-pnr -d 8k -P cb132 -p rot.pcf rot.blif -o rot.asc
	icebox_explain rot.asc > rot.ex
	icepack rot.txt rot.bin

clean:
	rm -f rot.blif rot.txt rot.ex rot.bin
