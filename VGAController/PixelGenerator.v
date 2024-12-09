module pixelgenerator
(
    input clk,
    input video,
    input [15:0]xpixel,
    input [15:0]ypixel,
    output reg [3:0]red,
    output reg [3:0]green,
    output reg [3:0]blue
);

parameter H_display = 640;
parameter V_display = 480;

always @ (posedge clk)
begin
    if(video)
    begin
        if((xpixel == 0) || (ypixel == 0) || (xpixel == H_display-1) || (ypixel == V_display-1))
        begin
            //black color
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
        end
        else if (xpixel > 0 && xpixel < 200) begin
            //red color
            red <= 4'h1;
            green <= 4'h0;
            blue <= 4'h0;
        end
        else if ((xpixel > 200) && (xpixel < 400)) begin
            //green color
            red <= 4'h0;
            green <= 4'h1;
            blue <= 4'h0;
        end
        else if((xpixel > 400) && (xpixel < H_display-1)) begin
            //blue color
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h1;
        end
            
    end
    else 
    begin
        // Default color (off-screen or inactive video signal)
        red <= 4'h1;
        green <= 4'h1;
        blue <= 4'h1;
    end
end

endmodule