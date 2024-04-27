`timescale 1ns / 1ns

module tb_Clock_divider;
	reg clock_in;
	wire clock_out;
 Clock_divider dut(
  .clock_in(clock_in), 
  .clock_out(clock_out)
 );
 initial begin
  // Initialize Inputs
  clock_in = 0;
  // create input clock 50MHz
        forever #10 clock_in = ~clock_in;
 end
      
endmodule