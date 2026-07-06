`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/26 15:24:52
// Design Name: 
// Module Name: dr
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


module data_reg(
input wire [7:0] DATA_in,
input wire IDR,
input wire CLK,
input wire EDP,
output wire [7:0] DATA_out
);

reg [7:0]REGQ;
always @(posedge CLK)begin
   if(IDR==1'b1)begin
       REGQ<=DATA_in;
   end 
end

assign DATA_out = EDP?(8'bzzzz_zzzz):REGQ;

endmodule
