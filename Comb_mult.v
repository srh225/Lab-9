`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 08:10:53 AM
// Design Name: 
// Module Name: Comb_mult
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


module Comb_mult(
    input [3:0] a, b,
    output [7:0] p 
);
    wire [3:0] m0;
    wire [4:0] m1;      
    wire [5:0] m2;
    wire [6:0] m3;
    wire [7:0] s1, s2, s3;

    
    assign m0 = a & {4{b[0]}};        
    assign m1 = (a & {4{b[1]}}) << 1; 
    assign m2 = (a & {4{b[2]}}) << 2; 
    assign m3 = (a & {4{b[3]}}) << 3; 

    
    assign s1 = {3'b000, m0} + m1;   
    assign s2 = s1 + m2;             
    assign s3 = s2 + m3;             

    
    assign p = s3;
endmodule