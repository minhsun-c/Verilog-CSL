`ifndef _CARRY_LOOKAHEAD_ADDER
`define _CARRY_LOOKAHEAD_ADDER

module CLA_Adder4 (
    output Cout,
    output [3:0] Sum,
    input [3:0] A, B,
    input Cin
);
   wire [3:0] P, G;
   wire [3:1] C;

    // Compute propagate, generate
    assign P = A ^ B;
    assign G = A & B;

    // Compute all Carry
    assign C[1] = P[0] & Cin | G[0];
    assign C[2] = P[1] & C[1] | G[1];
    assign C[3] = P[2] & C[2] | G[2];
    assign Cout = P[3] & C[3] | G[3];

    // Compute all Sum
    assign Sum[0] = A[0] ^ B[0] ^ Cin;
    assign Sum[1] = A[1] ^ B[1] ^ C[1];
    assign Sum[2] = A[2] ^ B[2] ^ C[2];
    assign Sum[3] = A[3] ^ B[3] ^ C[3];
endmodule

`endif 