module GPR(clk,reset,RegWr,rs,rt,rd,datain,busA,busB);
  input clk, reset, RegWr;
  input [31:0] datain;
  input [4:0] rd, rs, rt;
  output[31:0] busA,busB;
  wire [31:0]busA, busB;
  reg [31:0] reg_group[31:0];
  assign busA = reg_group[rs];
  assign busB = reg_group[rt];
  always @(reg_group[0])
    reg_group[0] = 0;
  always @(posedge clk or posedge reset)
  begin
    if(reset)
    begin
      reg_group[0]<=0; reg_group[16]<=0;
      reg_group[1]<=0; reg_group[17]<=0;
      reg_group[2]<=0; reg_group[18]<=0;
      reg_group[3]<=0; reg_group[19]<=0;
      reg_group[4]<=0; reg_group[20]<=0;
      reg_group[5]<=0; reg_group[21]<=0;
      reg_group[6]<=0; reg_group[22]<=0;
      reg_group[7]<=0; reg_group[23]<=0;
      reg_group[8]<=0; reg_group[24]<=0;
      reg_group[9]<=0; reg_group[25]<=0;
      reg_group[10]<=0;reg_group[26]<=0;
      reg_group[11]<=0;reg_group[27]<=0;
      reg_group[12]<=0;reg_group[28]<=0;
      reg_group[13]<=0;reg_group[29]<=0;
      reg_group[14]<=0;reg_group[30]<=0;
      reg_group[15]<=0;reg_group[31]<=0;
    end
    else
    begin
      if(RegWr == 1)
        reg_group[rd]<=datain;
    end
  end
endmodule
      
      
      
      
      
      
      
      
  

  


