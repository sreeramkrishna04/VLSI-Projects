`timescale 1ns/1ps

module mux32to1_tb;

reg  [31:0] in;
reg  [4:0] sel;
wire out;

mux32to1 uut(
    .in(in),
    .sel(sel),
    .out(out)
);

initial
begin

    in = 32'b10101010101010101010101010101010;

    sel = 0;  #10;
    sel = 1;  #10;
    sel = 2;  #10;
    sel = 3;  #10;
    sel = 4;  #10;
    sel = 5;  #10;
    sel = 6;  #10;
    sel = 7;  #10;

    $finish;

end

endmodule