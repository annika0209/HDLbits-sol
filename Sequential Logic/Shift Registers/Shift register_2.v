module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output reg [3:0] LEDR
); 
    //There are 3 modes for this n-bit shift register.
    //10. Right shift register mode
    //00. unchanging mode
    //x1. A mode of loading the input [n-1:0] R 

    wire    w, E, L;    //control signal 
    reg    clk;

    assign  {w, L, E, clk} = KEY;

    always @(posedge clk) begin
        
        casex ({E,L})
            2'b00   :   LEDR <= LEDR;
            2'b10   :   LEDR <= {w,LEDR[3:1]};
            2'bx1   :   LEDR <= SW;
        endcase
    end

endmodule