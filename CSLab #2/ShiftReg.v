`ifndef _SHIFT_REGISTER
`define _SHIFT_REGISTER

module Shift_Reg8 (
    output reg [7:0] q,
    input clk, areset, 
    input [7:0] data
);
    always @ (posedge clk, posedge areset) begin
        if (areset) q <= data;
        else q <= {1'b0, q[7:1]};
    end
endmodule

`endif