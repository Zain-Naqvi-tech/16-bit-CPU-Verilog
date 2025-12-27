`timescale 1ns / 1ps

module mux_2to1(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] out
    );
    assign out = (sel == 0) ? a : b; //Selects 'a' if sel is 0 and 'b' otherwise.
endmodule
