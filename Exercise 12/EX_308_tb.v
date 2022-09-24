`timescale 1 ns/1 ns

module testbench;
reg 		clk, reset;
reg	[3:0]	a, b;
reg	[1:0]	sel;
wire	[3:0]	q;

EX_308_paral_muxed_reg EX308_instance(
	.reset(reset), .clk(clk), .a(a),
	.b(b),.sel(sel), .q(q) );

// set up clk with 10 ns period (100 MHz)
parameter clkper = 10;
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
 a 	= 4'h5;	// Time = 0
 b 	= 4'h3;
 sel	= 2'b00;
 reset  = 1'b0;
 #80;			// Time = 80
 reset  = 1'b1;
 #45;			// Time = 125
 sel	= 2'b01;
 #50;			// Time = 175
 sel	= 2'b10;
 #50;			// Time = 125
 sel	= 2'b11;
 #50;			// Time = 125
 sel	= 2'b00;
end
endmodule
