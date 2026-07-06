
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/13 18:08:46
// Design Name: 
// Module Name: top_tb
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


`timescale 1ns / 10ps
module top_tb;


reg CLK,CLRn;

wire IPC;         
wire IMAR;        
wire IDR;         
wire EDR;         
wire IA;          
wire EA;          
wire ISUM;        
wire EALU;        
wire ISUB;        
wire IAND;        
wire IOR;         
wire IIR;         
wire [7:0] DATA_out;    
wire LD;                
wire ADD;              
wire SUB;               
wire AND;               
wire OR;                
wire HALT;             
wire [7:0]T;            
wire [3:0]Q;
wire [7:0]acc_data_out;
wire [3:0]ADD_out;
//wire [7:0]ALU_out;
wire a1,a2,b1,b2,c1,c2,d1,d2,e1,e2,f1,f2,g1,g2;
top top (
        .CLK(CLK),
        .CLRn(CLRn),
        .IPC(IPC),         
        .IMAR(IMAR),        
        .IDR(IDR),         
        .EDR(EDR),         
        .IA(IA),         
        .EA(EA),         
        .ISUM(ISUM),       
        .EALU(EALU),        
        .ISUB(ISUB),       
        .IAND(IAND),       
        .IOR(IOR),         
        .IIR(IIR),        
        .DATA_out(DATA_out),    
        .LD(LD),                
        .ADD(ADD),               
        .SUB(SUB),              
        .AND(AND),               
        .OR(OR),                
        .HALT(HALT),              
        .T(T),            
        .Q(Q),//,
        .ADD_out(ADD_out),
       .acc_data_out(acc_data_out),//,
      .a1(a1),
    .b1(b1),
    .c1(c1),
    .d1(d1),
    .e1(e1),
    .f1(f1),
    .g1(g1),
    .a2(a2),
    .b2(b2),
    .c2(c2),
    .d2(d2),
    .e2(e2),
    .f2(f2),
    .g2(g2)
);

always #5 CLK <= ~CLK;

initial begin
    CLK <= 1'b0;
    CLRn <= 1'b0;
    #7 CLRn = 1'b1;
    #900000000 $stop;
end


endmodule
