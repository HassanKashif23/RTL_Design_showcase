`timescale 1ns / 1ns

module mux_tb();

	reg a,b,c,d,e,f,g,h;
	reg [2:0]sel;
	wire out;

themux mux(a,b,c,d,e,f,g,h,sel,out);

initial
begin

	a = 1; b = 0; c = 1; d = 0; e = 1; f = 0; g = 1; h = 0; sel = 3'b0;
	#20
	sel = 000;
	#20
	sel = 001;
	#20
	sel = 010;
	#20
	sel = 011;
	#20
	sel = 100;
	#20
	sel = 101;
	#20
	sel = 110;
	#20
	sel = 111;
end

endmodule