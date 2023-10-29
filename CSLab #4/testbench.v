`include "src/Wallace.v"

module tb;
    reg [3:0] A, B;
    wire [7:0] Product;

    WT_Multiplier4x4 MT(
        .Product(Product),
        .A(A),
        .B(B)
    );

    initial begin
        $monitor(
            "[%03g] %02d x %02d = %08b = %03d",
            $time, A, B, Product, Product
        );

            A = 4'd1; B = 4'd15;
        #1  A = 4'd2; B = 4'd15;
        #1  A = 4'd3; B = 4'd15;
        #1  A = 4'd4; B = 4'd15;
        #1  A = 4'd5; B = 4'd15;
        #1  A = 4'd6; B = 4'd15;
        #1  A = 4'd7; B = 4'd15;
        #1  A = 4'd8; B = 4'd15;
        #1  A = 4'd9; B = 4'd15;
        #1  A = 4'd10; B = 4'd15;
        #1  A = 4'd11; B = 4'd15;
        #1  A = 4'd12; B = 4'd15;
        #1  A = 4'd13; B = 4'd15;
        #1  A = 4'd14; B = 4'd15;
        #1  A = 4'd15; B = 4'd15;
        #1  A = 4'd1; B = 4'd8;
        #1  A = 4'd2; B = 4'd8;
        #1  A = 4'd3; B = 4'd8;
        #1  A = 4'd4; B = 4'd8;
        #1  A = 4'd5; B = 4'd8;
        #1  A = 4'd6; B = 4'd8;
        #1  A = 4'd7; B = 4'd8;
        #1  A = 4'd8; B = 4'd8;
        #1  A = 4'd9; B = 4'd8;
        #1  A = 4'd10; B = 4'd8;
        #1  A = 4'd11; B = 4'd8;
        #1  A = 4'd12; B = 4'd8;
        #1  A = 4'd13; B = 4'd8;
        #1  A = 4'd14; B = 4'd8;
        #1  A = 4'd15; B = 4'd8;
    end
endmodule