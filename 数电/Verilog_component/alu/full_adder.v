`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/21 19:48:02
// Design Name: 
// Module Name: full_adder
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


module full_adder(Ai,Bi,Ci,Si,Ciout);
input Ai;
input Bi;
input Ci;
output Si;
output Ciout;
assign Si=Ci^Ai^Bi;
assign Ciout=Ai&Bi|(Ai^Bi)&Ci;
endmodule

