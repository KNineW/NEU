`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/21 19:40:31
// Design Name: 
// Module Name: adder
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


module adder(
//input  wire  C0,//低位进位输入
input  wire  [7:0] B,  //输入加数
input  wire  [7:0] A,  //输入被加数
output wire  [7:0] S//,  //输出和
//output wire  C4
 ); //向高位进位输出
//线网类型
wire	C1,C2,C3,C4,C5,C6,C7;
wire C8;
//例化4个1位全加器
full_adder  u0(
.Ci(1'b0),		
.Bi(B[0]), 
.Ai(A[0]),
.Si(S[0]),
.Ciout(C1));	
full_adder  u1(
.Ci(C1),		
.Bi(B[1]), 
.Ai(A[1]),
.Si(S[1]),
.Ciout(C2));	
full_adder  u2(
.Ci(C2),		
.Bi(B[2]), 
.Ai(A[2]),
.Si(S[2]),
.Ciout(C3));	
full_adder  u3(
.Ci(C3),		
.Bi(B[3]), 
.Ai(A[3]),
.Si(S[3]),
.Ciout(C4));
full_adder  u4(
.Ci(C4),		
.Bi(B[4]), 
.Ai(A[4]),
.Si(S[4]),
.Ciout(C5));
full_adder  u5(
.Ci(C5),		
.Bi(B[5]), 
.Ai(A[5]),
.Si(S[5]),
.Ciout(C6));
full_adder  u6(
.Ci(C6),		
.Bi(B[6]), 
.Ai(A[6]),
.Si(S[6]),
.Ciout(C7));
full_adder  u7(
.Ci(C7),		
.Bi(B[7]), 
.Ai(A[7]),
.Si(S[7]),
.Ciout(C8));					
endmodule 
