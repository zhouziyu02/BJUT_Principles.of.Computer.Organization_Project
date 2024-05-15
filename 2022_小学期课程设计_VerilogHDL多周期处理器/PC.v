module PC(clk, reset, nxtpc, curpc, pcwr);
	  input clk, reset, pcwr;
	  input [31:0]nxtpc;
	  output reg[31:0]curpc;
	  always @ (posedge clk, posedge reset)
	  begin
		 if (reset) curpc = 32'h0000_3000;
		 else if (pcwr) curpc = nxtpc;
	  end
endmodule 
