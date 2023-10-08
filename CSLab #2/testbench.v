`include "Multiplier.v"

module tb;
    reg [7:0] A, B;
    reg clk, areset;
    wire [15:0] product;

    multiplier8x8 M(product, A, B, clk, areset);

    initial begin
        $monitor(
            "[%3g] %8b x %8b = %8b %8b",
            $time, A, B, product[15:8], product[7:0]
        );
        clk = 0;
        #5 areset = 1; A = 8'b100; B = 8'b101; clk = 1; 
        #5 areset = 0; clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
        #5 clk = 0; clk = 1;
    end

endmodule