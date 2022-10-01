`timescale 1 ns/1 ns

module count(reset, clk, one_sec, seven_seg_scan);

// 186a0 count for 500 Hz at 50 MHz
 parameter HZ_500_CNT = 17'h186a0 - 1;

// 7d00 count for 500 Hz at 16 MHz
// parameter HZ_500_CNT = 15'h7d00 - 1;

// 1f4 count for one second at 500 Hz
 parameter CNT_500 = 9'h032 - 1;

input		reset, clk;
output 		one_sec;
output	[2:0]	seven_seg_scan;
wire		one_sec;
wire	[2:0]	seven_seg_scan;

reg		hz_500_reg, one_sec_reg;
reg	[16:0] 	cnt_500hz;
reg	[ 2:0] 	seg_scan_cnt;
reg	[ 8:0] 	cnt_one_sec;

assign	one_sec = one_sec_reg;
assign	seven_seg_scan = seg_scan_cnt;

// generate 500 Hz pulses (hz_500_reg) from 50 MHz
always@(posedge clk or negedge reset)
begin
  if(!reset) begin
    cnt_500hz  <= #1 17'h0;
    hz_500_reg <= #1 1'b0;
  end
  else
    if (cnt_500hz == HZ_500_CNT) begin
      hz_500_reg <= #1 1'b1;
      cnt_500hz  <= #1 17'h0;
    end
    else begin
      hz_500_reg <= #1 1'b0;
      cnt_500hz  <= #1 cnt_500hz + 17'h00001;
    end
end

// generate 125 Hz scan count (seg_scan_cnt) from 500 Hz
// to scan the 4 seven segment digits in turn
always@(posedge clk or negedge reset)
begin
  if(!reset)
    seg_scan_cnt  <= #1 3'b000;
  else
    if (hz_500_reg == 1'b1)
      seg_scan_cnt  <= #1 seg_scan_cnt + 3'b001;
end

// generate 1 Hz (1 sec) pulses (one_sec_reg) from 500 Hz
always@(posedge clk or negedge reset)
begin
  if(!reset) begin
    cnt_one_sec <= #1 9'h0;
    one_sec_reg <= #1 1'b0;
  end
  else
    if (hz_500_reg == 1'b1)
      if (cnt_one_sec == CNT_500) begin
        one_sec_reg <= #1 1'b1;
        cnt_one_sec <= #1 9'h0;
      end
      else begin
        one_sec_reg <= #1 1'b0;
        cnt_one_sec <= #1 cnt_one_sec + 9'h001;
      end
    else
      one_sec_reg <= #1 1'b0;
end

endmodule
