
module lowpassfilter
    (
    input clk, rst,
    input [15:0]signal,
    output reg [31:0]filtered
);

//Coefficients

wire [15:0] b [0:12]; // Coefficients array

assign b[0]  = 16'b0000000000011010;
assign b[1]  = 16'b0;
assign b[2]  = 16'b0000000001101001;
assign b[3]  = 16'b0000000100101001;
assign b[4]  = 16'b0000001000010110;
assign b[5]  = 16'b0000001011011101;
assign b[6]  = 16'b0000001100101010;
assign b[7]  = 16'b0000001011011101;
assign b[8]  = 16'b0000001011011101;
assign b[9]  = 16'b0000001000010110;
assign b[10] = 16'b0000000100101001;
assign b[11] = 16'b0;
assign b[12] = 16'b0000000000011010;


//Delay lines & Multiplier stage

reg signed [15:0] shift_reg [0:12];          // Shift register for past input samples
reg signed [31:0] accumulator;     // Temporary accumulator
integer i;

always @ (posedge clk or posedge rst)
begin
    if(rst)
    begin
        for(i=0;i<13;i=i+1) begin
            shift_reg[i] <= 0;
        end
        filtered <= 0;
    end
    else begin
        for(i=12;i>0;i=i-1) begin
            shift_reg[i] <= shift_reg[i-1];
        end
        shift_reg[0] <= signal;
        //Acculumation
        accumulator = 32'b0;
        for(i=0;i<13;i=i+1) begin
            accumulator = accumulator + shift_reg[i] * b[i];
        end
        filtered <= accumulator;
    end
end
    
endmodule
