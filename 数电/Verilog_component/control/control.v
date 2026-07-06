//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/17 19:53:57
// Design Name: 
// Module Name: control
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


//操作控制器的Verilog代码：
`timescale 1ns / 10ps
module control(
input wire LD,
input wire ADD,
input wire SUB,
input wire AND,
input wire OR,
input wire HALT,
input wire [7:0]T,
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
output wire EDR);
assign        IMAR = ~(T[0] | (T[3] & LD) | (T[3] & ADD) | (T[3] & SUB) | (T[3] & AND) | (T[3] & OR));
assign        IDR = T[1] | (T[4] & LD) | (T[4] & ADD) | (T[4] & SUB) | (T[4] & AND) | (T[4] & OR);
assign        IPC = T[2] + (T[5] & LD) + (T[5] & ADD) + (T[5] & SUB) + (T[5] & AND) + (T[5] & OR);
assign        IIR = ~T[2];
assign        ISUB = ~(T[5] & SUB);
assign        IADD = ~(T[5] & ADD);
assign        IAND = ~(T[5] & AND);
assign        IOR = ~(T[5] & OR);
assign        IA = ~((T[6] & LD) | (T[6] & ADD) | (T[6] & SUB) | (T[6] & AND) | (T[6] & OR));
assign        EALU = ~((T[6] & ADD) | (T[6] & SUB) | (T[6] & AND) | (T[6] & OR));
assign        EA = ~((T[7] & ADD) | (T[7] & SUB) | (T[7] & AND) | (T[7] & OR));
assign        EDR = ((T[6] & ADD) | (T[6] & SUB) | (T[6] & AND) | (T[6] & OR) | (T[7] & ADD) | (T[7] & SUB) | (T[7] & AND) | (T[7] & OR));

endmodule
