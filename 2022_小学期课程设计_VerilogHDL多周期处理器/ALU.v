module ALU(A, B, ALU_op, zero, alu_out, overflow, slt, addi);
  input [31:0]A, B;		//参与运算的输入数据A、B
  input addi, slt;		//是否为addi或slt指令
  input [2:0]ALU_op;		//ALU控制信号，选择运算的类型
  output zero, overflow;
  output [31:0]alu_out;
  
  wire [31:0]tmp;
  wire [31:0]loww, highh; 
  assign loww = $signed(A)/$signed(B);
  assign highh = $signed(A) % $signed(B);
  assign tmp = (ALU_op==0) ? A + B : (ALU_op==1) ? A - B : (ALU_op==2) ? A | B : (ALU_op==3) ? {highh, loww} : 4;
  assign alu_out = (slt) ? {31'b0, tmp[31]} : tmp;    //如果是slt指令则返回slt标志，否则返回计算结果
  assign overflow = (addi && ((~A[31]&~B[31]&tmp[31]) | (A[31]&B[31]&~tmp[31]))) ? 1 : 0;//addi指令时，加数与被加数最高位相同，且与结果最高位相反，则发生溢出
  assign zero = tmp==0;
endmodule
  