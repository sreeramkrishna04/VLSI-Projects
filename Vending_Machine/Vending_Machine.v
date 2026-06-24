module vending_machine(
    input clk,
    input rst,

    input coin5,
    input coin10,

    output reg dispense
);

reg [1:0] state;

parameter S0  = 2'b00;
parameter S5  = 2'b01;
parameter S10 = 2'b10;
parameter S15 = 2'b11;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        state <= S0;
        dispense <= 0;
    end

    else
    begin

        dispense <= 0;

        case(state)

        S0:
        begin
            if(coin5)
                state <= S5;

            else if(coin10)
                state <= S10;
        end

        S5:
        begin
            if(coin5)
                state <= S10;

            else if(coin10)
                state <= S15;
        end

        S10:
        begin
            if(coin5)
                state <= S15;

            else if(coin10)
                state <= S15;
        end

        S15:
        begin
            dispense <= 1;
            state <= S0;
        end

        default:
            state <= S0;

        endcase

    end

end

endmodule