`include "VendingMachine.v"

module mealy_tb;

    reg clk, rst;
    reg [1:0] coin;  // Coin inputs: 00 - No Coin, 01 - 5 Rs, 10 - 10 Rs, 11 - Wrong Coin
    wire J;          // Juice dispensed
    wire R;          // Reject wrong coin
    wire N;          // No Juice

    // Instantiate the vending machine module
    mealyfsm dut (
        .clk(clk),
        .rst(rst),
        .coin(coin),
        .J(J),
        .R(R),
        .N(N)
    );

    // Clock generation
    initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        coin = 2'b00;

        // Apply reset
        #10 rst = 0;

        // Test Sequence 1: Insert 5 Rs, then 10 Rs (Total 15 Rs -> Dispense Juice)
        #10 coin = 2'b01;  // Insert 5 Rs
        #10 coin = 2'b10;  // Insert 10 Rs
        #10 coin = 2'b00;  // No coin, wait

        // Test Sequence 2: Insert 10 Rs, then 5 Rs (Total 15 Rs -> Dispense Juice)
        #10 coin = 2'b10;  // Insert 10 Rs
        #10 coin = 2'b01;  // Insert 5 Rs
        #10 coin = 2'b00;  // No coin, wait

        // Test Sequence 3: Insert Wrong Coin
        #10 coin = 2'b11;  // Insert wrong coin
        #10 coin = 2'b00;  // No coin, wait

        // Test Sequence 4: Insert 5 Rs, 5 Rs (Should not dispense juice)
        #10 coin = 2'b01;  // Insert 5 Rs
        #10 coin = 2'b01;  // Insert another 5 Rs
        #10 coin = 2'b00;  // No coin, wait

        // Test Sequence 5: Insert 10 Rs, 10 Rs (Should dispense juice and stay in the same state)
        #10 coin = 2'b10;  // Insert 10 Rs
        #10 coin = 2'b10;  // Insert another 10 Rs
        #10 coin = 2'b00;  // No coin, wait

        // Finish simulation
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | coin=%b | Juice=%b | Reject=%b | No Juice=%b", $time, coin, J, R, N);
    end

    initial begin
	$dumpfile("mealy.vcd");
	$dumpvars(0,mealy_tb);

	#200 $finish;
end

endmodule
