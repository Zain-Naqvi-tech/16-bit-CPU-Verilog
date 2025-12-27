`timescale 1ns / 1ps

module tb_register();

    reg clk;
    reg rst;
    reg [15:0] in;
    reg load;
    
    wire [15:0] out;
    
    register dut (.clk(clk), .rst(rst), .in(in), .load(load), .out(out));
    
    initial begin 
        clk = 1'b0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        
        rst = 1'b1;
        load = 1'b0;
        in = 16'b0;
        
        #10 rst = 1'b0;
        
        in = 16'hAAAA; //our first input is 1010 1010 1010 1010
        load = 1'b0; 
        
        #15;
        
        in = 16'h1234; //
        #10; //output would still be the old value and not the new state (h1234)
        
        load = 1'b1; //now the new state would the new input of h1234 and not the initial state. 
        #10;
        
        load = 1'b0;
        in = 16'hFFFF; //input is now 1111 1111 1111 
        #10; //during this time, the value would remain h1234 because we never update the state (load is not 1).
        
        #20;
        
        $finish;
    end
        

endmodule
