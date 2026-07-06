`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/27 15:41:00
// Design Name: 
// Module Name: acc_tb
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

module acc_tb;
reg [7:0]DATA_in;
reg IA;
reg CLK;
reg EA;
wire [7:0] DATA_out;

acc acc(
       .DATA_in(DATA_in),
       .IA(IA),
       .CLK(CLK),
       .EA(EA),
       .DATA_out(DATA_out)
);

initial begin
IA<=1'b1;
DATA_in <= 8'b11111111;
CLK<=1'b0;
EA<=1'b0;
#17 IA <= 1'b0;
#200 DATA_in <= 8'b00000000;
#200 DATA_in <= 8'b00000001;
#200 DATA_in <= 8'b00000010;
#200 DATA_in <= 8'b00000011;
#50 EA <= 1'b1;
#200 DATA_in <= 8'b00000100;
#200 DATA_in <= 8'b00000101;
#200 DATA_in <= 8'b00000110;
#200 DATA_in <= 8'b00000111;
#50 EA <= 1'b1;
#200 DATA_in <= 8'b00001000;
#200 DATA_in <= 8'b00001001;
#200 DATA_in <= 8'b00001010;
#200 DATA_in <= 8'b00001011;
#5000 $stop;
end

always #100 CLK<=~CLK;

endmodule
