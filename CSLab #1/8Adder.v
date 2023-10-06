`ifndef _8ADDER_V
`define _8ADDER_V

`include "fAdder.v"

module Adder8(
    input [7:0] A, B,
    input Cin,
    output [7:0] Sum,
    output Cout    
);
    wire [7:1] Ctemp;
    Full_Adder F0(A[0], B[0], Cin, Sum[0], Ctemp[1]);
    Full_Adder F1(A[1], B[1], Ctemp[1], Sum[1], Ctemp[2]);
    Full_Adder F2(A[2], B[2], Ctemp[2], Sum[2], Ctemp[3]);
    Full_Adder F3(A[3], B[3], Ctemp[3], Sum[3], Ctemp[4]);
    Full_Adder F4(A[4], B[4], Ctemp[4], Sum[4], Ctemp[5]);
    Full_Adder F5(A[5], B[5], Ctemp[5], Sum[5], Ctemp[6]);
    Full_Adder F6(A[6], B[6], Ctemp[6], Sum[6], Ctemp[7]);
    Full_Adder F7(A[7], B[7], Ctemp[7], Sum[7], Cout);
endmodule

`endif