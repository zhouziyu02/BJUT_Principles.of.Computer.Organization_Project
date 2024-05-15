module inDev(in,out);   //0x0000_7f20
  input  [31:0] in;
  output [31:0] out;
  reg    [31:0] devr;
  
  always @ (*) 
    devr = in;
  assign out = devr;
endmodule
