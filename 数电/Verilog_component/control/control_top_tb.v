`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/17 19:58:58
// Design Name: 
// Module Name: control_top_tb
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

module control_top_tb;

reg clk,start;
reg LD;
reg ADD;
reg SUB;
reg AND;
reg OR;
reg HALT;
wire IMAR;
wire IDR;
wire IPC;
wire IIR;
wire ISUB;
wire IADD;
wire IAND;
wire IOR;
wire IA;
wire EALU;
wire EA;
wire EDR;
wire [7:0]T;

control_top control_top(
        .CLK(clk),
        .start(start),
        .LD(LD),
        .ADD(ADD),
        .SUB(SUB),
        .AND(AND),
        .OR(OR),
        .HALT(HALT),
        .IMAR(IMAR),
        .IDR(IDR),
        .IPC(IPC),
        .IIR(IIR),
        .ISUB(ISUB),
        .IADD(IADD),
        .IAND(IAND),
        .IOR(IOR),
        .IA(IA),
        .EALU(EALU),
        .EA(EA),
        .EDR(EDR),
        .T(T)
);


initial begin
        clk<=0;start<=0;
    #17 start<=1;
    #200 LD <= 1'b1; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b0;
    #200 LD <= 1'b0; ADD <= 1'b1; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b0;
    #200 LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b1; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b0;
    #200 LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b1; OR <= 1'b0;HALT <= 1'b0;
    #50 LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b1;HALT <= 1'b0;
    #50 LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b1;
    #5000 $stop;
end

always #5 clk <= ~clk;

endmodule
 
