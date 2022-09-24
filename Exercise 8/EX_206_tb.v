`timescale 1 ns/1 ns

module testbench;
reg	[7:0]	a;
reg	[1:0]	sel;
wire	[7:0]	b;

EX_206_beh_paral_mux EX206_instance(
		.a(a),
		.b(b),
		.sel(sel));
initial
begin
 a   = 8'b0001_1100;	// Time = 0
 sel = 2'b00;
 #20;		// Time = 20
 sel = 2'b01;
 #20;		// Time = 40
 sel = 2'b10;
 #20;		// Time = 60
 sel = 2'b11;
end
endmodule
