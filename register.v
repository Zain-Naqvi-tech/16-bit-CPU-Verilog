`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2025 01:55:30 AM
// Design Name: 
// Module Name: register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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

