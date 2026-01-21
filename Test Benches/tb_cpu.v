`timescale 1ns / 1ps

module tb_cpu16();

    reg [15:0] inM; 
    reg [15:0] instruction;
    reg reset;
    reg clk;
    wire [15:0] outM;
    wire writeM;
    wire [14:0] addressM;
    wire [14:0] pc;
    
    //call the cpu16 module and pass our regs and wires. 
    cpu16 dut (.inM(inM), .instruction(instruction), .reset(reset), .clk(clk), .outM(outM), .writeM(writeM), .addressM(addressM), .pc(pc));
    
    //clock
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
    
        //check if reset works
        reset = 1;
        instruction = 16'h0; inM = 16'h0; 
        #10 reset = 0; //we expect the pc and registers to be zero.
        
        // A-instruction - decimal 100 - 0000000001100100
        instruction = 16'h0064;
        #10; //We expect A register to hold 100 (decimal) or 0000000001100100 (binary)
        
        // Setting the D register using a C-instruction - D = A -> 111 0 110000 010 000
        instruction = 16'hE308;
        #10; //We expect the D register to be set to the same value as A's - 100 (decimal)
        
        //D = D + M
        inM = 16'd50; 
        instruction = 16'hF088; //111 1 000010 010 000 (f in the alu and c=1 for the second mux) - this means that the inM is chosen by the second MUX to go into the ALU. 
        #10; //We expect the D-Register to be 150 (100 + 50) - this is due to the ALU adding x and y - A register and D register's previous value - the 010 makes it so the D reg is loaded again with the output of the ALU therefore fulfilling D=D+M
        
        //Testing the jumping part
        // if D == 150 - jump to 0 (reset)
        // 111 0 001100 000 010 - 010 means JEQ (A reg is selected and addressed - still holds 100)
        instruction = 16'hE302;
        #10; 
        
        #20 $finish;
    
    end
    
    

endmodule
