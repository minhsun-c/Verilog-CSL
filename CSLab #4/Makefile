OUTPUTFILE = wallace
run: clear build testbench.v
	iverilog -o build/$(OUTPUTFILE) testbench.v
	vvp build/$(OUTPUTFILE) > build/log
build:
	mkdir build
clear:
	rm -rf build