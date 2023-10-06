`ifndef _FADDER_V
`define _FADDER_V

module Full_Adder(
    input A, B, Cin,
    output Sum, Cout    
);
    // assign Sum = A ^ B ^ Cin;
    // assign Cout = (A & B) | (A & Cin) | (B & Cin);
    assign {Cout, Sum} = A + B + Cin;
endmodule

`endif