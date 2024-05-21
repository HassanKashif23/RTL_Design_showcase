module thePriorityEncoder(
	input [7:0]data,
	output reg[2:0]out
	);
	
always@(data)
begin
if(data[7]==1)
out=3'b111;
else if(data[6]==1)
out=3'b110;
else if(data[5]==1)
out=3'b101;
else if(data[4]==1)
out=3'b100;
else if(data[3]==1)
out=3'b011;
else if(data[2]==1)
out=3'b010;
else if(data[1]==1)
out=3'b001;
else 
out=3'b000;
end

endmodule
