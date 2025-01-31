/*
The PS/2 mouse protocol sends messages that are three bytes long. 
However, within a continuous byte stream, it's not obvious where messages start and end. 
The only indication is that the first byte of each three byte message always has bit[3]=1
 (but bit[3] of the other two bytes may be 1 or 0 depending on data).

We want a finite state machine that will search for message boundaries when given an input byte stream.
The algorithm we'll use is to discard bytes until we see one with bit[3]=1. 
We then assume that this is byte 1 of a message, and signal the receipt of a message once all 3 bytes have been received (done).

The FSM should signal done in the cycle immediately after the third byte of each message was successfully received.

*/

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done
    ); //
    parameter READY      = 2'b00;
    parameter M_START    = 2'b01;
    parameter M_SECOND   = 2'b11;
    parameter M_RECIEVED = 2'b10;

    reg     [3:0]   state;
    reg     [3:0]   next_state;

    // State transition logic (combinational)
    always @(*) begin
        casex (state)
            READY       :    next_state = in[3] ?   M_START     :   READY       ; 
            M_START     :    next_state = M_SECOND                              ; 
            M_SECOND    :    next_state = M_RECIEVED                            ; 
            M_RECIEVED  :    next_state = in[3] ?   M_START     :   READY       ; 
            default     :    next_state = READY;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk ) begin
        if (reset) begin
            state <= READY;
        end else begin
            state <= next_state;
        end 
    end

    // Output logic
    assign  done = (state == M_RECIEVED);

endmodule
