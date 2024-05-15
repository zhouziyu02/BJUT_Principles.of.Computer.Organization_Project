module EXT(ExtOp, imma, immb, Luisel);
  input Luisel;				//控制信号，指令是否为lui
  input ExtOp;					//控制信号，0零扩展1符号扩展
  input [15:0]imma;			//32位mips指令
  output reg[31:0]immb;		//扩展后32位数据输出
  always@(Luisel or imma or ExtOp)
  begin
    if(~ExtOp)
      immb = {{16{1'b0}},imma};//零扩展
    else
      immb = {{16{imma[15]}},imma};//符号扩展
    if(Luisel)  //lui扩展
      immb = {imma,{16{1'b0}}};
  end
endmodule


