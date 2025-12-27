`timescale 1ns / 1ps

module alu(
    input [15:0] x,
    input [15:0] y,
    input zx,
    input nx,
    input zy,
    input ny,
    input f,
    input no,
    output [15:0] out,
    output zr,
    output ng
    );
    
    reg [15:0] x1, y1, result;
    reg zr_1, ng_1;
    
    always @(*) begin
    
        if (zx) x1 = 16'b0; //16-bit constant (x)
        else x1 = x;
        
        if (zy) y1 = 16'b0; //16-bit constant (y)
        else y1 = y;
        
        //bitwise not for the x,y inputs
        if (nx) x1 = ~x1; 
        if (ny) y1 = ~y1;
        
        if (f) result = x1 + y1; //bitwise addition
        else result = x1 & y1; //bitwise AND
        
        if (no) result = ~result;
        
        if (result == 0) zr_1 = 1'b1;
        else zr_1 = 1'b0;
        
        if (result[15]) ng_1 = 1'b1; //for negatives, we need to check if the MSB is 1. So, we look into the leftmost bit (result[15]) and see if it is one or zero.
        else ng_1 = 1'b0;
        
    end
    
    assign out = result;
    
    assign zr = zr_1;
    
    assign ng = ng_1;
        


    
endmodule
