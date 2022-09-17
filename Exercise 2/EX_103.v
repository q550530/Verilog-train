`timescale 1 ns/1 ns

module EX_103_test_vector_and(a, b, out1, out2, out3);
input	[7:0]	a, b;
output		out1,out2;
output	[7:0]	out3;

wire	[7:0]	out3;
wire		out2,out1;

assign	out1 = ~&a;

assign	out2 = ~&b;

assign  out3 =  ~(a&b);

endmodule
