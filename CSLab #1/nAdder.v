`ifndef _NADDER_V
`define _NADDER_V

`include "fAdder.v"

module nAdder #(parameter N = 8) (
    input [N-1 : 0] A, B,
    input Cin,
    output [N-1 : 0] Sum,
    output Cout
);  
    wire [N : 0] Ctemp;

    assign Ctemp[0] = Cin;
    generate
        for (genvar i=0; i<N; i=i+1) 
            Full_Adder f_i(A[i], B[i], Ctemp[i], Sum[i], Ctemp[i+1]);
    endgenerate
    assign Cout = Ctemp[N];

endmodule

`endif