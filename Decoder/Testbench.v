`timescale 1ns / 1ns

module decoder_tb();

	reg [2:0]data;
	wire [7:0]out;
	
theDecoder dut(
	.data(data),
	.out(out)
	);

initial
begin
	data = 3'b0;
	#10; data = 3'b000;
	#10; data = 3'b001;
	#10; data = 3'b010;
	#10; data = 3'b011;
	#10; data = 3'b100;
	#10; data = 3'b101;
	#10; data = 3'b110;
	#10; data = 3'b111;
end

endmodule