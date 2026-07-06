`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/26 15:25:50
// Design Name: 
// Module Name: dr_tb
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

module data_reg_tb;

reg [7:0]DATA_in;
reg IDR;
reg CLK;
reg EDP;
wire [7:0] DATA_out;

data_reg data_reg(
       .DATA_in(DATA_in),
       .IDR(IDR),
       .CLK(CLK),
       .EDP(EDP),
       .DATA_out(DATA_out)
);

initial begin
IDR<=1'b0;
DATA_in <= 8'b11111111;
CLK<=1'b0;
EDP<=1'b0;
#17 IDR <= 1'b1;
#200 DATA_in <= 8'b00000000;
#200 DATA_in <= 8'b00000001;
#200 DATA_in <= 8'b00000010;
#200 DATA_in <= 8'b00000011;
#50 EDP <= 1'b1;
#200 DATA_in <= 8'b00000100;
#200 DATA_in <= 8'b00000101;
#200 DATA_in <= 8'b00000110;
#200 DATA_in <= 8'b00000111;
#50 EDP <= 1'b0;
#200 DATA_in <= 8'b00001000;
#200 DATA_in <= 8'b00001001;
#200 DATA_in <= 8'b00001010;
#200 DATA_in <= 8'b00001011;
#5000 $stop;
end

always #100 CLK<=~CLK;

endmodule

