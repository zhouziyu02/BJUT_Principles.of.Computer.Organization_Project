module CP0(clk,reset,datain,dataout,regaddr,we,exlset,exlclr,pcin,epcout,intreq,hwint);
  input clk,reset,we,exlset,exlclr;
  input [31:0]datain,pcin;
  input [5:0]hwint;
  input [4:0]regaddr;
  output [31:0]dataout,epcout;
  output intreq;
  reg[31:0]sr,cause,epc,prid;
  always@(*)
  begin
    cause[15:10]=cause[15:10]|hwint;
    if(exlset) sr[1]=1;
    if(exlclr)
      begin
        sr[1]=0;
        cause[10]=0;
      end 
  end
  
  assign intreq=|(cause[15:10]&sr[15:10])&sr[0]&!sr[1];
  assign dataout=(regaddr==5'b01100)?sr:
                 (regaddr==5'b01101)?cause:
                 (regaddr==5'b01110)?epc:
                 (regaddr==5'b01100)?prid:
                 dataout;
  assign epcout=epc;
  always@(posedge clk,posedge reset)
  begin
    if(reset)
      begin
        sr=0;cause=0;epc=0;prid=32'h180711;
      end 
  else 
    begin 
      if(we)
        begin
          if(regaddr==5'b01100)sr={16'b0,datain[15:10],8'b0,datain[1:0]};
          if(regaddr==5'b01110)epc=datain;
          if(exlset)epc=pcin;
        end
    end
end  
endmodule        