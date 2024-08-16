`define USE_INV
module DeGlitch_FB(
    IN,
    OUT,
    DOUT,
    SB,
    BYP
);

input   IN;
input   BYP;
input   SB;

output  OUT;
output  DOUT;

`ifdef USE_INV
DLY_chain_inv Uchain0 (.IN(OUT),  .D39(D39));
DLY_chain_inv Uchain1 (.IN(D39),  .D39(D78));
INV  U0               (.in(D78)  ,.out(D79));
INV  U1               (.in(D79)  ,.out(D80));
DLY_chain_inv Uchain2 (.IN(D80),  .D39(D119));
DLY_chain_inv Uchain3 (.IN(D119), .D39(D158));
INV  U2               (.in(D158) ,.out(D159));
INV  U3               (.in(D159) ,.out(D160));
DLY_chain_inv Uchain4 (.IN(D160), .D39(D199));
DLY_chain_inv Uchain5 (.IN(D119), .D39(D238));
INV  U4               (.in(D238) ,.out(D239));
INV  U5               (.in(D239) ,.out(D240));
DLY_chain_inv Uchain6 (.IN(D240), .D39(D279));
DLY_chain_inv Uchain7 (.IN(D279), .D39(D318));
INV  U6               (.in(D318) ,.out(D319));
INV  U7               (.in(D319) ,.out(D320));
DLY_chain_inv Uchain8 (.IN(D320), .D39(D359));
DLY_chain_inv Uchain9 (.IN(D359), .D39(D398));
INV  U8               (.in(D398) ,.out(D399));
INV  U9               (.in(D399) ,.out(D400));
`else
DLY_chain Uchain0 (.IN(OUT),     .D80(D80));
DLY_chain Uchain1 (.IN(D80),     .D80(D160));
DLY_chain Uchain2 (.IN(D160),    .D80(D240));
DLY_chain Uchain3 (.IN(D240),    .D80(D320));
DLY_chain Uchain4 (.IN(D320),    .D80(D400));
`endif

assign LH_EN = ~(D80 ^ D400) || BYP;
//assign DOUT = D880;
assign DOUT = D400;

D_Latch latch0(.Q(OUT), .SB(SB), .RB(1'b1) ,.G(LH_EN) ,.D(IN));

endmodule
