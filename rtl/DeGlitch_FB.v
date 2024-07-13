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

DLY_chain Uchain0(.IN(OUT), .D80(D80));
DLY_chain Uchain1(.IN(D80), .D80(D160));

assign LH_EN = ~(D80 ^ D160) || BYP;
assign DOUT = D80;

D_Latch latch0(.Q(OUT), .SB(SB), .RB(1'b1) ,.G(LH_EN) ,.D(IN));

endmodule
