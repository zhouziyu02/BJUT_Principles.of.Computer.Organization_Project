module npc(sel,Ins,pc,npc,Zero,JRaddr);
  input [1:0]sel;		//选择信号，根据指令不同选择pc改写方式
  input Zero;			//执行beq指令，pc地址改写信号
  input [31:0]JRaddr;//执行jr指令，写给pc
  input [31:0]pc;		//32位指令存储器地址
  input [31:0]Ins; 	//32位mips指令
  wire [31:0] pcadd4;
  assign pcadd4=pc+3'b100;
  wire [31:0] beqaddr;
  assign beqaddr={{16{Ins[15]}},Ins[15:0]};//16位立即数 符号位扩展
  output reg [31:0] npc;//下条指令地址
  always@(sel or Zero or pc)
  begin
    case(sel)	//分析当前信号是j、jal、jr还是beq
      2'b00:npc = pcadd4;
      2'b01:   //当前是beq指令
      begin 
       if(Zero) npc = pcadd4 + beqaddr*3'b100;//rt=rs则跳转
       else npc = pcadd4;
      end
      2'b10:npc = {pcadd4[31:28],Ins[25:0],2'b00};//当前是j或jal指令
      2'b11:npc = JRaddr;//当前是jr指令
    endcase
  end
endmodule
    

