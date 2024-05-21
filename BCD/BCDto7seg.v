module theBCD(bcd,segment);
	input [3:0]bcd;
	output reg [6:0]segment;
	
always @ (bcd)
begin

case(bcd)

	0 : segment = 7'b1111110;
	1 : segment = 7'b0110000;
	2 : segment = 7'b1101101;
	3 : segment = 7'b1111001;
	4 : segment = 7'b0110011;
	5 : segment = 7'b1011011;
	6 : segment = 7'b1011111;
	7 : segment = 7'b1110000;
	8 : segment = 7'b1111111;
	9 : segment = 7'b1111011;
	
endcase
end

endmodule
	
