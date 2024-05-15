module npc(imm,JRaddr,sel,zero,pc,npc,epcin);
  input [2:0]sel;
  input zero;
  input [31:0]JRaddr,epcin;
  input [31:0]pc;
  wire [31:0] pcadd4 = pc+4;
  input [31:0] imm;
  wire [31:0] beqaddr = {{16{imm[15]}},imm[15:0]};
  output reg [31:0] npc;
  always@(sel or zero or pc)
  begin
    case(sel)
      3'b000:npc = pcadd4;
      3'b001:
      begin 
       if(zero) npc = pc + beqaddr * 3'b100;
       else npc = pcadd4;
      end
      3'b010:npc = {pcadd4[31:28],imm[25:0],2'b00};
      3'b011:npc = JRaddr;
      3'b100:npc = epcin;
      3'b101:npc = 32'h0000_4180;
    endcase
  end
endmodule

