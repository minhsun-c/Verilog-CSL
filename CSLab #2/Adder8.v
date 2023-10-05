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
    Full_Adder F1(ctemp[2], Sum[0], A[0], B[0], ctemp[1]);
    Full_Adder F2(ctemp[3], Sum[0], A[0], B[0], ctemp[2]);
    Full_Adder F3(ctemp[4], Sum[0], A[0], B[0], ctemp[3]);
    Full_Adder F4(ctemp[5], Sum[0], A[0], B[0], ctemp[4]);
    Full_Adder F5(ctemp[6], Sum[0], A[0], B[0], ctemp[5]);
    Full_Adder F6(ctemp[7], Sum[0], A[0], B[0], ctemp[6]);
    Full_Adder F7(Cout, Sum[0], A[0], B[0], ctemp[7]);
endmodule

`endif 