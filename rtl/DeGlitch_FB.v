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

DLY_chain Uchain0 (.IN(OUT),     .D80(D80));
DLY_chain Uchain1 (.IN(D80),     .D80(D160));
DLY_chain Uchain2 (.IN(D160),    .D80(D240));
DLY_chain Uchain3 (.IN(D240),    .D80(D320));
DLY_chain Uchain4 (.IN(D320),    .D80(D400));
DLY_chain Uchain5 (.IN(D400),    .D80(D480));
DLY_chain Uchain6 (.IN(D480),    .D80(D560));
DLY_chain Uchain7 (.IN(D560),    .D80(D640));
DLY_chain Uchain8 (.IN(D640),    .D80(D720));
DLY_chain Uchain9 (.IN(D720),    .D80(D800));
DLY_chain Uchain10(.IN(D800),    .D80(D880));

assign LH_EN = ~(D80 ^ D400) || BYP;
assign DOUT = D880;
//assign DOUT = D400;

D_Latch latch0(.Q(OUT), .SB(SB), .RB(1'b1) ,.G(LH_EN) ,.D(IN));

endmodule
