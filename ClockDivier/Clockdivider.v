module Clock_divider
(
	input clock_in,
	output reg clock_out
);

reg [27:0] counter = 28'd0;
parameter divisor = 28'd2;

always @(posedge clock_in) begin
        if (counter == (divisor - 1)) begin
            counter <= 28'd0;
            clock_out <= ~clock_out;
        end else begin
            counter <= counter + 1;
        end
end
initial 
begin
	clock_out = 0;
end

endmodule
