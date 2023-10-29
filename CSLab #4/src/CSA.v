`ifndef _CARRY_SAVE_ADDER
`define _CARRY_SAVE_ADDER

`include "src/FAdder.v"

module CSA_Adder8 (
    output [7:0] Cout,
    output [7:0] Sum,
    input [7:0] A, B, C
);
   FAdder F0 (.Cout(Cout[0]), .Sum(Sum[0]), .A(A[0]), .B(B[0]), .Cin(C[0]));
   FAdder F1 (.Cout(Cout[1]), .Sum(Sum[1]), .A(A[1]), .B(B[1]), .Cin(C[1]));
   FAdder F2 (.Cout(Cout[2]), .Sum(Sum[2]), .A(A[2]), .B(B[2]), .Cin(C[2]));
   FAdder F3 (.Cout(Cout[3]), .Sum(Sum[3]), .A(A[3]), .B(B[3]), .Cin(C[3]));
   FAdder F4 (.Cout(Cout[4]), .Sum(Sum[4]), .A(A[4]), .B(B[4]), .Cin(C[4]));
   FAdder F5 (.Cout(Cout[5]), .Sum(Sum[5]), .A(A[5]), .B(B[5]), .Cin(C[5]));
   FAdder F6 (.Cout(Cout[6]), .Sum(Sum[6]), .A(A[6]), .B(B[6]), .Cin(C[6]));
   FAdder F7 (.Cout(Cout[7]), .Sum(Sum[7]), .A(A[7]), .B(B[7]), .Cin(C[7]));
endmodule

`endif 