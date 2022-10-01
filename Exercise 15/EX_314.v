`timescale 1 ns/1 ns

module EX_314_multiply_and_accumulate(clk, reset, a, b, acc_out);
input		clk, reset;
input	[15:0]	a, b;
output	[15:0]	acc_out;
wire	[15:0]	acc_out;

reg	[15:0]	a_reg, b_reg;
reg	[15:0]	mul_reg, acc_reg;

assign acc_out =  acc_reg;

always @(posedge clk or negedge reset)
begin
  if (!reset) begin
    a_reg <= #1 16'h0000;
    b_reg <= #1 16'h0000;
	mul_reg <=#1 16'h0000;
	acc_reg <=#1 16'h0000;
	
  end
  else begin
    a_reg <= #1 a;
    b_reg <= #1 b;
	mul_reg <= #1 a_reg * b_reg;
	acc_reg <= #1 acc_reg + mul_reg;
	
	
  end
end

endmodule
