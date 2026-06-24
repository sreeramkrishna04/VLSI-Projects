`timescale 1ns/1ps

module uart_tb;

reg clk;
reg rst;
reg tx_start;
reg [7:0] tx_data;

wire [7:0] rx_data;
wire rx_done;

uart_top uut(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    tx_start = 0;
    tx_data = 0;

    #20;
    rst = 0;

    #20;

    tx_data = 8'hA5;
    tx_start = 1;

    #10;
    tx_start = 0;

    #200;

    if(rx_data == 8'hA5)
        $display("UART TEST PASS");
    else
        $display("UART TEST FAIL");

    $finish;

end

endmodule