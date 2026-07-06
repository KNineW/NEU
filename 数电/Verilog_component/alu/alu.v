`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/17 20:16:21
// Design Name: 
// Module Name: alu
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


//算术逻辑单元ALU的Verilog代码：
//ALU
module ALU(
   input wire [7:0]AC,
   input wire [7:0]DR,
   input wire ISUM,
   input wire EALU,
   input wire ISUB,
   input wire IAND,
   input wire IOR,
   output wire [7:0]ALU_out
);

reg [7:0] ALU_temp;
wire [7:0]add;
wire [7:0]sub;
wire [7:0]ander;
wire [7:0]orer;
always @(*)begin
   if(ISUM==1'b0)begin
       
        ALU_temp<=add;
   end
   else if(ISUB==1'b0)begin
      
       ALU_temp<=sub;
   end
   else if(IAND==1'b0)begin
      
      ALU_temp<=ander;
   end
   else if(IOR==1'b0)begin
      
       ALU_temp<=orer;
   end
   else begin
    ALU_temp<=8'b11111111;
   end

end
adder u1
( .A(AC),
  .B(DR),
  .S(add)
  );
  suber u2
  (
  .A(AC),
  .B(DR),
  .Si(sub)
  );
  Andd u3
  (
  .A(AC),
  .B(DR),
  .S(ander)
  );
  Orr u4
  (
  .A(AC),
  .B(DR),
  .S(orer)
  );
assign ALU_out = EALU ? (8'bzzzz_zzzz) : ALU_temp;

endmodule
