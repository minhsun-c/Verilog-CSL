mul: clear build testbench.v
	iverilog -o build/cla testbench.v
	vvp build/cla > build/log
build:
	mkdir build
clear:
	rm -rf build