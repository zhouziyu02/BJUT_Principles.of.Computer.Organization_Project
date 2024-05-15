module ALU(A,B,Zero,ALUctr,ALUout,OF,addi);
  input [31:0]A;   //32位输入数据1
  input [31:0]B;   //32位输入数据2
  input [1:0]ALUctr; //控制信号，00加、01减、10或、11输出B
  input addi;   //控制信号，1指令为addi，0指令不是addi
  output reg [31:0]ALUout;  //32位输出数据
  output reg OF;		//addi溢出标志
  output reg Zero;   //ALU计算结果为0标志（A=B）1结果为零0结果非零
  always@(A or B or ALUctr)
    begin
      case(ALUctr)
        2'b00:
        begin
          ALUout = A + B;//加
          if((A[31] == B[31])&& (ALUout[31] == ~A[31]) && addi)//addi指令时，加数与被加数高位相同且与结果最高位相反则溢出
            begin OF = 1;ALUout=32'b1;end//addi溢出
          else OF = 0;
        end
        2'b01:begin ALUout = A - B; OF = 0;end//减
        2'b10:begin ALUout = A | B; OF = 0;end//按位或
        2'b11:ALUout = B;
        default:OF = 0;
        endcase
		  if(A==B)
				Zero = 1;
		  else
				Zero = 0;
	  end
endmodule
          
          
  


