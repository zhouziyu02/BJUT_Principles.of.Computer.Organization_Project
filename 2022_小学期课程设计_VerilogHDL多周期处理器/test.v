module test;
	  reg clk, rst;
	  mips m1(clk, rst);
	  
	  initial
	  begin
		 clk = 0; rst = 0;
		 #5 rst = 1;    //延迟5nm
		 #5 rst = 0;	 //延迟5nm
		
	  end
	  
	  always
		 #50 clk = ~clk;//延迟50nm

endmodule