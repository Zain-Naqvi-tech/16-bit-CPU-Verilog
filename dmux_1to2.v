`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2025 08:50:17 PM
// Design Name: 
// Module Name: dmux_1to2
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


module dmux_1to2(
    input in,
    input sel,
    output a,
    output b
    );
    assign a = (sel == 0) ? in : 1'b0;
    assign b = (sel == 1) ? in : 1'b0;
endmodule
