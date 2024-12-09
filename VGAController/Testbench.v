`include "VGA.v"
`timescale 1ns/1ps

module test;

reg clk;
wire hsync;
wire vsync;
wire video;
wire [3:0]red;
wire[3:0]green;
wire[3:0]blue;

vga dut(
    .clk(clk),                   // 100 MHz input clock
    .hsync(hsync),                // Horizontal synchronization signal
    .vsync(vsync),
    .video(video),                // Vertical synchronization signal
    .red(red),            // Red channel
    .green(green),          // Green channel
    .blue(blue)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

//  initial begin
//         // Monitor signals
//         $monitor("Time: %0t | hsync: %b | vsync: %b | red: %h | green: %h | blue: %h |", $time, clk, hsync,vsync,red,green,blue);

//     end

initial begin
    $dumpfile("vga.vcd");
    $dumpvars(0,test);
    #100000 $finish;
end

endmodule