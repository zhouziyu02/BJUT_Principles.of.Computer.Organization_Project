module A(clk, Ain, Aout);
  input clk;
  input [31:0] Ain;
  output wire[31:0] Aout;
  reg [31:0] A;
  assign Aout = A;
  always @ (posedge clk)
    A <= Ain;
endmodule 

