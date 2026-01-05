`timescale 1ns / 1ps

module cpu16(
    input [15:0] inM,
    input [15:0] instruction,
    input reset,
    input clk,
    output [15:0] outM,
    output writeM,
    output [14:0] addressM,
    output [14:0] pc
    );
    
    //wire instantiations
    wire [15:0] aluoutput, out1, outA, out2, outD;
    wire isZero, isNeg;
    
    //check if a-instruction or c-instruction
    wire a_instruction, c_instruction, loadA, loadD;
    assign a_instruction = !instruction[15];
    assign c_instruction = instruction[15];
    
    mux_2to1 mux1 (.a(instruction), .b(aluoutput), .sel(instruction[15]), .out(out1)); //First MUX - chooses between the instruction and aluoutput using the type of instruction (op-code) as a select line
    
    //A Register - used during an A-instruction only or when it is a C-instruction and destination bit 1 is 1
    assign loadA = a_instruction || c_instruction && instruction[5];

    register a_reg (.in(out1), .clk(clk), .rst(reset), .load(loadA), .out(outA));
    
    //D Register - used during a C-instruction only and when dest bit 2 is 1. 
    assign loadD = c_instruction && instruction[4];
    
    register d_reg (.in(aluoutput), .clk(clk), .rst(reset), .load(loadD), .out(outD));
    
    //Second MUX
    mux_2to1 mux2 (.a(outA), .b(inM), .sel(instruction[12]), .out(out2));
    
    //alu
    alu alu1 (.x(outD), .y(out2), .zx(instruction[11]), .nx(instruction[10]), .zy(instruction[9]), .ny(instruction[8]), .f(instruction[7]), .no(instruction[6]), .out(aluoutput), .zr(isZero), .ng(isNeg));
    
    //outputs
    assign writeM = c_instruction && instruction[3];
    assign outM = aluoutput;
    assign addressM = outA[14:0];

    //Control Part
    //jump conditions depend on comparison of ALU output and jump bits
    // j1 = instruction[2] (Jump if < 0)
    // j2 = instruction[1] (Jump if == 0)
    // j3 = instruction[0] (Jump if > 0)
    
    //First, we find > 0 (pos)
    assign isPos = !isNeg && !isZero;
    
    //Now we check the other conditions and use assembly keywords for better understanding
    assign JLT = isNeg && instruction[2]; // < 0 -> j1
    assign JGT = isPos && instruction[0]; // > 0 -> j3
    assign JEQ = isZero && instruction[1]; // ==0 -> j2
    assign JLE = JLT || JEQ; // <= 0
    assign condition_met = JLE || JGT; //something is always 1. - conditions is not met when all jump bits are zero. 
    
    //PC and its load
    assign loadPC = c_instruction && condition_met;
    
    program_counter program_c (.in(outA), .reset(reset), .load(loadPC), .inc(1'b1), .clk(clk), .out(pc_full));
    
    assign pc = pc_full[14:0];
    
endmodule
