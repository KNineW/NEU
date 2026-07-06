`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/26 14:36:52
// Design Name: 
// Module Name: MAR_tb
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

module LS4_D_tb;

reg [3:0]ADD_in;
reg CLK;
reg IMAR;
wire [3:0] ADD_out;

LS4_D LS4_D(
       .ADD_in(ADD_in), 
       .Clk(CLK), 
       .IMAR(IMAR),
       .ADD_out(ADD_out));


initial begin
CLK <= 1'b0;
IMAR <= 1'b0;

#200 ADD_in <= 4'b0000;
#200 ADD_in <= 4'b0001;
#200 ADD_in <= 4'b0010;
#200 ADD_in <= 4'b0011;
#200 ADD_in <= 4'b0100;
#200 ADD_in <= 4'b0101;
#200 ADD_in <= 4'b0110;
#5000 $stop;    
end

always #100 CLK <= ~ CLK;

endmodule 
