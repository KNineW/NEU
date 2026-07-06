`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/21 19:41:15
// Design Name: 
// Module Name: suber
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


module suber(
        //input E,
        //input OP,
        input [7:0] A,
        input [7:0] B,
        //input C0,
        output [7:0] Si//,
        //output C8i,
        //output Sign
        
    );    
    wire [8:1] C;
    wire [7:0] S;
    wire [7:0] Ai;
    wire [7:0] Bi;
    wire C8i;
    wire Sign;
    assign	Ai=A[7]?{A[7],~A[6:0]+1}:A;
    assign	Bi=B[7]?{B[7],~B[6:0]+1}:B;

    // Àý»¯8¼Ó¼õÆ÷
    full_sub u0( .A(Ai[0]), .B(Bi[0]), .C(1'b0), .S(S[0]), .Ciout(C[1]));
    full_sub u1(.A(Ai[1]), .B(Bi[1]), .C(C[1]), .S(S[1]), .Ciout(C[2]));
    full_sub u2(.A(Ai[2]), .B(Bi[2]), .C(C[2]), .S(S[2]), .Ciout(C[3]));
    full_sub u3( .A(Ai[3]), .B(Bi[3]), .C(C[3]), .S(S[3]), .Ciout(C[4])); 
    full_sub u4( .A(Ai[4]), .B(Bi[4]), .C(C[4]), .S(S[4]), .Ciout(C[5]));
    full_sub u5( .A(Ai[5]), .B(Bi[5]), .C(C[5]), .S(S[5]), .Ciout(C[6]));
    full_sub u6( .A(Ai[6]), .B(Bi[6]), .C(C[6]), .S(S[6]), .Ciout(C[7]));
    full_sub u7( .A(Ai[7]), .B(Bi[7]), .C(C[7]), .S(S[7]), .Ciout(C[8]));
    //assign C8=C[7];
    //assign C8i=~E?C8:1'bz;
    assign Si=(S[7]?{S[7],~S[6:0]+1}:S);
    
endmodule
