`ifndef _CARRY_LOOKAHEAD_ADDER
`define _CARRY_LOOKAHEAD_ADDER

module CLA_Adder8 (
    output Cout,
    output [7:0] Sum,
    input [7:0] A, B,
    input Cin
);
   wire [7:0] P, G;
   wire [7:1] C;

    // Compute propagate, generate
    assign P = A ^ B;
    assign G = A & B;

    // Compute all Carry
    assign C[1] = P[0] & Cin  | G[0];
    assign C[2] = P[1] & C[1] | G[1];
    assign C[3] = P[2] & C[2] | G[2];
    assign C[4] = P[3] & C[3] | G[3];
    assign C[5] = P[4] & C[4] | G[4];
    assign C[6] = P[5] & C[5] | G[5];
    assign C[7] = P[6] & C[6] | G[6];
    assign Cout = P[7] & C[7] | G[7];

    // Compute all Sum
    assign Sum[0] = A[0] ^ B[0] ^ Cin;
    assign Sum[1] = A[1] ^ B[1] ^ C[1];
    assign Sum[2] = A[2] ^ B[2] ^ C[2];
    assign Sum[3] = A[3] ^ B[3] ^ C[3];
    assign Sum[4] = A[4] ^ B[4] ^ C[4];
    assign Sum[5] = A[5] ^ B[5] ^ C[5];
    assign Sum[6] = A[6] ^ B[6] ^ C[6];
    assign Sum[7] = A[7] ^ B[7] ^ C[7];
endmodule

`endif 