`timescale 1 ns/1 ns

module testbench;
reg		[7:0]	a, b;
wire	[7:0]	out3;
wire		out1, out2;

EX_103_test_vector_and EX103_instance(
	.a(a), 
	.b(b), 
	.out1(out1), 
	.out2(out2),
	.out3(out3) );

initial
begin
 a  = 8'b0000_0000;	// Time = 0
 b  = 8'b1111_1111;
 #50;			// Time = 50
 b  = 8'b1010_1010;
 #50;			// Time = 100
 a  = 8'b0101_0101;
 #50;			// Time = 150
 b  = 8'b0101_0101;
end

/*
initial
begin
  fork
    #0	 in1  = 4'b0000;	// Time = 0
    	 in2  = 4'b0000;
    #50	 in2  = 4'b1111;	// Time = 50
    #100 in1  = 4'b1010;	// Time = 100
    #150 in2  = 4'b0101;	// Time = 150
  join
end 
*/

endmodule
