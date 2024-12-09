module vertical
(
    input clk,       //from the clock divider
    input ven,          //from horizontal controller to enable the vertical controller
    output reg [15:0]vcount = 0       //the vertical line counter
);

always @ (posedge clk)
begin
    if(ven)          //start counting when ven is enabled
    begin
        if(vcount < 524) begin        //total pixel lines 525
        vcount <= vcount + 1;
        end
        else begin
        vcount <= 0;       //reset the counter
        end
    end
end

endmodule