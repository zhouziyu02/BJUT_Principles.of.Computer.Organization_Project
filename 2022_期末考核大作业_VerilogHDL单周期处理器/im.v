module im(addr, dout);
	  input [9:0] addr;  //指令寄存器地址
	  output [31:0] dout; //32位mips指令
	  reg [7:0] im[1023:0]; 
	  initial begin
		 $readmemh("C:/Users/zzy/Desktop/p1_1.0/p1_1.0/p1-test.txt",im);//保存到指令寄存器
	  end
		assign dout = {im[addr],im[addr+1],im[addr+2],im[addr+3]};
endmodule



