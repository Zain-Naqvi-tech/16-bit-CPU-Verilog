`timescale 1ns / 1ps

module program_counter(
    input [15:0] in,
    input reset,
    input load,
    input inc,
    input clk,
    output reg [15:0] out
    );
    
    always @(posedge clk) begin
    
        if (reset) begin
            out <= 16'b0;
        end
        else if (load) begin
            out <= in;
        end
        else if (inc) begin
            out <= out + 1'b1;
        end
        else begin
            out <= out;  
        end
    end
endmodule
