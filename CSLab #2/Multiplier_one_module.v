`ifndef _8x8_MULTIPLIER
`define _8x8_MULTIPLIER

`include "Adder8.v"
`include "ShiftReg.v"

// performing out = A * B
module multiplier8x8 (
    output reg [15:0] product,
    input [7:0] multiplicand, multiplier,
    input clk, areset
);
    parameter run = 0;
    parameter idle = 1;
    parameter halt = 2;
    reg [7:0] A, B;
    reg [1:0] state;
    reg [4:0] cnt;
    
    always @(posedge clk, areset) begin
        if (areset) begin
            A <= multiplicand;
            B <= multiplier;
            product <= 16'b0;
            cnt = 0;
        end
        else begin
            if (cnt >= 9) state = halt;
            else if (B[0] == 1) state = run;
            else state = idle;
            cnt = cnt + 1;
        end
    end

    always @(posedge clk) begin
        if (state == halt) begin
            product = product;
            B = B;
        end
        else begin
            product = {1'b0, product[15:1]};
            B = {1'b0, B[7:1]};
        end
        if (state == idle || state == halt) begin
            product[15:8] = product[15:8];
        end
        else begin
            product[15:8] = product[15:8] + A;
        end
        
    end

endmodule

`endif