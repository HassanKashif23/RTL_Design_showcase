`timescale 1ns / 1ns
module jk_tb();

	reg j,k,clk;
	wire q,qb;
	
	jkff FF(j,k,clk,q,qb);
	
initial 
begin
	clk = 1'b0;
	forever #5 clk =~clk;
end

initial
begin
	{j,k} = 2'b00; 
	#10;
	j = 1'b0; k = 1'b0;
	#10;
	j = 1'b0; k = 1'b0;
	#10;
	j = 1'b0; k = 1'b1;
	#10;
	j = 1'b1; k = 1'b0;
	#10;
	j = 1'b1; k = 1'b1;	
end

initial
begin
	$monitor("j=%b,k=%b,q=%b,qb=%b",j,k,q,qb);
	#120 $finish;
end
endmodule
