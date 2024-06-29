module ALU(
	input [7:0] A,B,
	input [3:0] sel,
	output reg [7:0] result,
	output reg carry
	);

always @ (*)
begin
	case(sel)
	
	//Arithmatic
	0000 : {carry,result} = A + B;
	0001 : {carry,result} = A - B;
	0010 : result = A * B;
	0011 : result = A / B;
	//Bitwise
	0100 : result = A >> B;
	0101 : result = A << B;
	0110 : result = {A[6:0],A[7]};
	0111 : result = {B[0],B[7:1]};
	//Comparision
	1000 : result = (A > B)?8'd1:8'd0;
	1001 : result = (A < B)?8'd1:8'd0;
	//Logical
	1010 : result = (A & B);
	1011 : result = ~(A & B);
	1100 : result = (A | B);
	1101 : result = ~(A | B);
	1110 : result = (A ^ B);
	1111 : result = ~(A ^ B);
	
	endcase
end

endmodule
