module bridge(praddr,rd,wdin,wdout,wecpu,hwintin,hwintout,outaddr,outwe,tcwe,rd1,rd2,rd3);
  input[31:0]praddr,wdin,rd1,rd2,rd3;
  input wecpu;
  input[5:0]hwintin;
  output[5:0]hwintout;
  output[1:0]outaddr;
  output outwe,tcwe;
  output[31:0]rd,wdout;
  wire hitin,hitout,hittc;
  assign hitin=(praddr[31:4]==28'h0000_7f2);
  assign hitout=(praddr[31:4]==28'h0000_7f1);
  assign hittc=(praddr[31:4]==28'h0000_7f0);
  
  assign outwe=(hitout&&wecpu);
  assign tcwe=(hittc&&wecpu);
  assign hwintout=hwintin;
  assign wdout=wdin;
  assign outaddr=praddr[3:2];
  assign rd=hitin?rd1:
            hitout?rd2:
            hittc?rd3:
            rd;
endmodule
            

