`ifndef _WALLACE_TREE_MULTIPLIER
`define _WALLACE_TREE_MULTIPLIER

`include "src/CLA.v"
`include "src/CSA.v"

// 4x4 multiplier, product at most 8 bits  
module WT_Multiplier4x4 (
    output [7:0] Product,
    input [3:0] A, B
);
    wire [7:0] ppdt0, ppdt1, ppdt2, ppdt3;

    assign ppdt0 = {4'b0, A & {4{B[0]}}};
    assign ppdt1 = {3'b0, A & {4{B[1]}}, 1'b0};
    assign ppdt2 = {2'b0, A & {4{B[2]}}, 2'b0};
    assign ppdt3 = {1'b0, A & {4{B[3]}}, 3'b0};

    /* First Round - CSA */

    wire [7:0] S0, C0;

    CSA_Adder8 A0 (
        .Cout(C0), .Sum(S0), 
        .A(ppdt0), .B(ppdt1), .C(ppdt2)
    );

    /* Second Round - CSA */

    wire [7:0] S1, C1;

    CSA_Adder8 A1 (
        .Cout(C1), .Sum(S1), 
        .A({C0[6:0], 1'b0}), .B(S0), .C(ppdt3)
    );

    /* Third Round - CLA */

    CLA_Adder8 A2 (
        .Cout(), .Sum(Product),
        .A({C1[6:0], 1'b0}), .B(S1), .Cin(1'b0)
    );

endmodule

`endif 