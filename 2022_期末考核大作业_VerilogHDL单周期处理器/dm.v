module dm_1k(addr, din, we, clk, dout);
    input   [9:0]  addr ;  // 数据存储器地址
    input   [31:0]  din ;   // 写入数据的输入
    input           we ;    // 读写控制信号
    input           clk ;   // clock
    output  [31:0]  dout ;  // 32位数据输出
    reg     [7:0]  dm[1023:0] ;
  integer i;
  initial begin
      for(i=0;i<1024;i=i+1)dm[i]=0;
    end
  assign dout = {dm[addr],dm[addr+1],dm[addr+2],dm[addr+3]};
  always@(posedge clk)
    begin
      if(we == 1'b1)
        {dm[addr],dm[addr+1],dm[addr+2],dm[addr+3]} = din;//根据输入的地址将输入的数据写入相应的寄存器
    end
endmodule
  

