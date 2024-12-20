
/*
Write the Verilog code for this sequential circuit 
(Submodules are ok, but the top-level must be named top_module).
Assume that you are going to implement the circuit on the DE1-SoC board. Connect the R inputs to the SW switches, connect Clock to KEY[0], and L to KEY[1]. 
Connect the Q outputs to the red lights LEDR.
*/
module top_module (
	input [2:0] SW,      // R -> 3 switches
	input [1:0] KEY,     // L and clk -> KEY[1] and KEY[0]
	output [2:0] LEDR);  // Q -> a LED
//There is no reset...

wire    [2:0]  d;
always @(posedge KEY[0]) begin
    
    LEDR <= d;
end

wire    tab =   LEDR[1]^LEDR[2];
always @(*) begin
    case (KEY[1])
        0       :   d = {tab, LEDR[0], LEDR[2]}; 
        1       :   d = SW;
        default :   d = SW;  
    endcase
end


endmodule

