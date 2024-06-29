module alu_tb;

	reg [7:0] A,B;
	reg [3:0] sel;
	wire carry;
	wire result;
	integer i;

ALU dut(
	.A(A),
	.B(B),
	.sel(sel),
	.result(result),
	.carry(carry)
	);

initial 
begin
	A = 8'b0; B = 8'b0; sel = 0000;
	A = 8'b00110101; B = 8'b11100001;
	
	for(i=0;i<15;i=i+1)
	begin
	sel = i;
	#10;
	end
	
	A = 8'b01110001; B = 8'b10101101;
	
	for(i=0;i<15;i=i+1)
	begin
	sel = i;
	#10;
	end
	
	#20 $finish;
end

endmodule
	