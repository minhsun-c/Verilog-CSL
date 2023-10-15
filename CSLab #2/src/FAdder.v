`ifndef _FULL_ADDER
`define _FULL_ADDER

module Full_Adder (
    output Cout, Sum,
    input A, B, Cin
);
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
    assign Sum = A ^ B ^ Cin;
endmodule

`endif