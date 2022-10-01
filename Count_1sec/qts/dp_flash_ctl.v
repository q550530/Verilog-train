`timescale 1 ns/1 ns

module dp_flash_ctl(reset, clk, one_sec, dp0, dp1, dp2, dp3, dp4, dp5, dp6, dp7);
input	reset, clk, one_sec;
output	dp0, dp1, dp2, dp3, dp4, dp5, dp6, dp7;
wire	dp0, dp1, dp2, dp3, dp4, dp5, dp6, dp7;

reg	[7:0]	sft_reg;

assign dp0 = sft_reg[0];
assign dp1 = sft_reg[1];
assign dp2 = sft_reg[2];
assign dp3 = sft_reg[3];
assign dp4 = sft_reg[4];
assign dp5 = sft_reg[5];
assign dp6 = sft_reg[6];
assign dp7 = sft_reg[7];

always@(posedge clk or negedge reset)
begin
  if(!reset)
    sft_reg <= #1 8'b0000_0001;
  else
    if (one_sec == 1'b1)
      sft_reg <= #1 { sft_reg[6:0], sft_reg[7] };
end

endmodule
