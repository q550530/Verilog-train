`timescale 1 ns/1 ns

module EX_206_beh_paral_mux(a, b, sel);
input	[7:0]	a;
input	[1:0]	sel;
output	[7:0]	b;
reg	[7:0]	b;



always@(*)
begin
	case (sel)
	  2'b00  : b = {a[4:0],a[7:5]};
	  2'b01  : b = {a[3:0],a[7:4]};
	  2'b10  : b = {a[4:0], 3'b00};
	  default : b = {2'b00,a[7:2]};
	endcase
end

endmodule
