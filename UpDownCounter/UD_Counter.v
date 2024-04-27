module updowncounter(din,clk,rst,load,ud,count);

	input [3:0] din;
	input clk,rst,ud,load;
	output reg [3:0]count;
	
always @(posedge clk)
begin
	if(rst)
		count <= 0;
	else if (load)
		count <= din;
	else if (ud)
		count <= count + 4'd1;
	else
		count <= count - 4'd1;
end

endmodule
