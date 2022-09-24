`timescale 1 ns/1 ns

module EX_203_beh_test_mux_2(a, b, c, d, e, f,g, sel1, sel2, sel3 , sel4 , sel5 );
input	[3:0]	a, b, c, d, e , f;
input		sel1, sel2, sel3 ,sel4 ,sel5;
output	[3:0]	g;
reg	[3:0]	g;

always@(*)
begin
	if (sel1)
	  g = a;
	else if (sel2)
	       if(sel3)
				g=b;
		   else
				g=c;
	     else if (sel4)
	            g=d;
	          else
	            if(sel5)
					g=e;
				else
					g=f;
end
endmodule
