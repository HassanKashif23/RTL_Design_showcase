`timescale 1ns / 1ns

module encoder_tb();

	reg [7:0]data;
	wire [2:0]out;
	
theEncoder dut(
	.data(data),
	.out(out)
	);

initial
begin
	data = 8'b0;
	#10; data = 8'b00000001;
	#10; data = 8'b00000010;
	#10; data = 8'b00000100;
	#10; data = 8'b00001000;
	#10; data = 8'b00010000;
	#10; data = 8'b00100000;
	#10; data = 8'b01000000;
	#10; data = 8'b10000000;
end

endmodule