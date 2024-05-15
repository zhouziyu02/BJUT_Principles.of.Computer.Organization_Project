module im_1k(addr, dout); //指令寄存器
  input [9:0]addr ;  // 读指令的地址
  output [31:0]dout ;  //32位输出指令
  reg [7:0]im[1023:0] ;
  initial 
  begin:rep
    integer i;
    for (i = 0; i < 1024; i = i + 1)
      im[i] = 0;
	 $readmemh("D:/Desktop/project1/p2-test.txt",im);
  end
  assign dout = {im[addr[9:0]], im[addr[9:0]+1], im[addr[9:0]+2], im[addr[9:0]+3]};//将生成的16进制保存到指令寄存器里
endmodule
