module Controller(clk, op, func, reg_sel, alu_op, wd_sel, we, npc_sel, ext_op, regwrite, alu_sel, addien, slten, lben, sben, pcwr, irwr, zero);
	  input clk, zero;
	  input [5:0]op, func;		//指令的高低六位字段
	  output we, regwrite, addien, slten, alu_sel;//模块使能信号
	  output [1:0]reg_sel, wd_sel, npc_sel, ext_op;//模块选择信号
	  output [2:0]alu_op;
	  output sben, lben;
	  output reg pcwr, irwr;
	  
	  reg [3:0]fsm;
	  wire fs0, fs1, fs2, fs3, fs4, fs5, fs6, fs7, fs8, fs9;
	  parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9;
	  initial begin fsm = 0; pcwr = 1; irwr = 1; end
	  
	  wire addu = (op==6'b0 && func==6'b100001);
	  wire subu = (op==6'b0 && func==6'b100011);
	  wire div = (op==6'b0 && func==6'b011010);
	  wire ori = (op==6'b001101);
	  wire lw = op==6'b100011;
	  wire sw = op==6'b101011;
	  wire beq = op==6'b000100;
	  wire lui = op==6'b001111;
	  wire j = op==6'b000010;
	  wire addiu = op==6'b001001;
	  wire jal = op==6'b000011;
	  wire jr = (op==6'b0 && func==6'b001000);
	  wire lb = (op==6'b100000);
	  wire sb = (op==6'b101000);
	  wire addi;
	  wire slt ;
	 
	  assign addien = addi&!fs0;
	  assign slten = slt&!fs0;
	  assign sben = sb&!fs0;
	  assign lben = lb&!fs0;
	  
	  always @ (posedge clk)
	  begin
		 case(fsm)
			s0:fsm = s1;
			s1:
			  if (sw|lw|sb|lb) fsm = s2;
			  else if (addu|subu|ori|lui|addi|addiu|slt|jr|div) fsm = s6;
			  else if (beq) fsm = s8;
			  else fsm = s9;
			s2:
			  if (lw|lb) fsm = s3;
			  else fsm = s5;
			s3:fsm = s4;//lw/lb
			s4:fsm = s0;
			s5:fsm = s0;//sw/sb
			s6:fsm = s7;
			s7:fsm = s0;//其他
			s8:fsm = s0;//beq
			s9:fsm = s0;//j
		 endcase
	  end
	  always @ (zero, addu, subu, ori, lw, sw, beq, div, j, lui, addi, addiu, slt, jal, jr, lb, sb, fs0, fs1, fs2, fs3, fs4, fs5, fs6, fs7, fs8, fs9)
		 begin
			pcwr = (fs0)|(beq&fs8&zero)|((jal|j)&fs9)|(jr&fs7);
			irwr = (fs0);
		 end

	  assign fs0 = fsm==s0;
	  assign fs1 = fsm==s1;
	  assign fs2 = fsm==s2;
	  assign fs3 = fsm==s3;
	  assign fs4 = fsm==s4;
	  assign fs5 = fsm==s5;
	  assign fs6 = fsm==s6;
	  assign fs7 = fsm==s7;
	  assign fs8 = fsm==s8;
	  assign fs9 = fsm==s9;
	  
	  
	  assign we = (sw|sb)&(fs5); //写使能
	  assign regwrite = (addu|subu|ori|lw|lb|lui|addi|addiu|slt|jal|div)&(fs4|fs7|fs9); //寄存器写使能
	  assign addi = op==6'b001000; 
	  assign slt = op==6'b0 && func==6'b101010;
	  assign alu_sel = (ori|lw|lb|sb|sw|lui|addi|addiu)&(!fs0);//busb选择
	  assign reg_sel = ((ori|lui|addi|addiu|div)&(fs1|fs6|fs7))|((lw|lb)&(fs1|fs2|fs3|fs4)) ? 0 : (addu|subu|slt)&(fs1|fs6|fs7) ? 1 : (jal)&(fs9|fs1) ? 2 : 3;//rt rd 31
	  assign alu_op = (addu|lw|lb|sb|sw|addi|addiu)&(!fs0) ? 0 : (subu|beq|slt)&(!fs0) ? 1 : (ori|lui)&(!fs0) ? 2 : (div&!fs0) ? 3 : (!fs0) ? 4 : 5;//add sub ori
	  assign wd_sel = (addu|subu|ori|lui|addi|addiu|slt|div)&(!fs0) ? 0 : (lw|lb)&(!fs0) ? 1 : (jal)&(!fs0) ? 2 : 3;//aluout、dm、pc+4
	  assign npc_sel = (beq&fs8) ? 1 : (j|jal)&fs9 ? 2 : (jr&fs7) ? 3 : 0;//pc+4 beq j
	  assign ext_op = (ori)&(!fs0) ? 0 : (lw|lb|sb|sw|addi|addiu)&(!fs0) ? 1 : (lui)&(!fs0) ? 2 : 3;//无符号扩展、lui指令
   
endmodule
