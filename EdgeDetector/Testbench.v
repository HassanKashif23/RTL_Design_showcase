`timescale 1ns / 1ns

module ed_tb();

	reg clk,sig;
	wire pulse;
	
edgedetector ed(sig,clk,pulse);

initial
begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial
begin
	sig = 0;
	clk = 0;
	#10; sig = 0;
	#10; sig = 1;
	#10; sig = 1;
	#10; sig = 0;
	#10; sig = 0;
	#10; sig = 1;
end

endmodule