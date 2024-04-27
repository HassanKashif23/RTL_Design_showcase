`timescale 1ns / 1ns

module count_tb();

	reg button, clk;
	wire alarm;
	wire [9:0] count;
	
	counter ctb(
	.button(button),
	.clk(clk),
	.alarm(alarm),
	.count(count)
	);
	
initial
begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial
begin
		button = 0;
		#10
		button = 1;
		#10
end

endmodule