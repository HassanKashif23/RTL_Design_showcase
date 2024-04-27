`timescale 1ns / 1ns

module UDC_tb();

	reg [3:0] din;
	reg clk,rst,ud,load;
	wire [3:0]count;

updowncounter UDC(din,clk,rst,load,ud,count);

initial
begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial
begin
	rst = 0;
	load = 0;
	ud = 0;
	din = 4'd0;
	#10;
end

initial
begin 
	{rst,load,ud} = 3'b100; din = 4'd3; #10;
	{rst,load,ud} = 3'b010; din = 4'd4; #10;
	{rst,load,ud} = 3'b001; din = 4'd5; #10;
	{rst,load,ud} = 3'b001; din = 4'd0; #10;
	{rst,load,ud} = 3'b001; din = 4'd0; #10;
	{rst,load,ud} = 3'b001; din = 4'd0; #10;
	{rst,load,ud} = 3'b001; din = 4'd0; #10;
	{rst,load,ud} = 3'b001; din = 4'd0; #10;
	{rst,load,ud} = 3'b000; din = 4'd9; #10;
	{rst,load,ud} = 3'b011; din = 4'd9; #10;
	{rst,load,ud} = 3'b100; din = 4'd9; #10;
	{rst,load,ud} = 3'b010; din = 4'd1; #10;
end

endmodule