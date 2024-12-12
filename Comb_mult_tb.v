`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 08:11:24 AM
// Design Name: 
// Module Name: Comb_mult_tb
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


module Comb_mult_tb;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] p;

    Comb_mult uut (.a(a), .b(b), .p(p));

    initial begin
        #10 a = 4'b0011; b = 4'b0101; 
        #10 a = 4'b0110; b = 4'b0011;
        
        #100 $stop;
    end

endmodule
