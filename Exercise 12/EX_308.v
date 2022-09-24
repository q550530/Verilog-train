`timescale 1 ns/1 ns

module EX_308_paral_muxed_reg (clk, reset, a, b, sel, q);
input 		clk, reset;
input	[3:0]	a, b;
input	[1:0]	sel;
output	[3:0]	q;
reg	[3:0]	q;

always @ (posedge clk or negedge reset)
begin
	if (!reset)
	  q <= #1 4'h0;
	else
	  case (sel)
	    2'b00 :   q <= #1 a + b;
	    2'b01 :   q <= #1 a - b;
	    2'b10 :   q <= #1 a&b;
	    2'b11 :   q <= #1 a|b;
	    default : q <= #1 a + b;
	  endcase
end

endmodule

