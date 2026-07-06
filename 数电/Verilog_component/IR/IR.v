`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/27 16:55:39
// Design Name: 
// Module Name: IR
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


module IR(
input wire [7:0]DATA_in,
input wire IIR,
input wire CLK,
output reg LD,
output reg ADD,
output reg SUB,
output reg AND,
output reg OR,
output reg HALT
);

reg [7:0]REGQ;

always @(posedge CLK)begin
    if(IIR==1'b0)begin
        REGQ <= DATA_in;
    end

end

always @(*)begin
    case (REGQ)
        8'b00111110:begin LD <= 1'b1; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b0;end             
        8'b11000110:begin LD <= 1'b0; ADD <= 1'b1; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b0;end             
        8'b10000110:begin LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b1; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b0;end            
        8'b00100110:begin LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b1; OR <= 1'b0;HALT <= 1'b0;end             
        8'b01111100:begin LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b1;HALT <= 1'b0;end            
        8'b01110110:begin LD <= 1'b0; ADD <= 1'b0; SUB <= 1'b0; AND <= 1'b0; OR <= 1'b0;HALT <= 1'b1;end             
        default: ;
    endcase
end
endmodule