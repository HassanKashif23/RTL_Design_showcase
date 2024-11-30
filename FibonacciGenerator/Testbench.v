`include "Fibonacci.v"
`timescale 1ns / 1ps

module test();

reg clk;
reg rst;
wire [31:0]sequence;

fibonacci dut
(
    .clk(clk),
    .rst(rst),
    .sequence(sequence)
);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    rst = 1'b1;
    #20 rst = 1'b0;

end

  initial
    begin
      $dumpfile("Fibonacci.vcd");
      $dumpvars(0,test);
      #200 $finish;
    end
endmodule