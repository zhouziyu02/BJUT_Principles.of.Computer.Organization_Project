module sb(busB, din, dout, sb_sel, sben);//sb指令：字节存入存储器的相应字节位置
  input [31:0]busB, din;
  input [1:0]sb_sel;		//sb选择
  input sben;				//sb使能
  output [31:0]dout;
  
  assign dout = !sben ? busB : sb_sel==0 ? {din[31:8], busB[7:0]} : sb_sel==1 ? 
  {din[31:16], busB[7:0], din[7:0]} : sb_sel==2 ? {din[31:24], busB[7:0], din[15:0]} : {busB[7:0], din[23:0]};  
endmodule