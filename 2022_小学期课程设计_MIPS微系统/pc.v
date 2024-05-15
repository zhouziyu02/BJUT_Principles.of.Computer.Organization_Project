module pc(clk,reset,PCWr,npc,outpc);
  input clk;
  input reset,PCWr;
  parameter resetpc = 32'h0000_3000;
  input [31:0] npc;
  output reg [31:0] outpc; 
  always@(posedge clk or posedge reset)
  begin
    if(reset)
      outpc <= resetpc;
    else if(PCWr)
      outpc <= npc;
    else if(~PCWr)
      outpc <= outpc;
  end
endmodule

