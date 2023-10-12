`include "Multiplier_modules.v"

module tb;
    reg [7:0] A, B;
    reg clk, areset;
    wire [15:0] product;

    multiplier8x8 M(product, A, B, clk, areset);

    initial begin
        $dumpfile("mul.vcd");
        $dumpvars(0, tb);

        clk = 0;
        #5 areset = 1; A = 8'd255; B = 8'd100; clk = 1; 
        #5 clk = 0; areset = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;

        $display("\n-----\n");
                
        #5 clk = 0; areset = 1; A = 8'd255; B = 8'd255; clk = 1; 
        #5 clk = 0; areset = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;

        $display("\n-----\n");
                
        #5 clk = 0; areset = 1; A = 8'd1; B = 8'd1; clk = 1; 
        #5 clk = 0; areset = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
    end

endmodule