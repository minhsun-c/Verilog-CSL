`include "8Adder.v"

module nAdder_tb;

    reg [7:0] A, B;
    reg C;
    wire [7:0] S;
    wire Cout;
    
    Adder8  F(A, B, C, S, Cout);

    initial begin
        $dumpfile("8Adder.vcd");
        $dumpvars(1, 8Adder_tb);
        
        $monitor("Time: %3g\tA: %4d\tB: %4d\tCin: %b\tCout: %b\tSum: %4d", $time, A, B, C, Cout, S);

           A=8'd0; B=8'd250; C=1'b0;
        #5 A=8'd1; B=8'd250; C=1'b0;
        #5 A=8'd2; B=8'd250; C=1'b0;
        #5 A=8'd3; B=8'd250; C=1'b0;
        #5 A=8'd4; B=8'd250; C=1'b0;
        #5 A=8'd5; B=8'd250; C=1'b0;
        #5 A=8'd6; B=8'd250; C=1'b0;
        #5 A=8'd7; B=8'd250; C=1'b0;
        #5 A=8'd8; B=8'd250; C=1'b0;
        #5 A=8'd9; B=8'd250; C=1'b0;
        #5 A=8'd0; B=8'd250; C=1'b1;
        #5 A=8'd1; B=8'd250; C=1'b1;
        #5 A=8'd2; B=8'd250; C=1'b1;
        #5 A=8'd3; B=8'd250; C=1'b1;
        #5 A=8'd4; B=8'd250; C=1'b1;
        #5 A=8'd5; B=8'd250; C=1'b1;
        #5 A=8'd6; B=8'd250; C=1'b1;
        #5 A=8'd7; B=8'd250; C=1'b1;
        #5 A=8'd8; B=8'd250; C=1'b1;
        #5 A=8'd9; B=8'd250; C=1'b1;
        #5 $finish;
    end

endmodule

