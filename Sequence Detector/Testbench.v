`include "SequenceDetector.v"

module moore_tb;

	reg clk,sequence,rst;
	wire detected;
	
	moorefsm dut
	(
		.clk(clk),
		.rst(rst),
		.sequence(sequence),
		.detected(detected)
	);
	
	initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
	
	initial
	begin
		rst = 1;
		sequence = 0;
		//sequence 0110
		#10 rst = 0;
		#10 sequence = 0;
		#10 sequence = 1;
		#10 sequence = 1;
		#10 sequence = 0;
		// sequence 1100
		#10 sequence = 1;
		#10 sequence = 1;
		#10 sequence = 0;
		#10 sequence = 0;
		//sequence 1011
		#10 sequence = 0;
		#10 sequence = 0;
		#10 sequence = 1;
		#10 sequence = 1;
		// sequence 1100
		#10 sequence = 1;
		#10 sequence = 1;
		#10 sequence = 0;
		#10 sequence = 0;
		
	end
	
initial begin
	$dumpfile("moore.vcd");
	$dumpvars(0,moore_tb);

	#200 $finish;
end
endmodule
	