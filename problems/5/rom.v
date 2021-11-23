module rom_mem(
input [3:0] addr,
input clk,
input rd_en,
output [15:0] data);

(* ramstyle = "M9K" *) reg [15:0] rom [15:0]; 
assign data = rd_en ? rom[addr] : 16'h0;
initial
begin
	$readmemh("memo.txt", rom);
end

endmodule
