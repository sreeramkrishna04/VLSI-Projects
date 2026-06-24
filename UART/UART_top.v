module uart_top(
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,

    output [7:0] rx_data,
    output rx_done
);

wire serial_wire;
wire tx_done;

uart_tx TX(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(serial_wire),
    .tx_done(tx_done)
);

uart_rx RX(
    .clk(clk),
    .rst(rst),
    .rx(serial_wire),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

endmodule