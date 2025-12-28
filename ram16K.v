`timescale 1ns / 1ps

module ram16K(
    input [15:0] in,
    input load,
    input clk,
    input [13:0] address,
    output [15:0] out
    );
    
    //Array of 16384 16-bit registers - we need enough space for 2^14 rows. A register per element. 
    reg [15:0] memory [0:16383];
    
    //Value of the selected register shown as output
    assign out = memory[address];
    
    always @(posedge clk) begin
        
        if (load) begin
            memory[address] <= in;
        end
        
    end
    
endmodule
