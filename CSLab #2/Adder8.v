`ifndef _8_BITS_ADDER
`define _8_BITS_ADDER

`include "FAdder.v"

module Adder8 (
    output Cout, 
    output [7:0] Sum,
    input [7:0] A, B,
    input Cin
);
    wire [7:1] ctemp;
    Full_Adder F0(ctemp[1], Sum[0], A[0], B[0], Cin);
    Full_Adder F1(ctemp[2], Sum[1], A[1], B[1], ctemp[1]);
    Full_Adder F2(ctemp[3], Sum[2], A[2], B[2], ctemp[2]);
    Full_Adder F3(ctemp[4], Sum[3], A[3], B[3], ctemp[3]);
    Full_Adder F4(ctemp[5], Sum[4], A[4], B[4], ctemp[4]);
    Full_Adder F5(ctemp[6], Sum[5], A[5], B[5], ctemp[5]);
    Full_Adder F6(ctemp[7], Sum[6], A[6], B[6], ctemp[6]);
    Full_Adder F7(Cout,     Sum[7], A[7], B[7], ctemp[7]);
endmodule

`endif 