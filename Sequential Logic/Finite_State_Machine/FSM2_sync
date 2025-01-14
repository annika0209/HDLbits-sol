module top_module (
    input   clk,
    input   areset,	//Asynchronous reset to state B
	input	in,
    output	out
);
	// DFF	uDFF(.clk(clk),	.rst(areset), .D(), .Q(out));
	localparam A = 0;
	localparam B = 1;
	reg 	state;
	reg 	next_state;

    always @(*) begin    // This is a combinational always block
        casex (state)
			A 		:	next_state = in ? A	: B;	
			B 		: 	next_state = in ? B	: A;
			default	: 	next_state = B;
		endcase	// State transition logic
    end

    always @(posedge clk or posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
		if (areset) begin
			state <= B;
		end else begin
			state <= next_state;
		end
	end

    // Output logic
    assign out = (state == B);

endmodule



// module DFF #(BITWIDTH = 1)	(
// 	input					clk,
// 	input	[BITWIDTH-1:0]	D,
// 	input					rst,
// 	output	[BITWIDTH-1:0]	Q
// );
// 	always @(posedge clk) begin
// 		if (rst) begin
// 			Q <= (BITWIDTH)'b0;
// 		end else begin
// 			Q <= D
// 		end
// 	end
// endmodule