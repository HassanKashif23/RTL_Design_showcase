module theDecoder(
	input [2:0]data,
	output [7:0]out
	);
	
assign out[0] = (~data[0]&~data[1]&~data[2]);
assign out[1] = (~data[0]&~data[1]&data[2]);
assign out[2] = (~data[0]&data[1]&~data[2]);
assign out[3] = (~data[0]&data[1]&data[2]);
assign out[4] = (data[0]&~data[1]&~data[2]);
assign out[5] = (data[0]&~data[1]&data[2]);
assign out[6] = (data[0]&data[1]&~data[2]);
assign out[7] = (data[0]&data[1]&data[2]);

endmodule
