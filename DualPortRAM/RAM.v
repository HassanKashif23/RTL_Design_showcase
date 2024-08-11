module memory#(
	parameter data_width=64,
	parameter address_width=8
)
(
	input [data_width-1:0] write_data_A, write_data_B,
	input [address_width-1:0] read_address_A,write_address_A,read_address_B,write_address_B,
	input read_A,write_A,clk,read_B,write_B,
	output reg [data_width-1:0] read_data_A,read_data_B
	
);

	reg [data_width-1:0] mem [255:0];
	
	always @ (posedge clk)
	begin
		if(write_A)
		begin
		mem [write_address_A] <= write_data_A;
		end
		if (read_A)
		begin
		read_data_A <= mem[read_address_A];
		end
	end
	
	always @ (posedge clk)
	begin
		if(write_B)
		begin
		mem [write_address_B] <= write_data_B;
		end
		if (read_B)
		begin
		read_data_B <= mem[read_address_B];
		end
	end
	
endmodule
