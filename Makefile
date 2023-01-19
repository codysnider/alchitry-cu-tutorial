# configuration
SHELL = /bin/sh
FPGA_PKG = cb132
FPGA_TYPE = hx8k
PCF = cu.pcf

# included modules
ADD_SRC = main.v

main: main.rpt main.bin

main.json: main.v
	yosys -ql main-yosys.log -p 'synth_ice40 -top top -json $@' main.v

main.asc: main.json
	nextpnr-ice40 --${FPGA_TYPE} --package ${FPGA_PKG} --json $< --pcf ${PCF} --asc $@

main.rpt: main.asc
	icetime -d ${FPGA_TYPE} -mtr $@ $<

main.bin: main.asc
	icepack $< $@

upload: main.bin
	iceprog $<

all: main

clean:
	rm -f *.json *.asc *.rpt *.bin *yosys.log

.PHONY: all clean
