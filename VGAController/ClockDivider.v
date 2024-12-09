module clock_divider(
    input clock,
    output reg div_clock = 0
);

reg [1:0] counter = 0;

always @ (posedge clock)
begin
  if (counter == 2'd3)
  begin
    counter <= 0;
    div_clock <= ~div_clock;
  end
  else begin
    counter <= counter + 1;
  end

end
    
endmodule