`timescale 1 ns/1 ns

module Ex_1(sel1,a, b, c, d, e,sel2, f);
input  a, b, c, d, e, sel2, sel1;
output f;
wire   f;
wire   i, j, k;

assign i = (sel1==1'b0)? a : b;

assign k = d | e;

assign j = c & i;

assign f = (sel2==1'b0) ? j : k;

endmodule
