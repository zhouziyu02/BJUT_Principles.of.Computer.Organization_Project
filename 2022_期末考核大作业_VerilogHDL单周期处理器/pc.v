module pc(clk,npc,pc,reset);
  input clk;			//时钟信号
  input reset;			//复位信号
  parameter resetpc = 32'h0000_3000;	//当复位信号有效时，pc被设置为0x00003000
  input [31:0] npc;		 //下一条指令地址
  output reg [31:0] pc; 	//32位指令存储器地址
  always@(posedge clk or posedge reset)
  begin
    if(reset)
      pc <= resetpc;
    else
      pc <= npc;
  end
endmodule

