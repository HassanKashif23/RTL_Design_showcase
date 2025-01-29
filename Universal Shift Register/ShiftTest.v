`include "ShiftRegister.v"

module shift_tb;
    reg clk,rst,din;
    reg [1:0]mode;
    reg [15:0]data;
    wire [15:0]dout;


shift dut(
    .clk(clk),
    .rst(rst),
    .din(din),
    .mode(mode),
    .data(data),
    .dout(dout)
);

initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

initial begin
    //initializing signals
    rst = 1'b1;
    mode = 2'b00;
    din = 1'b0;
    data = 16'b1100110011001100;
    #20 rst = 1'b0;
    //parallel load
    mode = 2'b11;
    data = 16'b1100111111000000;
    #20;
    //hold
    mode = 2'b00;
    #20;
    //right shift
    mode = 2'b01;
    din = 1'b1;
    #20;
    din = 1'b0;
    #20;
    //left shift
    mode = 2'b10;
    din = 1'b0;
    #20;
    din = 1'b1;
    #20;
end

initial begin
    $dumpfile("shift.vcd");
    $dumpvars(0,shift_tb);
    #200 $finish;
end


endmodule