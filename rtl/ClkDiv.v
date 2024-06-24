module ClkDiv
#(
parameter   CNT_BW = 8,
parameter   RST_VAL = 0
)(
/*AUTOARG*/
   // Outputs
   out_clk,
   // Inputs
   in_clk, B_n, rst_n
   );

output                  out_clk;
input                   in_clk;
input   [CNT_BW-1:0]    B_n;
input                   rst_n;

reg [CNT_BW-1:0]        cnt;
reg                     ck1;
reg                     ck2;

assign  in_clk_inv = ~in_clk;

always@(posedge in_clk or negedge rst_n)
    if(~rst_n)
        cnt <= {{(CNT_BW-1){1'b0}},1'd1};
    else
    begin
        if(cnt >= B_n)
            cnt <= {{(CNT_BW-1){1'b0}},1'd1};
        else
            cnt <= cnt + {{(CNT_BW-1){1'b0}},1'd1};
    end

always@(posedge in_clk or negedge rst_n)
    if(~rst_n)
        ck1 <= RST_VAL;
    else
    begin
        if(cnt <= {1'b0, B_n[CNT_BW-1:1]})
            ck1 <= 1'b1;
        else
            ck1 <= 1'b0;
    end

always@(posedge in_clk_inv or negedge rst_n)
    if(~rst_n)
        ck2 <= RST_VAL;
    else
    begin
        if(B_n[0] == 1'b1)
            ck2 <= ck1;
        else
            ck2 <= 1'b0;
    end

assign ck_div = ck1 | ck2;
assign ck_bypass = (B_n == {{(CNT_BW-1){1'b0}},1'd1}) || (B_n == {(CNT_BW){1'b0}});
assign out_clk = ck_bypass ? in_clk: ck_div;

endmodule
