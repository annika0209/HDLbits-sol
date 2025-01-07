// Exams/ece241 2013 q12

 //***3-input look-up-table (LUT))***

module top_module(
    input   clk,
    // input load,
    input   enable, //The enable input controls whether to shift. 
    input   S,
    // input   areset,
    // output reg [7:0] Q,

    input    A,
    input    B,
    input    C, //3bits address
    output   Z  //Data of RAM
    );

    reg     [7:0] Q;
    wire    [2:0] address;
    assign  address = {A,B,C};      //Simply assigned
    assign  Z       = Q[address];   // *** Using the MUX ??? 
    
 always @(posedge clk) begin
            if (enable) begin
                Q   <=    {Q[6:0],S}; // *** Solved Mistake ***
            end
    end

    // always @(posedge clk) begin
    //     if (load) begin
            
    //         q <= data;
    //     end
    //     else begin
    //     end
    // end

endmodule

