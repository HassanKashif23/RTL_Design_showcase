`include "Stopwatch.v"

module stoptest();

    reg clk,clear,start;
    wire [3:0]sel;
    wire [6:0]sev_seg;

stopwatch dut(
    .clk(clk),
    .start(start),
    .clear(clear),
    .sel(sel),
    .sev_seg(sev_seg)
);

initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

initial begin
    clear = 1'b1;
    start = 1'b0;
    #10;
    clear = 1'b0;
    #10;
    start = 1'b1;
     // Run for 2 seconds
    //#2000000;
        
    // Stop the stopwatch
    // #50 start = 0;
        
    // // Clear and reset
    // #100 clear = 1;
    // #50 clear = 0;
end

initial begin
    $dumpfile("watch.vcd");
    $dumpvars(0,stoptest);
    #5000000 $finish;
end

endmodule