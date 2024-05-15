module GPR(ra,rb,rw,we,busa,busb,clk,reset,busw,OF);
  input [4:0]ra;	  //数据1寄存器地址
  input [4:0]rb;	  //数据2寄存器地址
  input [4:0]rw;    //写寄存器地址
  input [31:0]busw; //写入数据的输入
  input reset;
  input clk;
  
  input we;         //读写控制信号，1写0读
  input OF;
  reg [31:0] reg_group[31:0];
  output wire[31:0]busa; //32位数据1
  output wire[31:0]busb; //32位数据2
  assign busa = reg_group[ra];   //ra作为编号的寄存器内容输出到busA
  assign busb = reg_group[rb];   //rb作为编号的寄存器内容输出到busB
  always@(posedge clk or posedge reset or posedge OF)
	  begin:rep
		 integer i;
		 if(reset)       //复位信号有效时，寄存器被设置成全零
			for(i=0;i<32;i=i+1)
				case(i)
					28: reg_group[i]<=32'h0000_1800;//全球寄存器
					29: reg_group[i]<=32'h0000_2ffc;//堆栈寄存器
					default:reg_group[i]<=32'b0;
				endcase
		 else if(OF)
			reg_group[30]=1;        //溢出信号，第30号寄存器第一位为1
		 else if(we && rw)
				reg_group[rw]= busw;			
	  end
endmodule
        
