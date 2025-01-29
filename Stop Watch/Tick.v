module slowtick(
    input clk,
    output reg mclock = 0,
    output reg sclock = 0
    // output reg [22:0]tick1 = 23'b0,
    // output reg [22:0]tick2 = 23'b0
);



reg [22:0]tick1 = 23'b0;
reg [24:0]tick2 = 23'b0;
//0.1sec clock
always @ (posedge clk)
begin
  if (tick1 == 25-1) begin
    tick1 <= 0;
    mclock <= ~mclock;
  end 
  else begin
    tick1 <= tick1 + 1;
  end
end
//1sec clock
always @ (posedge clk)
begin
  if (tick2 == 250-1) begin
    tick2 <= 0;
    sclock <= ~sclock;
  end 
  else begin
    tick2 <= tick2 + 1;
  end
end

endmodule