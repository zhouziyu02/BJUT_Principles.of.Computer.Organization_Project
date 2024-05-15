module outDev(clk,we,sel,in,out); //0x0000_7f10
  input  [31:0] in;
  input  clk, we;
  input  [1:0]  sel;
  output [31:0] out;
  reg    [31:0] a1;
  reg    [31:0] a2;
  
  assign out = (sel==2'b00)?a1:
               (sel==2'b01)?a2:
               out;
               
  always @ (posedge clk)
  begin 
    if(we)
      begin
        if(sel==2'b00)  a1 = in;
        if(sel==2'b01)  a2 = in;
      end
  end
endmodule
