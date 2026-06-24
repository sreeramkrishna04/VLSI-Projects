module traffic_light(

    input clk,
    input reset,

    output reg red,
    output reg yellow,
    output reg green

);

    // State definitions
    parameter RED_STATE    = 2'b00;
    parameter GREEN_STATE  = 2'b01;
    parameter YELLOW_STATE = 2'b10;

    // State and counter registers
    reg [1:0] state;
    reg [3:0] count;

    // State transition logic
    always @(posedge clk)
    begin

        if(reset)
        begin
            state <= RED_STATE;
            count <= 0;
        end

        else
        begin

            count <= count + 1;

            case(state)

                RED_STATE:
                begin
                    if(count == 5)
                    begin
                        state <= GREEN_STATE;
                        count <= 0;
                    end
                end

                GREEN_STATE:
                begin
                    if(count == 5)
                    begin
                        state <= YELLOW_STATE;
                        count <= 0;
                    end
                end

                YELLOW_STATE:
                begin
                    if(count == 2)
                    begin
                        state <= RED_STATE;
                        count <= 0;
                    end
                end

                default:
                begin
                    state <= RED_STATE;
                    count <= 0;
                end

            endcase

        end

    end

    // Output logic
    always @(*)
    begin

        case(state)

            RED_STATE:
            begin
                red    = 1'b1;
                yellow = 1'b0;
                green  = 1'b0;
            end

            GREEN_STATE:
            begin
                red    = 1'b0;
                yellow = 1'b0;
                green  = 1'b1;
            end

            YELLOW_STATE:
            begin
                red    = 1'b0;
                yellow = 1'b1;
                green  = 1'b0;
            end

            default:
            begin
                red    = 1'b1;
                yellow = 1'b0;
                green  = 1'b0;
            end

        endcase

    end

endmodule