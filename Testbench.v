`timescale 1ns / 1ns
module fa_tb;
	wire [3:0]sum;
	wire cout;
	
	fourbitadder FA(
	.a(a),
	.b(b),
	.cin(cin),
	.sum(sum),
	.cout(cout)
	);
	
	initial
	begin
		a=0; b=0; cin=0;
		#10 a=1; b=0; cin=0;
		#10 a=0; b=1; cin=0;
		#10 a=0; b=0; cin=1;
		#10 a=1; b=1; cin=0;
		#10 a=0; b=1; cin=1;
		#10 a=1; b=1; cin=1;		
		
	end
	
	initial
	begin
		$monitor ( $time, "a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
		#100 $finish;
	end
endmodule