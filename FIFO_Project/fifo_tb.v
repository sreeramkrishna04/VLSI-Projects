`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

integer errors;

fifo uut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;
    errors = 0;

    //------------------------------------------------
    // RESET TEST
    //------------------------------------------------

    #10;
    rst = 0;

    #10;

    if(empty)
        $display("RESET TEST PASS");
    else
    begin
        $display("RESET TEST FAIL");
        errors = errors + 1;
    end

    //------------------------------------------------
    // WRITE TEST
    //------------------------------------------------

    wr_en = 1;

    data_in = 8'd10; #10;
    data_in = 8'd20; #10;
    data_in = 8'd30; #10;

    wr_en = 0;

    #10;

    if(!empty)
        $display("WRITE TEST PASS");
    else
    begin
        $display("WRITE TEST FAIL");
        errors = errors + 1;
    end

    //------------------------------------------------
    // READ TEST
    //------------------------------------------------

    rd_en = 1;

    #10;
    if(data_out == 8'd10)
        $display("READ1 PASS");
    else
    begin
        $display("READ1 FAIL");
        errors = errors + 1;
    end

    #10;
    if(data_out == 8'd20)
        $display("READ2 PASS");
    else
    begin
        $display("READ2 FAIL");
        errors = errors + 1;
    end

    #10;
    if(data_out == 8'd30)
        $display("READ3 PASS");
    else
    begin
        $display("READ3 FAIL");
        errors = errors + 1;
    end

    rd_en = 0;

    //------------------------------------------------
    // EMPTY FLAG TEST
    //------------------------------------------------

    #10;

    if(empty)
        $display("EMPTY FLAG PASS");
    else
    begin
        $display("EMPTY FLAG FAIL");
        errors = errors + 1;
    end

    //------------------------------------------------
    // FULL FLAG TEST
    //------------------------------------------------

    wr_en = 1;

    data_in = 8'd1; #10;
    data_in = 8'd2; #10;
    data_in = 8'd3; #10;
    data_in = 8'd4; #10;
    data_in = 8'd5; #10;
    data_in = 8'd6; #10;
    data_in = 8'd7; #10;
    data_in = 8'd8; #10;

    wr_en = 0;

    #10;

    if(full)
        $display("FULL FLAG PASS");
    else
    begin
        $display("FULL FLAG FAIL");
        errors = errors + 1;
    end

    //------------------------------------------------
    // OVERFLOW TEST
    //------------------------------------------------

    wr_en = 1;
    data_in = 8'd99;

    #10;

    wr_en = 0;

    if(full)
        $display("OVERFLOW TEST PASS");
    else
    begin
        $display("OVERFLOW TEST FAIL");
        errors = errors + 1;
    end

    //------------------------------------------------
    // READ ALL DATA
    //------------------------------------------------

    rd_en = 1;

    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;

    rd_en = 0;

    //------------------------------------------------
    // UNDERFLOW TEST
    //------------------------------------------------

    rd_en = 1;

    #10;

    rd_en = 0;

    if(empty)
        $display("UNDERFLOW TEST PASS");
    else
    begin
        $display("UNDERFLOW TEST FAIL");
        errors = errors + 1;
    end

    //------------------------------------------------
    // FINAL REPORT
    //------------------------------------------------

    if(errors == 0)
        $display("=================================");
    
    if(errors == 0)
        $display("ALL TESTS PASSED");

    else
        $display("TOTAL ERRORS = %0d", errors);

    if(errors == 0)
        $display("=================================");

    #20;

    $finish;

end

endmodule