module timemux(
    input clk,rst,
    input [6:0]d1,d2,d3,d4,
    output reg [3:0]en,
    output reg [6:0]seg
);

reg [17:0] counter;

always @ (posedge clk)
begin
    if(rst)
        counter <= 0;
    else
        counter <= counter + 1;
end

always @(*) begin
    case(counter[17:16])
    2'b00 : 
        begin
            en <= 4'b1110;
            seg <= d1;
        end
    2'b01 : 
        begin
            en <= 4'b1101;
            seg <= d2;
        end
    2'b10 : 
        begin
            en <= 4'b1011;
            seg <= d3;
        end
    2'b11 : 
        begin
            en <= 4'b0111;
            seg <= d4;
        end
    endcase
end
    
endmodule

/*
module seven_segment_display (
    input logic clk,            // System clock
    input logic rst,            // Reset signal
    input logic [15:0] number,  // 4-digit BCD number input
    output logic [7:0] segments,// Segments (A to G + DP)
    output logic [3:0] anodes   // Display enable (active LOW)
);

    // 7-segment encoding for digits 0-9 (Common Cathode)
    logic [7:0] segment_lut [0:9] = '{
        8'b11000000, // 0
        8'b11111001, // 1
        8'b10100100, // 2
        8'b10110000, // 3
        8'b10011001, // 4
        8'b10010010, // 5
        8'b10000010, // 6
        8'b11111000, // 7
        8'b10000000, // 8
        8'b10010000  // 9
    };

    logic [1:0] digit_select; // Multiplexer for digits (0 to 3)
    logic [3:0] current_digit;// Holds the BCD value for the active digit

    // Clock divider to slow down multiplexing (assuming 50MHz input)
    logic [15:0] clk_div;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) clk_div <= 0;
        else clk_div <= clk_div + 1;
    end

    // Select digit every few milliseconds
    always_ff @(posedge clk_div[15] or posedge rst) begin
        if (rst) digit_select <= 0;
        else digit_select <= digit_select + 1;
    end

    // Select current BCD digit from input number
    always_comb begin
        case (digit_select)
            2'b00: current_digit = number[3:0];   // Least significant digit
            2'b01: current_digit = number[7:4];
            2'b10: current_digit = number[11:8];
            2'b11: current_digit = number[15:12];// Most significant digit
            default: current_digit = 4'b0000;
        endcase
    end

    // Assign segment pattern from lookup table
    assign segments = segment_lut[current_digit];

    // Activate only one anode at a time
    always_comb begin
        anodes = 4'b1111;  // Default all OFF (active LOW)
        anodes[digit_select] = 0; // Turn ON the active digit
    end

endmodule

*/