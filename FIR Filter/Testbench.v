`include "FIR.v"
module test;

reg clk,rst;
reg [15:0] signal;
wire [31:0] filtered;

lowpassfilter fir
(
    .clk(clk),
    .rst(rst),
    .signal(signal),
    .filtered(filtered)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    signal = 0;
        // Apply reset
    #20;
    rst = 0;

    // Apply test signal
    #10 signal = 16'd3105 ;
    #10 signal = 16'd3155;
    #10 signal = 16'd3123;
    #10 signal = 16'd3009;
    #10 signal = 16'd2953;
    #10 signal = 16'd2735;
    #10 signal = 16'd2454 ;
    #10 signal = 16'd2131;
    #10 signal = 16'd1903;
    #10 signal = 16'd1453;
    #10 signal = 16'd1047;
    #10 signal = 16'd790;
    #10 signal = 16'd370;
    #10 signal = 16'd207;
    #10 signal = 16'd128;
    #10 signal = 16'd111;
    #10 signal = 16'd137;
    #10 signal = 16'd175;
    #10 signal = 16'd250;
    #10 signal = 16'd355;
    #10 signal = 16'd697;
    #10 signal = 16'd1121;
    #10 signal = 16'd1212;
    #10 signal = 16'd1529;
    #10 signal = 16'd1571;
    #10 signal = 16'd1632;
    #10 signal = 16'd1551;
    #10 signal = 16'd1468;
    #10 signal = 16'd1456;
    #10 signal = 16'd1392;
    #10 signal = 16'd1241;
    #10 signal = 16'd1024;
    #10 signal = 16'd1000;
    #10 signal = 16'd927;
    #10 signal = 16'd780;
    #10 signal = 16'd570;
    #10 signal = 16'd324;
    #10 signal = 16'd213;
    #10 signal = 16'd111;
    #10 signal = 16'd60;
    #10 signal = 16'd45;
    #10 signal = 16'd31;
    #10 signal = 16'd17;
    #10 signal = 16'd10;
    #10 signal = 16'd5;
    #10 signal = 16'd1;
    #10 signal = 16'd1;
    #10 signal = 16'd1;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd0;
    #10 signal = 16'd3;
    #10 signal = 16'd6;
    #10 signal = 16'd12;
    #10 signal = 16'd24;
    #10 signal = 16'd48;
    #10 signal = 16'd39;
    #10 signal = 16'd90;
    #10 signal = 16'd70;
    #10 signal = 16'd381;
    #10 signal = 16'd302;
    #10 signal = 16'd284;
    #10 signal = 16'd759;
    #10 signal = 16'd671;
    #10 signal = 16'd657;
    #10 signal = 16'd627;
    #10 signal = 16'd648;
    #10 signal = 16'd693;
    #10 signal = 16'd765;
    #10 signal = 16'd300;
    #10 signal = 16'd39;
    
end

initial begin
    $dumpfile("fir.vcd");
    $dumpvars(0,test);
    #1000 $finish;
end

endmodule