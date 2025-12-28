`timescale 1ns / 1ps

module tb_programcounter();

    reg reset, inc, load, clk;
    reg [15:0] in;
    wire [15:0] out;
    
    program_counter dut (.in(in), .reset(reset), .load(load), .inc(inc), .clk(clk), .out(out));
    
    initial begin 
        clk = 0;
    end
    always #5 clk = ~clk;
    
    initial begin
    
        reset = 1;
        load = 0;
        inc = 0;
        in = 16'b0;
        #10 reset = 0;
        
        //Testing the increment feature 
        inc = 1;
        #30; //we expect the initial number to start incrementing - 1,2,3,4 in decimal values 
        
        //Testing Load
        in = 16'hABCD;
        load = 1; //load is 1 so it does not go down to inc 
        #10; //out is set to in - output will be hABCD
        
        load = 0; //will now stay at ABCD
        inc = 0; //will stay at ABCD as none of the if statements are true
        #10;
        
        reset = 1;
        #10; //for this time, we will observe the PC being 0. 
        
        $finish;
        
    end
    

endmodule
