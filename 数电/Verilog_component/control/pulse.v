//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/17 19:57:22
// Design Name: 
// Module Name: pulse
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
module pulse(
input wire CLK,
input wire start,
output wire [7:0] T
);
//功能定义
reg DF0,DF1,DF2,DF3,DF4,DF5,DF6,DF7;
assign T = {DF7,DF6,DF5,DF4,DF3,DF2,DF1,DF0};
always@(posedge CLK or negedge start)
begin
if (!start) begin
 DF0 <= 1; DF1 <= 0; DF2 <= 0; DF3 <= 0;
 DF4 <= 0; DF5 <= 0; DF6 <= 0; DF7 <= 0;
 end
 else begin
 DF0 <= DF7; DF1 <= DF0; DF2 <= DF1; DF3 <= DF2;
 DF4 <= DF3; DF5 <= DF4; DF6 <= DF5; DF7 <= DF6;
 end
end
endmodule
