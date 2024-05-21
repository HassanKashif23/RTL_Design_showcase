`timescale 1ns / 1ns

module bcd_tb();

	reg [3:0]bcd;
	wire [6:0]segment;

theBCD dut(bcd,segment);

initial
begin

	bcd = 4'b0;
	#20
	bcd = 4'b0001;
	#20
	bcd = 4'b0010;
	#20
	bcd = 4'b0011;
	#20
	bcd = 4'b0100;
	#20
	bcd = 4'b0101;
	#20
	bcd = 4'b0110;
	#20
	bcd = 4'b0111;
	#20
	bcd = 4'b1000;
	#20
	bcd = 4'b1001;
end

endmodule