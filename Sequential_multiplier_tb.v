`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 06:41:49 AM
// Design Name: 
// Module Name: Sequential_multiplier_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sequential_multiplier_tb;
    reg clk;
    reg reset;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] product;

    Sequential_multiplier uut (.clk(clk), .reset(reset), .a(a), .b(b), .product(product));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; a = 0; b = 0;
        #1000 reset = 0; a = 4'b0011; b = 4'b0101; 
        #1000 reset = 0; a = 4'b0110; b = 4'b0011;
        
        #100 $stop;
    end

endmodule
