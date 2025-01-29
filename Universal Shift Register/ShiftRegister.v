module shift(
    input clk,rst,din,
    input [1:0]mode,
    input [15:0]data,
    output reg [15:0]dout

);

always @(posedge clk) begin
    if (rst) begin
        dout <= 16'b0;
    end else begin
        case (mode)
            2'b00 : dout <= dout;
            2'b01 : dout <= {din,dout[15:1]};
            2'b10 : dout <= {dout[14:0],din};
            default: dout <= data;
        endcase
    end
end

    
endmodule