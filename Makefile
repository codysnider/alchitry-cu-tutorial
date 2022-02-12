# configuration
SHELL = /bin/sh
FPGA_PKG = cb132
FPGA_TYPE = hx8k
PCF = cu.pcf

# included modules
ADD_SRC = main.v

main: main.rpt main.bin

%.json: main.v
	yosys -ql $(basename $@)-yosys.log -p 'synth_ice40 -top top -json $@' main.v

%.asc: %.json
	nextpnr-ice40 --${FPGA_TYPE} --package ${FPGA_PKG} --json $< --pcf ${PCF} --asc $@

%.rpt: %.asc
	icetime -d ${FPGA_TYPE} -mtr $@ $<

%.bin: %.asc
	icepack $< $(subst top_,,$@)

gui: %.json
	nextpnr-ice40 --gui --${FPGA_TYPE} --package ${FPGA_PKG} --json $< --pcf ${PCF} --asc main.asc

all: main

clean:
	rm -f main*.json main*.asc main*.rpt *.bin main*yosys.log

.PHONY: all clean