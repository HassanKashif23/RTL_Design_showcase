module counters(
    input mclock,sclock,start,clear,
    output [3:0]d1,d2,d3,d4
);
    reg [3:0]millisec = 4'b0;
    reg [3:0]onesec = 4'b0;
    reg [3:0]tensec = 4'b0;
    reg [3:0]min = 4'b0;
    reg onestick = 0,tenstick = 0,mintick = 0;

// Milli Sec Counter mod 10
always @(posedge mclock) begin
    if (clear) begin
        millisec <= 4'b0;
        onestick <= 0;
    end else if (start) begin
            if (millisec == 9) begin
                millisec <= 4'b0;
                onestick <= 1;
            end else begin
                millisec <= millisec + 4'b1;
            end
        end
end
// One Sec Counter mod 10
always @(sclock) begin
    if (clear) begin
        onesec <= 4'b0;
        tenstick <= 0;
    end else if (start) begin
        if (onestick) begin
            if (onesec == 9) begin
                onesec <= 4'b0;
                tenstick <= 1;
            end else begin
                onesec <= onesec + 4'b1;
            end
            onestick <= 0;
        end
    end
end
// Ten Sec Counter mod 10
always @(sclock) begin
    if (clear) begin
        tensec <= 4'b0;
        mintick <= 0;
    end else if (start) begin
        if (tenstick) begin
            if (tensec == 5) begin
                tensec <= 4'b0;
                mintick <= 1;
            end else begin
                tensec <= tensec + 4'b1;
            end
            tenstick <= 0;
        end
    end
end
// Min Counter mod 10
always @(sclock) begin
    if (clear) begin
        min <= 4'b0;
    end else if (mintick) begin
        if (start) begin
            if (min == 9) begin
                min <= 4'b0;
            end else begin
                min <= min + 4'b1;
            end
            mintick <= 0;
        end
    end
end

assign d4 = millisec;
assign d3 = onesec;
assign d2 = tensec;
assign d1 = min;

endmodule 





