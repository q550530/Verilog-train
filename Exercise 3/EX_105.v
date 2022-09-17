`timescale 1 ns/1 ns

module EX_105_test_mux_2(a, b, c, d, e, f, sel1, sel2, sel3, sel4, sel5,g);
input	[3:0]	a, b, c, d, e, f;
input		sel1, sel2, sel3 , sel4, sel5;
output	[3:0]	g;
wire 	[3:0]	g;


assign	g = ( sel1 ) ? a :
	    ( sel2 ) ? ((sel3)? b : c) :
	    ( sel4 ) ? d :	((sel5) ? e : f);



endmodule
