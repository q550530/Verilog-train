`timescale 1 ns/1 ns

module timer(reset, clk, one_sec, cnt_d0, cnt_d1, cnt_d2, cnt_d3, cnt_d4, cnt_d5, cnt_d6, cnt_d7);
input		reset, clk, one_sec;
output	[3:0] 	cnt_d0, cnt_d1, cnt_d2, cnt_d3, cnt_d4, cnt_d5, cnt_d6, cnt_d7;
wire	[3:0] 	cnt_d0, cnt_d1, cnt_d2, cnt_d3, cnt_d4, cnt_d5, cnt_d6, cnt_d7;

reg	[3:0] 	cnt_d0_reg, cnt_d1_reg, cnt_d2_reg, cnt_d3_reg, cnt_d4_reg, cnt_d5_reg, cnt_d6_reg, cnt_d7_reg;

assign	cnt_d0 = cnt_d0_reg;
assign	cnt_d1 = cnt_d1_reg;
assign	cnt_d2 = cnt_d2_reg;
assign	cnt_d3 = cnt_d3_reg;
assign	cnt_d4 = cnt_d4_reg;
assign	cnt_d5 = cnt_d5_reg;
assign	cnt_d6 = cnt_d6_reg;
assign	cnt_d7 = cnt_d7_reg;

always@(posedge clk or negedge reset)
begin
  if(!reset) begin
    cnt_d0_reg <= #1 4'h0;
    cnt_d1_reg <= #1 4'h0;
    cnt_d2_reg <= #1 4'h0;
    cnt_d3_reg <= #1 4'h0;
	cnt_d4_reg <= #1 4'h0;
    cnt_d5_reg <= #1 4'h0;
    cnt_d6_reg <= #1 4'h0;
    cnt_d7_reg <= #1 4'h0;
  end
  else
    if (one_sec == 1'b1)
      if (cnt_d0_reg == 4'b1001) begin
        cnt_d0_reg <= #1 4'b0000;
        if (cnt_d1_reg == 4'b1001) begin
          cnt_d1_reg <= #1 4'b0000;
          if (cnt_d2_reg == 4'b1001) begin
            cnt_d2_reg <= #1 4'b0000;
            if (cnt_d3_reg == 4'b1001) begin
              cnt_d3_reg <= #1 4'b0000;
			  if (cnt_d4_reg == 4'b1001) begin
               cnt_d4_reg <= #1 4'b0000;
				  if (cnt_d5_reg == 4'b1001) begin
				   cnt_d5_reg <= #1 4'b0000;
					  if (cnt_d6_reg == 4'b1001) begin
					   cnt_d6_reg <= #1 4'b0000;
						  if (cnt_d7_reg == 4'b1001) begin
						   cnt_d7_reg <= #1 4'b0000;
						   end  
						  else
							cnt_d7_reg <= #1 cnt_d7_reg + 4'b0001;
					  end  
					  else
						cnt_d6_reg <= #1 cnt_d6_reg + 4'b0001;
				  end  
				  else
					cnt_d5_reg <= #1 cnt_d5_reg + 4'b0001;
			  end  
			  else
			    cnt_d4_reg <= #1 cnt_d4_reg + 4'b0001;
			end  
            else
              cnt_d3_reg <= #1 cnt_d3_reg + 4'b0001;
          end
          else
            cnt_d2_reg <= #1 cnt_d2_reg + 4'b0001;
        end
        else
          cnt_d1_reg <= #1 cnt_d1_reg + 4'b0001;
      end
      else
        cnt_d0_reg <= #1 cnt_d0_reg + 4'b0001;
end

endmodule
