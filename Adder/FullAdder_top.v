module fourbitadder
(
	input [3:0]a,
	input [3:0]b,
	input cin,
	output reg [3:0]sum,
	output reg cout
);

assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);

endmodule