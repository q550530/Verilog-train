`timescale 1 ns/1 ns

module testbench;

reg		reset, clk;
reg	[15:0]	a, b;
wire	[15:0]	acc_out;

EX_314_multiply_and_accumulate EX314_instance(
	.clk(clk), .reset(reset), .a(a), .b(b), .acc_out(acc_out) );

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
 reset	= 1'b0;	
 a	= 16'd0;
 b	= 16'd0;
 #75;			// Time = 75
 reset  = 1'b1;
 #26;			// Time = 101
 a	= 16'd30;
 b  = 16'd11;
 #50;			// Time = 201
 a	= 16'd40;
 b  = 16'd12;
 #50;			// Time = 251
 a	= 16'd50;
 b  = 16'd13;
 #50;			// Time = 301
 a	= 16'd60;
 b  = 16'd14;
 #50;			// Time = 351
 a	= 16'd70;
 b  = 16'd15;
 #50;			// Time = 401
 a	= 16'd80;
 b  = 16'd16;
 #50;			// Time = 451
 a	= 16'd90;
 b  = 16'd17;
 #50;			// Time = 501
 a	= 16'd100;
 b  = 16'd18;
end
endmodule
