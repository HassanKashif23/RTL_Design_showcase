module mem_tb;
	
	parameter data_width = 64;
	parameter address_width = 8;
	
	reg [data_width-1:0] write_data_A, write_data_B;
	reg [addreses_width-1:0] read_address_A,write_address_A,read_address_B,write_address_B;
	reg read_A,write_A,clk,read_B,write_B;
	wire [data_width-1:0] read_data_A,read_data_B;
	
	memory#(
		.data_width(data_width),
		.address_width(address_width)
		)
		dut(
		.write_A(write_A),
		.write_B(write_B),
		.write_address_A(write_address_A),
		.write_address_B(write_address_B),
		.write_data_A(write_data_A),
		.write_data_B,
		.read_A(read_A),
		.read_B(read_B),
		.read_address_A(read_address_A),
		.read_address_B(read_address_B),
		.read_data_A(read_data_A),
		.read_data_B(read_data_B),
		.clk(clk)
		);
		
	initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
	
	initial
	begin
		clk = 0;
        read_A = 0;
        write_A = 0;
        read_B = 0;
        write_B = 0;
        write_data_A = 0;
        write_data_B = 0;
        read_address_A = 0;
        write_address_A = 0;
        read_address_B = 0;
        write_address_B = 0;
	end
	
	initial
	begin
	#10 write_A = 1; write_address_A = 8'h7C; write_data_A = 64'h112210F4B16C1CB1;
	#10 write_A = 0;
	
	#10 write_B = 1; write_address_B = 8'h7D; write_data_B = 64'h1123104F4C16D1CB1;
	#10 write_B = 0;
	
	#10 read_A = 1; read_address_A = 8'h7C;
	#10 read_A = 0;
	
	#10 read_A = 1; read_address_B = 8'h7D;
	#10 read_B = 0;
	
	#10 write_data_A = 64'h123456789ABCDEF0; write_address_A = 8'h03; write_A = 1;
    #10 read_address_B = 8'h03; read_B = 1;
    #10 write_A = 0; read_B = 0;
	
	#20 $finish;
	
	end
	
	initial begin
        $monitor("Time: %0t | read_data_A: %h | read_data_B: %h", $time, read_data_A, read_data_B);
    end
	
	endmodule