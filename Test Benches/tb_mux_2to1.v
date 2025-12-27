`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2025 08:15:20 PM
// Design Name: 
// Module Name: tb_mux_2to1
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


module tb_mux_2to1();

    reg [15:0] t_a, t_b;
    reg t_sel;
    wire [15:0] t_out;
    
    mux_2to1 dut (.a(t_a), .b(t_b), .sel(t_sel), .out(t_out));
    
    initial begin
        t_a = 16'b1111_0000_1111_0000;
        t_b = 16'b0000_1111_0000_1111;
        t_sel = 1'b0;
        
        #10;
        t_sel = 1'b1;
        
        #10;
        $finish;
    end
endmodule
