module ALU(busA,busB,ALUctr,ALUout,zero,OF,addi);
  input [31:0] busA,busB;
  input [1:0] ALUctr;
  output reg[31:0] ALUout;
  input addi;
  output zero;
  output OF;
  wire zero;
  reg OF;
  reg [31:0] temout;
  assign zero=(ALUout==0)?1:0;
  always@(ALUctr or busA or busB)
  begin
    case(ALUctr)
      2'b00:begin ALUout = busA + busB;
          if(busA[31] == busB[31] && ALUout[31] == ~busA[31] && addi)
          begin
            OF = 1;
            ALUout = 32'b1;
          end
          else OF = 0;
      end
      2'b01:begin ALUout = busA - busB; OF = 0;end
      2'b10:begin ALUout = busA | busB; OF = 0;end
      2'b11:begin
        temout = busA - busB;
        if(temout[31] == 0)
          ALUout = 0;
        else
          ALUout = 1;
      end
      default: ALUout = 0;
    endcase
  end
endmodule

