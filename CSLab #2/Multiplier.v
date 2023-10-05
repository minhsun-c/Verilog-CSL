`ifndef _8x8_MULTIPLIER
`define _8x8_MULTIPLIER

`include "Adder8.v"
`include "ShiftReg.v"

// performing out = A * B
module multiplier (
    output [15:0] out,
    input [7:0] A, B
);
    // q, clk, areset, data
    Shift_Reg8 mult(A);
    Shift_Reg8 mplier(B);

endmodule

`endif