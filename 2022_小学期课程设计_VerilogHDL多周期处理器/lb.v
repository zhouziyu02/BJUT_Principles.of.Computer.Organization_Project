module lb(din, lb_sel, dout, lben);//lb指令：取出存储器的相应字节
  input [31:0]din;
  input [1:0]lb_sel;			//选择
  input lben;					//使能
  output [31:0]dout;
  
  assign dout = !lben ? din : lb_sel==0 ? {{24{din[7]}}, din[7:0]} : lb_sel==1 ?
			{{24{din[15]}}, din[15:8]} : lb_sel==2 ? {{24{din[23]}}, din[23:16]} : {{24{din[31]}}, din[31:24]};  
endmodule