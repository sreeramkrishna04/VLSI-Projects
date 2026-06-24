module uart_rx(
    input clk,
    input rst,
    input rx,

    output reg [7:0] rx_data,
    output reg rx_done
);

reg [2:0] bit_index;
reg [1:0] state;

parameter IDLE  = 2'b00;
parameter DATA  = 2'b01;
parameter STOP  = 2'b10;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        state <= IDLE;
        rx_done <= 0;
        bit_index <= 0;
        rx_data <= 0;
    end

    else
    begin

        rx_done <= 0;

        case(state)

        IDLE:
        begin
            if(rx == 0)
            begin
                bit_index <= 0;
                state <= DATA;
            end
        end

        DATA:
        begin
            rx_data[bit_index] <= rx;

            if(bit_index == 7)
                state <= STOP;
            else
                bit_index <= bit_index + 1;
        end

        STOP:
        begin
            rx_done <= 1;
            state <= IDLE;
        end

        endcase

    end

end

endmodule