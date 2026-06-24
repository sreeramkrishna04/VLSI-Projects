`timescale 1ns/1ps

module vending_machine_tb;

reg clk;
reg rst;

reg coin5;
reg coin10;

wire dispense;

vending_machine uut(
    .clk(clk),
    .rst(rst),
    .coin5(coin5),
    .coin10(coin10),
    .dispense(dispense)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;

    coin5 = 0;
    coin10 = 0;

    #10;
    rst = 0;

    // Insert Rs5
    coin5 = 1;
    #10;
    coin5 = 0;

    // Insert Rs10
    coin10 = 1;
    #10;
    coin10 = 0;

    #30;

    $finish;

end

endmodule