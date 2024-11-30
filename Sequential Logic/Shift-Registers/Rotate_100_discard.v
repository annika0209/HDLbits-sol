/*
Build a 100-bit left/right rotator, with synchronous load and left/right enable. 
A rotator shifts-in the shifted-out bit from the other end of the register, 
unlike a shifter that discards the shifted-out bit and shifts in a zero. 
If enabled, a rotator rotates the bits around and does not modify/discard them.

    load: Loads shift register with data[99:0] instead of rotating.
    ena[1:0]: Chooses whether and which direction to rotate.
        2'b01 rotates right by one bit
        2'b10 rotates left by one bit
        2'b00 and 2'b11 do not rotate.
    q: The contents of the rotator.
*/

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    input areset,
    output reg [99:0] q
    );
    
    reg [99:0] shift_q;
    reg first_shift_in;
    unit_reg u0(.shift_in(first_shift_in),  .data(data[99]), .clk(clk), .areset(areset), .load(load), .ena(1), .q(shift_q[99]));
    //
generate
    genvar i;
    for(i=1;i<100;i=i+1) begin :  generate_block_identifier
        unit_reg u1(.shift_in(shift_q[100-i]), .data(data[99-i]), .clk(clk), .areset(areset), .load(load), .ena(1), .q(shift_q[99-i]));

    end
endgenerate


reg [1:0] ena_sync;
always @(posedge clk) begin
    ena_sync <= ena;
end

// combinational logic of output 'q'
always @(*) begin
    case (ena_sync)
        2'b00   :     begin
            first_shift_in = 0  ;
            q[0:99] = shift_q[0:99];
        end 
        2'b11   :     begin
            first_shift_in = 0  ;
            q[0:99] = shift_q[0:99]; 
        end
        2'b01   :     begin
            first_shift_in = shift_q[0]; //right
            q[0:99] = shift_q[0:99];
        end
        2'b10   :     begin
            first_shift_in = shift_q[0]; //left
            q[0:99] = shift_q[99:0];
        end
        default :    begin
            first_shift_in = 0      ;
            q[0:99] = shift_q[0:99] ;
        end
    endcase

end

//



endmodule


module unit_reg(
    input shift_in, //type 주의
    input data,
    input clk,
    input areset,
    input load,
    input ena,
    output reg q
);

always @(posedge clk or posedge areset) begin
    if(areset) begin
         q <= 1'b0;
    end
    else begin  //case문  타이밍
        if(load) begin
            q <= data;
        end
        else begin
            q <= ena ? shift_in : q ;
        end
    end
    end

endmodule