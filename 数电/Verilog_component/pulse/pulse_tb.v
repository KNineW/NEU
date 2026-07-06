`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/24 14:45:33
// Design Name: 
// Module Name: pulse_tb
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


//-----pulse_tb.v
module pulse_tb;
reg clk,start;
wire [7:0] T;
pulse pulse(
        .CLK(clk),
        .start(start),
        .T(T)
);

initial begin
        clk<=0;start<=0;
    #17 start<=1;
    #5000 $stop;
end
always #5 clk<=~clk;
endmodule
