`timescale 1 ns/1 ns

module EX_313_pipeline(reset, clk, a, b, c, g);
input		reset, clk;
input	[7:0]	a, b ,c;
output 	[15:0]	g;
reg	[15:0]	g;

reg	[15:0] 	d1, d3, d4;
reg [7:0]   d2;

always@(posedge clk or negedge reset)
begin
  if(!reset) begin
    d1 <= #1 16'h0000;
    d2 <= #1 8'h00;
    d3 <= #1 16'h0000;
    d4 <= #1 16'h0000;
  end
  else begin
    d1 <= #1 {8'h00,a} * {8'h00,b};
    d2 <= #1 c;
    d3 <= #1 {8'h00,d2} + d1;
    d4 <= #1 d3 + 16'h004e;
	g <= #1 d4;
  end
end

endmodule
