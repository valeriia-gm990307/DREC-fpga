module ro(
input a, b, c, d, 
output do
);
wire aw;
reg [30:0] c_out;
  
lut_input lut_in(a, aw);
lut_output lut_o(~aw, o);
lcell(.in(o), .out(c_out[0]));  /* synthesis keep = 1 */
 
genvar i;
generate for (i = 1;i<31;i=i+1)
	begin : DLINE
		lcell(.in(c_out[i-1]), .out(c_out[i])); /* synthesis keep = 1 */
	end
endgenerate
assign do = c_out[30];
endmodule
