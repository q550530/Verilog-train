`timescale 1 ns/1 ns

module testbench;
reg		reset, clk;
reg	[7:0]	a, b, c;
wire	[15:0]	g;

EX_313_pipeline EX313_instance(
	.reset(reset), .clk(clk), .a(a), .c(c), .b(b), 
	.g(g) );

// set up clk with 50 ns period 20 MHz
parameter clkper = 50;
initial
begin
	clk = 1;	// Time = 0
end

always 
begin
	#(clkper / 2)  clk = ~clk;
end

initial
begin
 reset	= 1'b0;		// Time = 0
 a  = 8'h0a;
 b	= 8'h01;
 c	= 8'h02;
 #70;			// Time = 70
 reset  = 1'b1;
 #31;			// Time = 101
 a  = 8'h13;
 b	= 8'h02;
 c	= 8'h04;
 #50;			// Time = 151
 a  = 8'h1d;
 b	= 8'h03;
 c	= 8'h06;
 #50;			// Time = 201
 a  = 8'h27;
 b	= 8'h04;
 c	= 8'h08;
 #50;			// Time = 251
 a  = 8'h31;
 b	= 8'h05;
 c	= 8'h0a;
 #50;			// Time = 301
 a  = 8'h45;
 b	= 8'h06;
 c	= 8'h0c;

end
endmodule
