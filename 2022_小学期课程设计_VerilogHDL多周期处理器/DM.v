module DM(addr, din, we, clk, dout);//实现相应的数据存储器的写入及输出功能。
  input [9:0]addr ;  //数据存储器地址
  input [31:0]din ;  //addr处数据的输入
  input we;    //写使能
  input clk; 
  output [31:0]dout;  // 输出数据
  reg [7:0] dm[1023:0];
  
  wire [9:1]tmp = {addr[9:2], 2'b00};
  
  initial									//1kb空间和初始化
  begin:rep
    integer i;
    for (i = 0; i < 1024; i = i + 1)
      dm[i] = 8'b0;
  end
  
  always @ (posedge clk)				//实现相应的数据存储器的写入
  begin
      if (we)
      begin
        dm[tmp] = din[7:0];
        dm[tmp + 1] = din[15:8];
        dm[tmp + 2] = din[23:16];
        dm[tmp + 3] = din[31:24];
      end 
  end
  assign dout = {dm[tmp+3], dm[tmp+2], dm[tmp+1], dm[tmp]};   //根据输入的地址，将输入的数据写入相应的寄存器
endmodule
