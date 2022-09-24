`timescale 1 ns/1 ns

module testbench;
reg     a, b, c, d, e, f, g, h;
wire    out0, out1, out2;

EX_210_TTL_like_encoder EX210_instance(
	.a(a), .b(b), .c(c),
	.d(d), .e(e), .f(f),
	.g(g), .h(h),
	.out0(out0), .out1(out1),
	.out2(out2) );
initial
begin
 {h, g, f, e, d, c, b, a} = 8'b0000_0001;	// Time = 0
 #50;						// Time = 50
 {h, g, f, e, d, c, b, a} = 8'b0000_0010;
 #50;						// Time = 100
 {h, g, f, e, d, c, b, a} = 8'b0000_0100;
 #50;						// Time = 150
 {h, g, f, e, d, c, b, a} = 8'b0000_1000;
 #50;						// Time = 200
 {h, g, f, e, d, c, b, a} = 8'b0001_0000;
 #50;						// Time = 250
 {h, g, f, e, d, c, b, a} = 8'b0010_0000;
 #50;						// Time = 300
 {h, g, f, e, d, c, b, a} = 8'b0100_0000;
 #50;						// Time = 350
 {h, g, f, e, d, c, b, a} = 8'b1000_0000;
 #50;						// Time = 400
 {h, g, f, e, d, c, b, a} = 8'b0000_0000;
end
endmodule
