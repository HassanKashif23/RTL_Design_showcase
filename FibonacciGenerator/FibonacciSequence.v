module fibGen
(
    input  clk,rst,
    output reg [31:0]sequence
);

reg [31:0]num1,num2;

always @ (posedge clk)
begin
  
  if(rst)
  begin
  num1 <= 0;
  num2 <= 1;
  sequence <= 0;
  end
  else begin
  num1 <= num2;
  num2 <= num1 + num2;
  sequence <= num2;
  end
end
endmodule 
