// ============================================================
// 文件名 : cd4017.v
// 功能   : 十进制计数器 CD4017
//          内部用 4 位二进制计数器 count 记 0~9，
//          再用译码逻辑把 count 译成 q[9:0] 的单比特高电平。
//          clr 为异步清零（高有效），en 为使能（高有效）。
// ============================================================

module cd4017(clk,en,clr,q);
    input clk;
    input en;
    input clr;
    output [9:0] q;

    reg [3:0] count;
    reg [9:0] q;

    always @(posedge clk or posedge clr) begin
        if (clr == 1'b1) begin
            count <= 4'd0;
        end else if (en == 1'b1) begin
            if (count == 4'd9) begin
                count <= 4'd0;
            end else begin
                count <= count + 1'b1;
            end
        end
    end

    always @(*) begin
        q = 10'b00000_00001 << count;
    end

endmodule
