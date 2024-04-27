`timescale 1ns / 1ns

module comp_tb();

reg [3:0]A;
reg [3:0]B;
wire O1,O2,O3;

N_bit_comp NBC(

.A(A),
.B(B),
.O1(O1),
.O2(O2),
.O3(O3)
);

initial
begin

A = 4'b0000; B = 4'b0000;
#20;
A = 4'b0001; B = 4'b0000;
#20;
A = 4'b0010; B = 4'b0000;
#20;
A = 4'b0100; B = 4'b0000;
#20;
A = 4'b1000; B = 4'b0000;
#20;
A = 4'b0000; B = 4'b0001;
#20;
A = 4'b0000; B = 4'b0010;
#20;
A = 4'b0000; B = 4'b0100;
#20;
A = 4'b0000; B = 4'b1000;
#20;
A = 4'b1100; B = 4'b1100;
#20;
A = 4'b0110; B = 4'b0110;
#20;
A = 4'b1111; B = 4'b1111;
end

endmodule