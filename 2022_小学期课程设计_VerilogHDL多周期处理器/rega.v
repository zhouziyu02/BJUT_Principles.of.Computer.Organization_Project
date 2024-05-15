module rega(clk, din, dout);
  input clk;
  input [31:0]din;
  output reg[31:0]dout;
  always @ (posedge clk)
    dout = din;
endmodule