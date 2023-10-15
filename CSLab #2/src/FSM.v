`ifndef _FINITE_STATE_MACHINE 
`define _FINITE_STATE_MACHINE

module MUL_FSM (
    output reg [1:0] state,
    input clk, areset, 
    input [7:0] multiplier
);
    parameter INIT = 0;
    parameter EXEC = 1;
    parameter IDLE = 2;
    parameter HALT = 3;

    reg [3:0] counter;

    always @(posedge clk, areset) begin
        $monitor("[%2g] arst: %b, counter: %d, next_state: %d", $time, areset, counter, state);
        if (areset) begin
            state = INIT;
            counter = 0;
        end
        else if (counter >= 8) begin
            state = HALT;
        end
        else if (multiplier[0]) begin
            state = EXEC;
            counter = counter + 1;
        end
        else if (~multiplier[0])  begin
            state = IDLE;
            counter = counter + 1;
        end
        else begin // multiplier[0] == x
            state = INIT;
            counter = 0;
            $display("[%2g] multiplier[0] == x", $time);
        end
    end
endmodule
`endif 