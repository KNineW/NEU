`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/27 16:56:41
// Design Name: 
// Module Name: IR_tb
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

module IR_tb;

reg [7:0]DATA_in;
reg IIR;
reg CLK;
wire LD;
wire ADD;
wire SUB;
wire AND;
wire OR;
wire HALT;

IR IR(.DATA_in(DATA_in),
       .IIR(IIR),
       .CLK(CLK),
       .LD(LD),
       .ADD(ADD),
       .SUB(SUB),
       .AND(AND),
       .OR(OR),
       .HALT(HALT)
);

initial begin
   
   CLK <= 1'b0;
   IIR <= 1'b1;
end

always #100 CLK <= ~CLK;

initial begin
   #100 IIR <= 1'b0;
   #150 DATA_in <= 8'b00111110;
   #150 DATA_in <= 8'b11000110;
   #150 DATA_in <= 8'b10000110;
   #150 DATA_in <= 8'b00100110;
   #150 DATA_in <= 8'b01111100;
   #150 DATA_in <= 8'b01110110;
   #500 $stop;
end

endmodule
