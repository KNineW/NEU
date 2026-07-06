`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/21 19:42:16
// Design Name: 
// Module Name: Orr
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


module Orr(
input  wire  [7:0] B, 
input  wire  [7:0] A,
output wire  [7:0] S
 );
 assign S[0]=B[0]|A[0];
 assign S[1]=B[1]|A[1];
 assign S[2]=B[2]|A[2];
 assign S[3]=B[3]|A[3];
 assign S[4]=B[4]|A[4];
 assign S[5]=B[5]|A[5];
 assign S[6]=B[6]|A[6];
 assign S[7]=B[7]|A[7];
endmodule