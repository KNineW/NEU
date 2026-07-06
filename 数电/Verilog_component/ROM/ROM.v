`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/26 15:12:47
// Design Name: 
// Module Name: ROM
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
`timescale 1ns / 1ps
module rom4_8(
input wire CE,
input wire [3:0] addr,
output reg [7:0] data );
//ROM功能定义
always @ ( CE or addr ) begin
   if ( !CE ) 
       data <= 8'bzzzz_zzzz;
   else
   case ( addr )
       4'b0000: data <= 8'b00111110;             //LD操作码 
       4'b0001: data <= 8'b00000110;             //操作 数6         LD A，6 
       4'b0010: data <= 8'b11000110;             //add操作码
       4'b0011: data <= 8'b00000111;             //操作数7      ADD A，7 
       4'b0100: data <= 8'b10000110;             //sub操作码
       4'b0101: data <= 8'b00000101;             //操作数5         sub A,5;
       4'b0110: data <= 8'b00100110;             //and操作码       
       4'b0111: data <= 8'b00000000;             //操作数 0      and A,0;
       4'b1000: data <= 8'b01111100;             //or操作码       
       4'b1001: data <= 8'b00000100;            //操作数4        or A,4;
       4'b1010: data <= 8'b01110110;             //HALT的操作码
       default: 
       data <= 8'bzzzz_zzzz;
endcase
end
endmodule
