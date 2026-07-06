`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/17 20:17:05
// Design Name: 
// Module Name: alu_tb
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


//算术逻辑单元ALU的Verilog仿真代码：
//--------->ALU_tb.v
module ALU_tb;

reg [7:0]AC;
reg [7:0]DR;
reg ISUM;
reg EALU;
reg ISUB;
reg IAND;
reg IOR;
wire [7:0]ALU_out;

ALU ALU(
       .AC(AC),
       .DR(DR),
       .ISUM(ISUM),
       .EALU(EALU),
       .ISUB(ISUB),
       .IAND(IAND),
       .IOR(IOR),
       .ALU_out(ALU_out)
);

initial begin
   
AC<=8'b00000111;
DR<=8'b00000011;
ISUB<=1'b1;
ISUM<=1'b1;
IAND<=1'b1;
IOR<=1'b1;
EALU<=1'b1;

#100  EALU<=1'b0;
     ISUM <=1'b0;  


#200 ISUM <= 1'b1;
    ISUB <= 1'b0;

#200 ISUB <= 1'b1;
    IAND <= 1'b0;

#100 EALU <= 1'b1;

#100 EALU <= 1'b0;

#200 IAND <= 1'b1;
    IOR <= 1'b0;
#200 $stop;
end

endmodule
