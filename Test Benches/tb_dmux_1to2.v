`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2025 08:53:45 PM
// Design Name: 
// Module Name: tb_dmux_1to2
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


module tb_dmux_1to2();

    reg t_in;
    reg t_sel;
    wire t_a;
    wire t_b;      
    
    dmux_1to2 dut (.in(t_in), .sel(t_sel), .a(t_a), .b(t_b));
    
    initial begin
        t_in = 1'b1;
        t_sel = 1'b0; 
        
        #10;
        t_sel = 1'b1;
        
        #10;
        $finish;
    end
endmodule
