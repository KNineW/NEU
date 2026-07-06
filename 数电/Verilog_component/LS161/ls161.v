`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/25 09:39:39
// Design Name: 
// Module Name: ls161
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


`timescale 1ns / 1ps
module LS161(
input wire CLK,
input wire CLRn,
input wire LDn,
input wire ENP,
input wire ENT,
input wire[3:0]D,
output reg[3:0]Q,
output wire RCO);
assign RCO =Q[3]&Q[2]&Q[1]&Q[0]&ENT;
always @( posedge CLK or negedge CLRn  ) begin
   if(~CLRn ) 
       Q <= 4'b0000;
   else if(~LDn ) 
       Q <=D;
   else begin
       case({ENT, ENP})
           2'b11: if(Q < 4'b1010)
                       Q <= Q + 1;
                   else if(Q == 10)
                       Q <= 4'b0000;
           default: Q <= Q; 
       endcase
   end
end
endmodule

