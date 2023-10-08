`include "Multiplier_one_module.v"

module tb;
    reg [7:0] A, B;
    reg clk, areset;
    wire [15:0] product;

    multiplier8x8 M(product, A, B, clk, areset);

    initial begin
        $monitor(
            "[%3g, %b] %8d x %8d = %8d",
            $time, areset, A, B, product
        );
        clk = 0;
        #5 areset = 1; A = 8'd123; B = 8'd23; clk = 1; 
        #5 areset = 0; clk = 0; clk = 1;
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