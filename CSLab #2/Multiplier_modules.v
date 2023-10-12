`ifndef _8x8_MULTIPLIER
`define _8x8_MULTIPLIER

`include "Adder8.v"
`include "FSM.v"

// performing out = A * B
module multiplier8x8 (
    output reg [15:0] product,
    input [7:0] multiplicand, multiplier,
    input clk, areset
);
    parameter INIT = 0;
    parameter EXEC = 1;
    parameter IDLE = 2;
    parameter HALT = 3;

    reg [7:0] B;
    wire [7:0] tempSum; 
    wire Cout;
    reg [1:0] state; 
    wire [1:0] next_state;

    MUL_FSM ControlUnit(
        .state(next_state),
        .multiplier(B),
        .clk(clk),
        .areset(areset)
    );

    Adder8 ALU(
        .Cout(Cout), 
        .Sum(tempSum),
        .A(product[15:8]), 
        .B(multiplicand),
        .Cin(1'b0)
    );
    
    always @(negedge clk) $display("");

    // state transition logic
    always @(posedge clk) begin 
        $display("[%2g] B: %08b , state: %d", $time, B, state);
        // if (areset) begin
        //     B = multiplier;
        //     product = 16'b0;
        // end
        if (state == HALT && areset) begin
            B = multiplier;
            product = 16'b0;
        end
        else if (state == INIT) begin
            B = multiplier;
            product = 16'b0;
        end
        else if (state == EXEC) begin
            $display("[%2g] EXEC: prod: %8b, tempSum: %08b", $time, product[7:1], tempSum);
            product = {Cout, tempSum, product[7:1]};
            B = {1'b0, B[7:1]};
            $display("[%2g] product: %08b %08b | %8d", $time, product[15:8], product[7:0], product);
        end
        else if (state == IDLE) begin
            product = {1'b0, product[15:1]};
            B = {1'b0, B[7:1]};
            $display("[%2g] product: %08b %08b | %8d", $time, product[15:8], product[7:0], product);
        end
        else begin // HALT
            product = product;
            B = B;
            $display("[%2g] product: %08b %08b | %8d", $time, product[15:8], product[7:0], product);
        end
    end

    always @(negedge clk) state = next_state;

endmodule
`endif