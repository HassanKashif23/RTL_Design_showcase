`timescale 1ns / 1ns

module demux_tb();

reg in;
reg [2:0]sel;
wire a,b,c,d,e,f,g,h;

thedemux mux(in,sel,a,b,c,d,e,f,g,h);

initial
begin

	in = 1;
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