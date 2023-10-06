`include "fAdder.v"

module FAdder_tb;

    reg A, B, C;
    wire S, Cout;
    
    Full_Adder F(A, B, C, S, Cout);

    initial begin
        $dumpfile("FAdder.vcd");
        $dumpvars(1, FAdder_tb);
        // $monitor("Time: %2g, A: %b, B: %b, C: %b, S: %b, O: %b", $time, A, B, C, S, Cout);
        #5 A = 1'b0; B = 1'b0; C = 1'b0;
        #5 A = 1'b0; B = 1'b1; C = 1'b0;
        #5 A = 1'b1; B = 1'b0; C = 1'b0;
        #5 A = 1'b1; B = 1'b1; C = 1'b0;
        #5 A = 1'b0; B = 1'b0; C = 1'b1;
        #5 A = 1'b0; B = 1'b1; C = 1'b1;
        #5 A = 1'b1; B = 1'b0; C = 1'b1;
        #5 A = 1'b1; B = 1'b1; C = 1'b1;

        #5 $finish;
    end

    always @ (*) 
        $display(
            "Time: %2g, A: %b, B: %b, C: %b, S: %b, O: %b", 
            $time, A, B, C, S, Cout
        );

endmodule

