module IMr(clk,IRWr, PCin, PCout, IRWr);
  input clk, IRWr;
  input [31:0]PCin;
  output wire[31:0] PCout;
  reg [31:0] pc;
   assign  PCout=pc;
  always @ (posedge clk)
    begin
      if(IRWr==1)
         pc<=PCin;
    end
endmodule
