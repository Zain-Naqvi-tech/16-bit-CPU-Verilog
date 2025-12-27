`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2025 08:07:59 PM
// Design Name: 
// Module Name: mux_2to1
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


module mux_2to1(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] out
    );
    assign out = (sel == 0) ? a : b; //Selects 'a' if sel is 0 and 'b' otherwise.
endmodule
