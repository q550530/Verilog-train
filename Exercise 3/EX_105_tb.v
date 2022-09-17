`timescale 1 ns/1 ns

module testbench;
reg	[3:0]	a, b, c ,d, e,f;
reg		sel1, sel2, sel3 , sel4, sel5;
wire 	[3:0]	g;

EX_105_test_mux_2 EX105_instance(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.sel1(sel1),
		.sel2(sel2),
		.sel3(sel3),
		.sel4(sel4),
		.sel5(sel5),
		.g(g));
initial
begin
 a    = 4'b0000;	// Time = 0
 b    = 4'b0001;
 c	  = 4'b0010;
 d    = 4'b0011;
 e    = 4'b0100;
 f    = 4'b0101;
 sel5 = 1'b1;
 #50			// Time = 50
 sel4 = 1'b1;
 sel5 = 1'b0;
 #50			// Time = 100
 sel3 = 1'b1;
 sel4 = 1'b0;
 #50;			// Time = 150
 sel2 = 1'b1;
 #50;			// Time = 200
 sel1 = 1'b1;
 #50;			// Time = 250
 sel1 = 1'b1;
 #50;			// Time = 300
 sel2 = 1'b0;
end
endmodule
