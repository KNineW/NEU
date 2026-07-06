//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/17 19:55:56
// Design Name: 
// Module Name: control_top
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


//顶成例化的Verilog代码：
//控制器与节拍器的例化
`timescale 1ns / 10ps
module control_top(
    input wire CLK,
    input wire start,
    input wire LD,
    input wire ADD,
    input wire SUB,
    input wire AND,
    input wire OR,
    input wire HALT,
    output wire IMAR,
    output wire IDR,
    output wire IPC,
    output wire IIR,
    output wire ISUB,
    output wire IADD,
    output wire IAND,
    output wire IOR,
    output wire IA,
    output wire EALU,
    output wire EA,
    output wire EDR,
    output wire [7:0] T
);


pulse p(
        .CLK(CLK),
        .start(start),
        .T(T)
);

control c(
        .LD(LD),
        .ADD(ADD),
        .SUB(SUB),
        .AND(AND),
        .OR(OR),
        .HALT(HALT),
        .T(T),
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
        .EDR(EDR)
);
endmodule

