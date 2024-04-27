module N_bit_comp (
    input [3:0] A,
    input [3:0] B,
    output reg O1,
    output reg O2,
    output reg O3
);

always @* begin
    if (A < B) begin
        O1 <= 1;
        O2 <= 0;
        O3 <= 0;
    end
    else if (A > B) begin
        O1 <= 0;
        O2 <= 1;
        O3 <= 0;
    end
    else begin // A == B
        O1 <= 0;
        O2 <= 0;
        O3 <= 1;
    end
end

endmodule
