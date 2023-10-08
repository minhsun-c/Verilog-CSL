`ifndef _FINITE_STATE_MACHINE 
`define _FINITE_STATE_MACHINE

/*
    init state: 1, 0
    product shift
    product write 
    input from multiplier
    multiplier shift
    clock

    reset, 
*/
module FSM (
    output pd_shift,
    output pd_write,
    output mpr_shift,
    output alu_state,
    input clk,
    input areset,
    input init_state,
    input mpr_input
);
    reg state;
    always @(posedge clk, areset) begin
        if (areset) state = init_state;
        else begin
            
        end
    end
    
endmodule

`endif 