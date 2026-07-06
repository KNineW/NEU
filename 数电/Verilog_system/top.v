
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/13 17:05:49
// Design Name: 
// Module Name: top
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


//顶层模块的Verilog代码：
module top (
input wire CLK,
input wire CLRn,
output wire IPC,         //程序计数控制信号
output wire IMAR,        //地址寄存信号
output wire IDR,         //数据寄存输入信号
output wire EDR,         //数据寄存输出信号
output wire IA,          //累加器的输入信号
output wire EA,          //累加器的输出信号
output wire ISUM,        //ALU的加法运算控制信号
output wire EALU,        //ALU的输出控制信号
output wire ISUB,        //ALU的减法控制信号
output wire IAND,        //ALU的与运算控制信号
output wire IOR,         //ALU的或运算控制信号
output wire IIR,         //指令寄存器的寄存信号
output wire [7:0] DATA_out,    //数据寄存器的输出值(注意这个值是总线上的值)
output wire LD,                //输出的赋值指令
output wire ADD,               //输出的加法指令
output wire SUB,               //输出的加法令
output wire AND,               //输出的与指令
output wire OR,                //输出的或指令
output wire HALT,              //输出的停机指令  
output wire [7:0]T,            //节拍器的输出节拍信号
output wire [3:0]Q,//,
output wire [3:0] ADD_out,
output wire [7:0]acc_data_out,//,
output wire a1,a2,
output wire b1,b2,
output wire c1,c2,
output wire d1,d2,
output wire e1,e2,
output wire f1,f2,
output wire g1,g2
);
    

wire LDn;
wire [3:0]D;
wire RCO;
wire [7:0] data_out;    //寄存器的输出操作值

reg [24:0]cnt;
reg CLK2HZ;//2HZ
always @(posedge CLK) begin
    if(cnt != 25'd12499999)
        cnt <= cnt + 1'b1;
    else
        cnt <= 25'd000000;
    end
always @ (posedge CLK) begin
    if(cnt == 25'd0000000)
        CLK2HZ <= ~CLK2HZ;
    end
reg [6:0] seg1,seg2;
reg [3:0] tens,ones;
assign{a1,b1,c1,d1,e1,f1,g1}=seg1;
assign{a2,b2,c2,d2,e2,f2,g2}=seg2;






//程序计数器
assign LDn = 1;
assign D = 4'b0000;

LS161 LS161(
        .CLK(CLK),
        .CLRn(CLRn),
        .LDn(LDn),
        .ENP(IPC),
        .ENT(IPC),
        .D(D),
        .Q(Q),
        .RCO(RCO)
);


//地址寄存器
LS4_D LS4_D(
        .ADD_in(Q), 
        .Clk(CLK), 
        .IMAR(IMAR),    
        .ADD_out(ADD_out)
);


//存储器

rom4_8 rom4_8(
        .CE(CLRn),
        .addr(ADD_out),
        .data(data_out) 
);


//数据寄存器

data_reg data_reg(
        .DATA_in(data_out),
        .IDR(IDR),
        .CLK(CLK),
        .EDP(EDR),
        .DATA_out(DATA_out)
);


//累加器
acc acc(
        .DATA_in(DATA_out),
        .IA(IA),    //输入控制信号
        .EA(EA),    //输出控制信号
        .CLK(CLK),
        .DATA_out(acc_data_out)
);


//ALU
ALU ALU(
        .AC(acc_data_out),
        .DR(DATA_out),
        .ISUM(ISUM),
        .EALU(EALU),
        .ISUB(ISUB),
        .IAND(IAND),
        .IOR(IOR),
        .ALU_out(DATA_out)
);



//指令寄存信号
IR IR(
        .DATA_in(DATA_out),
        .IIR(IIR),
        .CLK(CLK),
        .LD(LD),
        .ADD(ADD),
        .SUB(SUB),
        .AND(AND),
        .OR(OR),
        .HALT(HALT)
);





control_top control_top(
        .CLK(CLK),
        .start(CLRn),
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
        .IADD(ISUM),
        .IAND(IAND),
        .IOR(IOR),
        .IA(IA),
        .EALU(EALU),
        .EA(EA),
        .EDR(EDR),
        .T(T)
);
always @(*)begin 
case(DATA_out[3:0])
        4'b0000: seg1 = 7'b1111110;//0
        4'b0001: seg1 = 7'b0110000;//1
        4'b0010: seg1 = 7'b1101101;//2
        4'b0011: seg1 = 7'b1111001;//3
        4'b0100: seg1 = 7'b0110011;//4
        4'b0101: seg1 = 7'b1011011;//5
        4'b0110: seg1 = 7'b1011111;//6
        4'b0111: seg1 = 7'b1110000;//7
        4'b1000: seg1 = 7'b1111111;//8
        4'b1001: seg1 = 7'b1111011;//9
        4'b1010: seg1 = 7'b1110111;//a
        4'b1011: seg1 = 7'b0011111;//b
        4'b1100: seg1 = 7'b0001101;//c
        4'b1101: seg1 = 7'b0111101;//d
        4'b1110: seg1 = 7'b1001111;//e
        4'b1111: seg1 = 7'b1000111;//f
      
endcase
end
//十位
always @(*)begin 
case(DATA_out[7:4])
        4'b0000: seg2 = 7'b1111110;//0
        4'b0001: seg2 = 7'b0110000;//1
        4'b0010: seg2 = 7'b1101101;//2
        4'b0011: seg2 = 7'b1111001;//3
        4'b0100: seg2 = 7'b0110011;//4
        4'b0101: seg2 = 7'b1011011;//5
        4'b0110: seg2 = 7'b1011111;//6
        4'b0111: seg2 = 7'b1110000;//7
        4'b1000: seg2 = 7'b1111111;//8
        4'b1001: seg2 = 7'b1111011;//9
        4'b1010: seg2 = 7'b1110111;//a
        4'b1011: seg2 = 7'b0011111;//b
        4'b1100: seg2 = 7'b0001101;//c
        4'b1101: seg2 = 7'b0111101;//d
        4'b1110: seg2 = 7'b1001111;//e
        4'b1111: seg2 = 7'b1000111;//f
        
endcase
end  

endmodule 
