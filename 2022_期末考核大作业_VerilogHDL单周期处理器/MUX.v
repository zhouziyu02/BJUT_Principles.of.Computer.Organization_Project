module MUX_32_2(sel, data1, data2, result_32_2);
  input sel;
  input [31:0] data1;
  input [31:0] data2;
  output reg [31:0] result_32_2;
  always@(sel or data1 or data2)
    case(sel)
      1'b0:result_32_2 = data1;
      1'b1:result_32_2 = data2;
    endcase
endmodule


module MUX_5(sel, data1, data2, data3, data4, result_5);
  input [1:0]sel;
  input [4:0]data1;
  input [4:0]data2;
  input [4:0]data3;
  input [4:0]data4;
  output reg [4:0] result_5;
  always@(sel or data1 or data2 or data3 or data4)
  case(sel)
    2'b00:result_5 = data1;
    2'b01:result_5 = data2;
    2'b10:result_5 = data3;
    2'b11:result_5 = data4;
  endcase
endmodule


module MUX_32_3(sel, data1, data2, data3, result_32_3);
  input [1:0] sel;			//dm读控制信号，00slt回写，01dout回写，10jalpc回写
  input [31:0] data1;
  input [31:0] data2;
  input [31:0] data3;
  output reg [31:0] result_32_3;
  always@(sel or data1 or data2 or data3)
    case(sel)
      2'b00:result_32_3 = data1;
      2'b01:result_32_3 = data2;
      2'b10:result_32_3 = data3;
    endcase
endmodule
