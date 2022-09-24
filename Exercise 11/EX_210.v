`timescale 1 ns/1 ns

module EX_210_TTL_like_encoder (a1,a2, b1,b2,b3,b4, d, g,z);
input  [3:0]a1,a2, b1,b2,b3,b4, d,z;
output [3:0]g;

reg [3:0] temp1, temp2 ,temp3;
reg [3:0] sel;
reg [1:0] sel3;
reg sel2,reset,sel1;
reg  [3:0] g;


always@(*)
begin
  if(reset==1'b1)
	temp1=4'b0000;
  else
	if(sel1==1'b1)
		temp1=d;
end

always@(*)
begin
  case (sel2)
    1'b0  : temp2 = a1;
    default :       temp2 = a2;
  endcase
end

always@(*)
begin
  case (sel3)
    2'b00  : temp3 = b1;
    2'b01  : temp3 = b2;
    2'b10  : temp3 = b3;
    default :       temp3 = b4;
  endcase
end

always@(sel)
begin
  case (sel)
    4'b0001  : g = z;
    4'b0010  : g = temp1;
    4'b0100  : g = temp2;
    default :       g = temp3;
  endcase
end

endmodule
