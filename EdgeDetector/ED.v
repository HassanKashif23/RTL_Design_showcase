module edgedetector(sig,clk,pulse);

	input sig,clk;
	output pulse;
	reg delay;
	
always @ (posedge clk)
begin
	delay <= sig;
end
	assign pulse = sig ^ delay;

endmodule
