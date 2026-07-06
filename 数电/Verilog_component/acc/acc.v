`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/27 15:38:13
// Design Name: 
// Module Name: acc
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
//累加器的Verilog代码：
module acc(
input wire [7:0]DATA_in,
input wire IA,    //输入控制信号
input wire EA,    //输出控制信号
input wire CLK,
output wire [7:0]DATA_out
);

reg [7:0]REGQ;
always @(posedge CLK)begin
   if(IA==1'b0)begin
       REGQ<=DATA_in;
   end
   
end

assign DATA_out = EA ? REGQ : (8'bzzzz_zzzz);

endmodule

