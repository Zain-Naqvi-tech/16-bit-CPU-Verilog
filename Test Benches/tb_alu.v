`timescale 1ns / 1ps

module tb_alu();

    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;
    
    alu dut (.x(x), .y(y), .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no), .out(out), .zr(zr), .ng(ng));
    
    initial begin
        
        x = 16'h000A; //decimal 10 - binary 0000 0000 0000 1010
        y = 16'h0005; //decimal 5- binary 0000 0000 0000 0101
        
        zx = 0;
        nx = 0;
        zy = 0;
        ny = 0;
        f = 0;
        no = 0;
        
        #10;
        
        //Testing addition
        f = 1;
        #10; //Output should show 15 for these 10 nanoseconds - binary 0000 0000 0000 1111
        
        //Testing Bitwise AND
        f = 0;
        #10; // Should show 0000 0000 0000 0000 (0 decimal) 
        
        //Testing zx and zy (zeroing x and y inputs)
        zx = 1;
        f = 1;
        #10; //output would be 0 + 5 = 5
        
        zx = 0;
        zy = 1;
        f = 1;
        #10; //output would be 10 + 0 = 10
        
        //Testing the Negating of our result
        zx = 1; nx = 1; //zeros x then negates it (all 1's)
        zy = 0; ny = 0; //y stays as it is (5)
        f = 0; //ANDs x and y (5)
        
        no = 1;
        #10; //Shows NOT(5) = -6 (using the binary numbers)
        
        $finish;
    end

endmodule
