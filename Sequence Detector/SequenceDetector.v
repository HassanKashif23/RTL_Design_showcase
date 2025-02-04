module moorefsm(
    input clk,rst,sequence,
    output reg detected
);

// state encoding
parameter A = 3'b000;
parameter B = 3'b001;
parameter C = 3'b010;
parameter D = 3'b011;
parameter E = 3'b100;

reg [2:0]nextstate,presentstate;

// present state logic

always @ (posedge clk or posedge rst)
begin
    if(rst)
        presentstate <= A;
    else
        presentstate <= nextstate;
end

// next state logic

always @(*) begin
    case(presentstate)
    A : if (sequence) begin
        nextstate = B;
    end else begin
        nextstate = A;
    end
    B : if (sequence) begin
        nextstate = C;
    end else begin
        nextstate = A;
    end
    C : if (sequence) begin
        nextstate = C;
    end else begin
        nextstate = D;
    end
    D : if (sequence) begin
        nextstate = B;
    end else begin
        nextstate = E;
    end
    E : if (sequence) begin
        nextstate = B;
    end else begin
        nextstate = A;
    end
    default : nextstate = A;

    endcase
end

// output logic

always @(*) begin
    case (presentstate)
        A : detected = 0;
        B : detected = 0;
        C : detected = 0;
        D : detected = 0;
        E : detected = 1;
        default: detected = 0;
    endcase
end
    
endmodule