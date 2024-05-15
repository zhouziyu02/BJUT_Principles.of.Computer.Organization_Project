module cu(clk,reset,rs,intreq,lb,sb,zero,op,func,overflow,pcwr,irwr,regdst,alusrc,regwr,memwr,aluctr,npcsel,extop,memtoreg,cp0we,exlclr,exlset,luisel);
  input [5:0] op,func;
  input [4:0] rs;
  input clk,reset,zero,intreq,overflow;
  output alusrc,regwr,memwr,extop,irwr,pcwr,lb,cp0we,exlset,exlclr,sb,luisel;
  output [1:0] regdst;
  output [2:0] npcsel,memtoreg;
  output [1:0] aluctr;
  wire over;
  reg [3:0] state;
  
  parameter s0=4'b0000,s1=4'b0001,s2=4'b0010,s3=4'b0011,s4=4'b0100,s5=4'b0101,s6=4'b0110,s7=4'b0111,s8=4'b1000,s9=4'b1001,s10=4'b1010;
  
  assign sb=(op===6'b101000);
  assign lb=(op===6'b100000);
  assign rtype=(op===6'b0);
  assign addu=rtype &(func===6'b100001);
  assign subu=rtype &(func===6'b100011);
  assign slt=rtype &(func===6'b101010);
  assign ori=(op===6'b001101);
  assign lw=(op===6'b100011);
  assign sw=(op===6'b101011);
  assign beq=(op===6'b000100);
  assign j=(op===6'b000010);
  assign lui=(op===6'b001111);
  assign addiu=(op===6'b001001);
  assign addi=(op===6'b001000);
  assign over=overflow&addi;
  assign jr=rtype &(func===6'b001000);
  assign jal=(op===6'b000011);
  assign mtc0=(op===6'b010000) && (rs===5'b00100);
  assign eret=(op===6'b010000) && (func===6'b011000);
  assign mfc0=(op===6'b010000) && (rs===5'b00000);
  
  always@(posedge clk,posedge reset)
  begin
    if(reset)     state=s0;
    else
    begin
      case(state)
        s0:state=s1;
        s1:
          begin
            if(lw|sw|lb|sb) state=s2;
            if(rtype|ori|lui|addiu|addi)  state=s6;
            if(beq)  state=s8;
            if(j|jal|eret)  state=s9;
            if(mtc0|mfc0)  state=s7;
          end
        s2:
          begin
            if(lw|lb)  state=s3;
            if(sw|sb)  state=s5;
          end
        s3:state=s4;
        s4:
        begin
          if(intreq)  state=s10;
          else        state=s0;
        end
        s5:
        begin
          if(intreq)  state=s10;
          else        state=s0;
        end
        s6:state=s7;
        s7:
        begin
          if(intreq)  state=s10;
          else        state=s0;
        end
        s8:
        begin
          if(intreq)  state=s10;
          else        state=s0;
        end
        s9:
        begin
          if(intreq)  state=s10;
          else        state=s0;
        end
        s10:state=s0;
        endcase
      end
    end
    
    
    assign regwr=(state==s7)|(jal&&(state==s9))|((lw|lb)&&(state==s4));
    assign memwr=(sb|sw)&(state==s5);
    assign pcwr=(state==s0)|(state==s10)| ((state==s8)&zero) | ((j|jal|eret)&&(state==s9)) | (jr &&(state==s7));
    assign irwr=(state==s0);
    assign npcsel={(eret&(state!=s0) | (state==s10)),(jal|jr|j)&(state!=s0)&(state!=s10),(((beq|jr)&(state!=s0))|(state==s10))};     
            
    assign cp0we=(state==s10) | (mtc0 &(state==s7));
    assign exlset=(state==s10);
    assign exlclr=(eret & (state==s9));
    
    assign alusrc=ori|lw|lb|sw|sb|lui|addiu|addi;
    assign luisel=lui;
    assign extop=lw|lb|sw|sb|addi;
    
    assign regdst={over|jal,over|rtype};
    
    assign memtoreg = {mfc0,over|jal,over|lw|lb};
    
    assign aluctr={slt|ori|lui,subu|slt|beq};
  endmodule
   
  
  
  