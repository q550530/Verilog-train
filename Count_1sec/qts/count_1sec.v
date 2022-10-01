`timescale 1 ns/1 ns

module count_1sec( reset, clk,
		   seg_a, seg_b, seg_c, seg_d,
		   seg_e, seg_f, seg_g, seg_dp,
		   com0, com1, com2, com3, com4, com5, com6, com7, led );

input		reset, clk;
output		seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, seg_dp;
output		com0, com1, com2, com3, com4, com5, com6, com7;
output	[7:0]	led;
wire		seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, seg_dp;
wire		com0, com1, com2, com3, com4, com5, com6, com7;
wire	[7:0]	led;

wire		one_sec;
wire	[2:0]	seven_seg_scan;
wire	[3:0]	cnt_d0, cnt_d1, cnt_d2, cnt_d3, cnt_d4, cnt_d5, cnt_d6, cnt_d7;
wire		dp0, dp1, dp2, dp3, dp4, dp5, dp6, dp7;

/*assign	com4 = 1'b1;
assign	com5 = 1'b1;
assign	com6 = 1'b1;
assign	com7 = 1'b1;*/
//assign	led[3:0] = 4'ha;
assign	led[7:0] = {dp0, dp1, dp2, dp3, dp4, dp5, dp6, dp7};

count count(	.reset(reset),
		.clk(clk),
		.one_sec(one_sec),
		.seven_seg_scan(seven_seg_scan) );

timer timer(	.reset(reset),
		.clk(clk),
		.one_sec(one_sec),
		.cnt_d0(cnt_d0),
		.cnt_d1(cnt_d1),
		.cnt_d2(cnt_d2),
		.cnt_d3(cnt_d3),
		.cnt_d4(cnt_d4),
		.cnt_d5(cnt_d5),
		.cnt_d6(cnt_d6),
		.cnt_d7(cnt_d7)		);

seven_seg seven_seg(
		.seven_seg_scan(seven_seg_scan),
		.cnt_d0(cnt_d0),
		.cnt_d1(cnt_d1),
		.cnt_d2(cnt_d2),
		.cnt_d3(cnt_d3),
		.cnt_d4(cnt_d4),
		.cnt_d5(cnt_d5),
		.cnt_d6(cnt_d6),
		.cnt_d7(cnt_d7),
		.dp0(dp0),
		.dp1(dp1),
		.dp2(dp2),
		.dp3(dp3),
		.dp4(dp4),
		.dp5(dp5),
		.dp6(dp6),
		.dp7(dp7),
		.seg_a(seg_a),
		.seg_b(seg_b),
		.seg_c(seg_c),
		.seg_d(seg_d),
		.seg_e(seg_e),
		.seg_f(seg_f),
		.seg_g(seg_g),
		.seg_dp(seg_dp),
		.com0(com0),
		.com1(com1),
		.com2(com2),
		.com3(com3),
		.com4(com4),
		.com5(com5),
		.com6(com6),
		.com7(com7)		);

dp_flash_ctl dp_flash_ctl(
		.reset(reset),
		.clk(clk),
		.one_sec(one_sec),
		.dp0(dp0),
		.dp1(dp1),
		.dp2(dp2),
		.dp3(dp3),
		.dp4(dp4),
		.dp5(dp5),
		.dp6(dp6),
		.dp7(dp7)		);

endmodule
