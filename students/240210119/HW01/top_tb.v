`timescale 1ns/1ps

module top_tb;

    wire       clk;
    reg        clr;
    reg        en;
    wire [9:0] q;

    clk_gen u_clk_gen(
        .clk(clk)
    );

    cd4017 u_cd4017(
        .clk(clk),
        .clr(clr),
        .en(en),
        .q(q)
    );

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        clr = 1'b1;
        en  = 1'b1;

        #40  clr = 1'b0;
        #80  en  = 1'b0;
        #40  en  = 1'b1;
        #125 clr = 1'b1;
        #15  clr = 1'b0;
        #6   $finish;
    end

endmodule
