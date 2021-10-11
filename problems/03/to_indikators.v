module to_indikators(
input [7:0] data_indikators,
input sclk, reset,
output reg [3:0] indikators,
output reg [6:0] segments);


reg [17:0] cnt;
reg [1:0] c; //регистр указателя номера семисегментного индикатора
always @(posedge sclk)
begin
	if (!reset)
	begin
		cnt <= 0;
		c <= 2'b00;
	end
	else
	begin
		if (cnt == 18'b110000110101000000)
		begin
			cnt <= 0;
			if (c == 2'b11)
			begin
				c <= 2'b00;
			end
			else
		
				c <= c + 1'b1;
		
		end
		else
			cnt <= cnt + 1;
	end
end

always @(posedge sclk)
begin
	if (c == 2'b00) 
	begin
		indikators <= 4'b0111;
		case (data_indikators[7:4])
		4'h0: segments <= 7'b1111110;//0000001;
		4'h1: segments <= 7'b0110000;//1001111;
		4'h2: segments <= 7'b1101101;//0010010;
		4'h3: segments <= 7'b1111001;//0000110;
		4'h4: segments <= 7'b0110011;//1001100;
		4'h5: segments <= 7'b1011011;//0100100;
		4'h6: segments <= 7'b1011111;//0100000;
		4'h7: segments <= 7'b1110000;//0001111;
		4'h8: segments <= 7'b1111111;//0000000;
		4'h9: segments <= 7'b1111011;//0000100;
		4'hA: segments <= 7'b1110111;//0001000;
		4'hB: segments <= 7'b0011111;//1100000;
		4'hC: segments <= 7'b1001110;//0110001;
		4'hD: segments <= 7'b0111101;//1000010;
		4'hE: segments <= 7'b1001111;//0110000;
		4'hF: segments <= 7'b1000111;//0111000;
		default: segments <= 7'b1111110;//0000001;
		endcase 
	end 
	if (c == 2'b01)  
	begin
		indikators <= 4'b1011;
		case (data_indikators[3:0])
		4'h0: segments <= 7'b1111110;//0000001;
		4'h1: segments <= 7'b0110000;//1001111;
		4'h2: segments <= 7'b1101101;//0010010;
		4'h3: segments <= 7'b1111001;//0000110;
		4'h4: segments <= 7'b0110011;//1001100;
		4'h5: segments <= 7'b1011011;//0100100;
		4'h6: segments <= 7'b1011111;//0100000;
		4'h7: segments <= 7'b1110000;//0001111;
		4'h8: segments <= 7'b1111111;//0000000;
		4'h9: segments <= 7'b1111011;//0000100;
		4'hA: segments <= 7'b1110111;//0001000;
		4'hB: segments <= 7'b0011111;//1100000;
		4'hC: segments <= 7'b1001110;//0110001;
		4'hD: segments <= 7'b0111101;//1000010;
		4'hE: segments <= 7'b1001111;//0110000;
		4'hF: segments <= 7'b1000111;//0111000;
		default: segments <= 7'b1111110;//0000001;
		endcase 
	end
	if (c == 2'b10)
	begin
		indikators <= 4'b1101;
		
		segments <= 7'b1111110;//0000001;
		 
	end
	if (c == 2'b11)
	begin
		indikators <= 4'b1110;
		
		segments <= 7'b1111110;//0000001;
		
	end
end
endmodule
