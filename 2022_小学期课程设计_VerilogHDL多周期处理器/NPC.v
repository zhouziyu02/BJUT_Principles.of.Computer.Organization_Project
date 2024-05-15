module NPC(curpc, imm26, register, npc_sel, zero, nxtpc, pc_add4);//计算下一条pc
	  input [31:0]curpc, register;  //当前地址、jr的寄存器输入
	  input [25:0]imm26;		//26位立即数
	  input [1:0] npc_sel;	//npc功能选择
	  input zero;
	  output [31:0]nxtpc, pc_add4;
	  
	  wire [31:0]tmp0, tmp1, tmp2, tmp3;

	  assign tmp0 = curpc + 4;
	  assign tmp1 = ({{16{imm26[15]}}, imm26[15:0]} << 2) + curpc;
	  assign tmp2 = {curpc[31:28], imm26, 2'b00};
	  assign tmp3 = register;
	  
	  assign nxtpc = (npc_sel==3) ? tmp3 : (npc_sel==2) ? tmp2 : (npc_sel==1 && zero) ? tmp1 : tmp0;
	  assign pc_add4 = curpc;
endmodule
  