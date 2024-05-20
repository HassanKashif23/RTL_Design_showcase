module thedemux(in,sel,a,b,c,d,e,f,g,h);

input in;
input [2:0]sel;
output reg a,b,c,d,e,f,g,h;

always @ (*)
begin

case(sel)

	3'b000 : {a,b,c,d,e,f,g,h} = {in,7'b0};
	3'b001 : {a,b,c,d,e,f,g,h} = {0,in,6'b0};
	3'b010 : {a,b,c,d,e,f,g,h} = {2'b0,in,5'b0};
	3'b011 : {a,b,c,d,e,f,g,h} = {3'b0,in,4'b0};
	3'b100 : {a,b,c,d,e,f,g,h} = {4'b0,in,3'b0};
	3'b101 : {a,b,c,d,e,f,g,h} = {5'b0,in,2'b0};
	3'b110 : {a,b,c,d,e,f,g,h} = {6'b0,in,0};
	3'b111 : {a,b,c,d,e,f,g,h} = {7'b0,in};

endcase
end
endmodule
