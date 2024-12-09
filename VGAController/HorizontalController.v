module horizontal
(
    input clk,       //from the clock divider
    output reg ven,          //it will enable the vertical controller
    output reg [15:0]hcount = 0       //the horizpntal line counter
);

always @ (posedge clk)
begin
    if(hcount < 799) begin             //total pixel lines 800
    hcount <= hcount + 1;
    ven <= 0;
    end
    else begin
    hcount <= 0;           //reset the counter
    ven <= 1;            // enable the vertical controller
    end
end

endmodule