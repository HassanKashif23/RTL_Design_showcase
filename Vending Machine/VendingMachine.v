module mealyfsm(
    input clk,rst,
    input [1:0]coin, //  00 = 5rs , 01 = 10rs , 10 = bad coin
    output reg J,N,R
);

// state encoding
    parameter s1 = 2'b00;
    parameter s2 = 2'b01;
    parameter s3 = 2'b10;

    reg [1:0]present_state,next_state;

// present state logic

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            present_state <= s1;
        end else begin
            present_state <= next_state;
        end
    end

// next state logic

always @(*) begin
    J = 0;
    R = 0;
    N = 0;
    case (present_state)
        s1 : begin
          case (coin)
            2'b00 : begin
              next_state = s2;     // 5rs inserted
              N = 1;
              end
            2'b01 : begin
              next_state = s3;     // 10rs inserted
              N = 1;
              end
            2'b10 : begin
              next_state = s1;     // bad coin inserted
              R = 1;
            end
            default : next_state = s1;
          endcase
        end
        s2 : begin
          case (coin)
            2'b00 : begin
              next_state = s3;     // 5rs inserted
              N = 1;
              end
            2'b01 : begin
              next_state = s1;    // 10rs inserted
              J = 1;
            end
            2'b10 : begin
              next_state = s2;     // bad coin inserted
              R = 1;
            end
            default : next_state = s2;
          endcase
        end
        s3 : begin
          case (coin)
            2'b00 : begin
              next_state = s1;      // 5rs inserted
              J = 1;
            end
            2'b01 : begin
              next_state = s2;      // 10rs inserted
              J = 1;
            end
            2'b10 : begin
              next_state = s3;     // bad coin inserted
              R = 1;
            end
            default : next_state = s3;
          endcase
        end
    endcase
end



endmodule