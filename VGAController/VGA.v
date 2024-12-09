`include "ClockDivider.v"
`include "HorizontalController.v"
`include "VerticalController.v"
`include "Synchronizer.v"
`include "PixelGenerator.v"

module vga
(
    input clk,                   // 100 MHz input clock
    output hsync,                // Horizontal synchronization signal
    output vsync, 
    output video,               // Vertical synchronization signal
    output [3:0] red,            // Red channel
    output [3:0] green,          // Green channel
    output [3:0] blue            // Blue channel
);

wire div_clock;
wire ven;
wire [15:0]hor_count;
wire [15:0]ver_count;
wire [15:0]x;
wire [15:0]y;

clock_divider cd(
    .clock(clk),            //from the main clock
    .div_clock(div_clock)            //25Mhz clock to modules
);

horizontal hc(
    .clk(div_clock),       //from the clock divider
    .ven(ven),          //to the vertical counter
    .hcount(hor_count)       //to the synchronizer
);

vertical vc(
    .clk(div_clock),       //from the clock divider
    .ven(ven),          //from horizontal counter
    .vcount(ver_count)        //to the synchronizer
);

synchronize s(
    .hcount(hor_count),            //from horizontal controller
    .vcount(ver_count),            //from vertical controller
    .hsync(hsync),      
    .vsync(vsync),   
    .x_loc(x),          //to the pixel generator
    .y_loc(y),            //to the pixel generator
    .video(video)       //to the pixel generator
);

pixelgenerator pg(
    .clk(div_clock),       //from the clock divider
    .video(video),      //from the synchronizer
    .xpixel(x),        //from the synchronizer
    .ypixel(y),        //from the synchronizer
    .red(red),            
    .green(green),
    .blue(blue)
);

endmodule
