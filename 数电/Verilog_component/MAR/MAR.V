`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/26 14:35:59
// Design Name: 
// Module Name: MAR
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


`timescale 1ns / 10ps
module LS4_D(
input [3:0]ADD_in, 
input Clk, 
input IMAR,    
output reg [3:0]ADD_out);
always @(posedge Clk or negedge IMAR) begin
   if (IMAR == 1'b0) 
       ADD_out <= ADD_in;
end
   
endmodule

