module testp1;
	  reg clk,rst;
	  mips mymips(clk, rst);
	  
	  initial begin
			sys_reset;
		end
		
		task sys_reset;
		begin
			clk=0;
			rst=1;
			#(1)rst=0;
			end
		endtask
		
	  always 
	  #50 clk=~clk;
  
  
  
  
endmodule

    
