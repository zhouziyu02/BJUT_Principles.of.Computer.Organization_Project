module ctr(funct,opcode,OF,RegDst,ALUSrc,MemetoReg,RegWrite,MemWrite,ExtOp,ALUctr,
N_pcsel,slt,jal,addi,luisel);
	  input [5:0]funct;  //32位mips指令中的低六位
	  input [5:0]opcode; //32位mips指令中的高六位
	  input OF;				//addi运算的溢出标志
	  output ALUSrc;   //alu32为输入数据选择信号，0寄存器输出32位数据2 1扩展后的32位数据
	  output RegWrite;  //GPR使能读写控制信号1写0读
	  output MemWrite;//DM使能读写控制信号1写
	  output jal,luisel,slt,addi;		//指令信号
	  output ExtOp;  //控制信号扩展
	  output [1:0]MemetoReg;	//dm读控制信号
	  output [1:0]ALUctr;	//alu控制信号
	  output [1:0]N_pcsel;	//pc地址改写信号，beq指令判断
	  output [1:0]RegDst;	//写地址控制信号 00写到rt对应寄存器01写到rd对应寄存器10写到31号寄存器
	  wire addu,subu,slt,jr,ori,beq,sw,lw,lui,j,jal,addi,addiu;
	  assign  addu = funct[5] & ~funct[4] & ~funct[3] & ~funct[2] & ~funct[1] & funct[0]; 
	  assign  addi = ~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
	  assign  addiu = ~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0]; 
	  assign  subu = funct[5] & ~funct[4] & ~funct[3] & ~funct[2] & funct[1] & funct[0];
	  assign  ori = ~opcode[5] & ~opcode[4] & opcode[3] & opcode[2] & ~opcode[1] & opcode[0];
	  assign  sw = opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
	  assign  lw = opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
	  assign  slt = funct[5] & ~funct[4] & funct[3] & ~funct[2] & funct[1] & ~funct[0];
	  assign  beq = ~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];
	  assign  lui = ~opcode[5] & ~opcode[4] & opcode[3] & opcode[2] & opcode[1] & opcode[0];
	  assign  j = ~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0];
	  assign  jal = ~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
	  assign  jr = ~funct[5] & ~funct[4] & funct[3] & ~funct[2] & ~funct[1] & ~funct[0];
	  
	  
	  assign  RegDst[0] = addu | subu | slt| OF;
	  assign  RegDst[1] = jal | OF;
	  assign  ALUSrc = ori | lw | sw | lui | addiu | addi;
	  assign  MemetoReg[0] = lw;
	  assign  MemetoReg[1] = jal;
	  assign  RegWrite = ori | lw | addu | subu | slt | lui | jal | addiu | (addi & ~OF);
	  assign  MemWrite = sw;
	  assign  ExtOp = lw | sw | addi | addiu;
	  assign  luisel = lui;
	  assign  ALUctr[0] = beq | subu | slt | lui;
	  assign  ALUctr[1] = ori | lui;
	  assign  N_pcsel[0] = beq | jr;
	  assign  N_pcsel[1] = j | jr |jal;
endmodule


