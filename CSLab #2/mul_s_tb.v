`include "Multiplier_modules.v"

module tb;
    reg [7:0] A, B;
    reg clk, areset;
    wire [15:0] product;

    multiplier8x8 M(product, A, B, clk, areset);

    initial begin
        $dumpfile("mul.vcd");
        $dumpvars(0, tb);

        // $monitor(
        //     "[%02g, %b] %08d x %08d = %016d",
        //     $time, areset, A, B, product
        // );
        clk = 0;
        #5 areset = 1; A = 8'd255; B = 8'd1; clk = 1; 
        $display(
            "----\n[%02g, %b] %08b x %08b = %016b\n-----\n",
            $time, areset, A, B, product
        );
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