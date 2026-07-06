`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/25 09:40:30
// Design Name: 
// Module Name: ls161_tb
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



module LS161_tb();
reg  CLK,CLRn,LDn, ENP, ENT;
reg  [3:0] D;
wire [3:0] Q;
wire RCO;

LS161 DUT(
.CLK  (CLK),
.CLRn (CLRn),
.LDn  (LDn),
.ENP  (ENP),	
.ENT  (ENT),
.D    (D),
.Q    (Q),
.RCO  (RCO));

initial begin 
CLK  = 1'b0;
D    = 4'b0000;
LDn  = 1'b1;
CLRn = 1'b1;
ENP  = 1'b0;
ENT  = 1'b0;
end
always #10 CLK = ~ CLK;
initial begin
#10 CLRn = 1'b0;
#15 CLRn = 1'b1;
end
initial begin
#16 D = 4'b1000;
#56 D = 4'b0000;
end  
initial begin
#35 LDn = 1'b0;
#30 LDn = 1'b1;
end 
initial begin
#70  ENP = 1'b1;
#260 ENP = 1'b0;
#60  ENP = 1'b1;
end 
initial begin
#70  ENT = 1'b1;
#425 ENT = 1'b0;
#5   ENT = 1'b1;
#60  $stop;
end 
endmodule 
