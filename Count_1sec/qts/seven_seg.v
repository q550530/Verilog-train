`timescale 1 ns/1 ns

module seven_seg(seven_seg_scan,
		cnt_d0, cnt_d1, cnt_d2, cnt_d3, cnt_d4, cnt_d5, cnt_d6, cnt_d7,
		dp0, dp1, dp2, dp3, dp4, dp5, dp6, dp7,
		seg_a, seg_b, seg_c, seg_d,
		seg_e, seg_f, seg_g, seg_dp,
		com0, com1, com2, com3, com4, com5, com6, com7);

input	[2:0]	seven_seg_scan;
input		dp0, dp1, dp2, dp3 ,dp4, dp5, dp6, dp7;
input	[3:0]	cnt_d0, cnt_d1, cnt_d2, cnt_d3, cnt_d4, cnt_d5, cnt_d6, cnt_d7;
output 		seg_a, seg_b, seg_c, seg_d,
		seg_e, seg_f, seg_g, seg_dp;
output		com0, com1, com2, com3, com4, com5, com6, com7;
wire 		seg_a, seg_b, seg_c, seg_d,
		seg_e, seg_f, seg_g, seg_dp;
reg		com0, com1, com2, com3, com4, com5, com6, com7;

reg	[3:0]	hex_digit;
reg	[6:0]	seg_data;
reg		seg_data_dp;

assign	seg_a  = ~seg_data[6];
assign	seg_b  = ~seg_data[5];
assign	seg_c  = ~seg_data[4];
assign	seg_d  = ~seg_data[3];
assign	seg_e  = ~seg_data[2];
assign	seg_f  = ~seg_data[1];
assign	seg_g  = ~seg_data[0];
assign  seg_dp = ~seg_data_dp;

always @(hex_digit)
begin
  case (hex_digit)
         4'b0000 : seg_data = 7'b1111110;
         4'b0001 : seg_data = 7'b0110000;
         4'b0010 : seg_data = 7'b1101101;
         4'b0011 : seg_data = 7'b1111001;
         4'b0100 : seg_data = 7'b0110011;
         4'b0101 : seg_data = 7'b1011011;
         4'b0110 : seg_data = 7'b1011111;
         4'b0111 : seg_data = 7'b1110000;
         4'b1000 : seg_data = 7'b1111111;
         4'b1001 : seg_data = 7'b1111011; 
         4'b1010 : seg_data = 7'b1110111;
         4'b1011 : seg_data = 7'b0011111; 
         4'b1100 : seg_data = 7'b1001110; 
         4'b1101 : seg_data = 7'b0111101; 
         4'b1110 : seg_data = 7'b1001111; 
         4'b1111 : seg_data = 7'b1000111; 
	 default : seg_data = 7'b0111110;
  endcase
end

always @(*)
begin
  com0 = 1'b1;
  com1 = 1'b1;
  com2 = 1'b1;
  com3 = 1'b1;
  com4 = 1'b1;
  com5 = 1'b1;
  com6 = 1'b1;
  com7 = 1'b1;
  case (seven_seg_scan)
    3'b000 :   begin
		hex_digit   = cnt_d0;
		com0        = 1'b0;
		seg_data_dp = dp0;
              end
    3'b001 :   begin
		hex_digit   = cnt_d1;
		com1        = 1'b0;
		seg_data_dp = dp1;
              end
    3'b010 :   begin
		hex_digit   = cnt_d2;
		com2        = 1'b0;
		seg_data_dp = dp2;
              end
    3'b011 :   begin
		hex_digit   = cnt_d3;
		com3        = 1'b0;
		seg_data_dp = dp3;
              end
    3'b100 :   begin
		hex_digit   = cnt_d4;
		com4        = 1'b0;
		seg_data_dp = dp4;
              end
    3'b101 :   begin
		hex_digit   = cnt_d5;
		com5        = 1'b0;
		seg_data_dp = dp5;
              end
    3'b110 :   begin
		hex_digit   = cnt_d6;
		com6        = 1'b0;
		seg_data_dp = dp6;
              end
    3'b111 :   begin
		hex_digit   = cnt_d7;
		com7        = 1'b0;
		seg_data_dp = dp7;
              end
    default : begin
		hex_digit   = cnt_d0;
		com0        = 1'b0;
		seg_data_dp = dp0;
              end
  endcase
end

endmodule
