`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 06:41:16 AM
// Design Name: 
// Module Name: Sequential_multiplier
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


module Sequential_multiplier(
    input clk,
    input reset,
    input [3:0] a,
    input [3:0] b,
    output reg [7:0] product
);

    reg [3:0] multiplier;
    reg [7:0] multiplicand;
    reg [7:0] partial_product;
    reg [3:0] count;

    parameter S0_idle = 0 , S1_multiply = 1 , S2_update_result = 2, S3_done= 3 ;
    reg [1:0] CS,NS;
  
    always @(posedge clk)
    begin
        if(reset == 1)
        begin 
            CS <= S0_idle;
        end
        else
        begin
            CS <= NS; 
        end
    end 
    
    always @(posedge clk)
    begin
        case(CS)
            S0_idle: begin
                multiplier <= b;
                multiplicand <= {4'b0, a};
                partial_product <= 0;
                count <= 4;
                NS <= S1_multiply;
                end
            S1_multiply: begin
                NS <= S2_update_result;
                if (multiplier[0])
                begin
                    partial_product <= partial_product + multiplicand;
                end
                multiplicand <= multiplicand << 1;
                multiplier <= multiplier >> 1;
                end
            S2_update_result: begin
                count <= count - 1;
                if(count == 0)
                begin
                    NS <= S3_done;
                end
                else
                begin
                    NS <= S1_multiply;
                end
                end
            S3_done: begin
                product <= partial_product;
                NS <= S0_idle;
                end
            endcase
        end

endmodule
