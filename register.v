`timescale 1ns / 1ps

module register(
    input [15:0] in,
    input clk,
    input rst,
    input load,
    output reg [15:0] out
    );
    
    //This acts as a register
    always @(posedge clk) begin
        if (rst) begin
            out <= 16'b0;
        end
        else if (load) begin
            out <= in; //non-blocking used in RTL - if load is 1, the output is the input - else it is the same as before (basically changing states)
        end
    end
endmodule

