
/*
Build a 32-bit Galois LFSR with taps at bit positions 32, 22, 2, and 1.
*/
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

wire    [31:0]  d;
always @(posedge clk) begin
    if (reset) begin
        q <= 32'b1;
    end
    else q <= d; //else 빼먹음...
end

wire    tab32 =   q[0]^1'b0;
wire    tab22 =   q[0]^q[22];
wire    tab2 =   q[0]^q[2];
wire    tab1 =   q[1]^q[0];

assign  d = { tab32, q[31:23],tab22 , q[21:3], tab2, tab1}; 


endmodule

