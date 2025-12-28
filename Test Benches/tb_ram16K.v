`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2025 05:06:01 PM
// Design Name: 
// Module Name: tb_ram16K
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


module tb_ram16K();

    reg [15:0] in;
    reg load;
    reg clk;
    reg [13:0] address;
    wire [15:0] out;
    
    ram16K dut (.in(in), .load(load), .clk(clk), .address(address), .out(out));
    
    initial begin
        clk = 1'b0;
    end
    always #5 clk = ~clk;
    
    initial begin
    
        load = 1'b0;
        in = 16'hAAAA; //1010 1010 1010 1010
        address = 14'b00000000101000;
        #20; //We will expect the output to be all zero or red until the clock edge after the load becomes one. 
        
        load = 1'b1; //writing to the memory. 
        in = 16'hABCD;
        address = 14'b00000000101000;
        #20; //We will see h'ABCD
        
        load = 1'b0;
        address = 14'b0010000010100; //reading from a different space of memory. 
        #20; //will expect to see zero or red. 
        
        address = 14'b00000000101000; 
        #20; //will still show h'ABCD as we never wrote to it again. 
        
        $finish;
    
    end
    

endmodule
