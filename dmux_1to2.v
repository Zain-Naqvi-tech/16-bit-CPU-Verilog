`timescale 1ns / 1ps

module dmux_1to2(
    input in,
    input sel,
    output a,
    output b
    );
    assign a = (sel == 0) ? in : 1'b0;
    assign b = (sel == 1) ? in : 1'b0;
endmodule
