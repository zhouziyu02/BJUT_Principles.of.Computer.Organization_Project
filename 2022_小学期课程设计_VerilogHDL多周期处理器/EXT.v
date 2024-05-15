module EXT(imm16, imm32, extop);  //将16位立即数实现零扩展、符号扩展、低位补0而扩展为32位
  input[15:0]imm16;   //16位立即数
  input[1:0]extop;	 //符号扩展控制信号
  output[31:0]imm32;	 //符号扩展输出结果
  assign imm32 = (extop==0) ? {16'h0000, imm16} : (extop==1) ? {{16{imm16[15]}}, imm16} : {imm16, 16'h0000};
endmodule