module DeGlitch_FF(
    IN,
    OUT,
    DS,
    SB,
    BYP
);

input   IN;
input   DS;
input   BYP;
input   SB;

output  OUT;

lcell U0(.in(IN)  , .out(SD1));
lcell U1(.in(SD1) , .out(SD2));
lcell U2(.in(SD2) , .out(SD3));
lcell U3(.in(SD3) , .out(SD4));
lcell U4(.in(SD4) , .out(SD5));
lcell U5(.in(SD5) , .out(SD6));
lcell U6(.in(SD6) , .out(SD7));
lcell U7(.in(SD7) , .out(SD8));
lcell U8(.in(SD8) , .out(SD9));

DLY_chain Uchain0(.IN(SD9), .D80(D80));
DLY_chain Uchain1(.IN(D80), .D80(D160));

assign D_sel = DS ? D80 : D160;

assign LH_EN = ((SD1 == D_sel) & 
                (SD2 == D_sel) & 
                (SD3 == D_sel) & 
                (SD4 == D_sel) & 
                (SD5 == D_sel) & 
                (SD6 == D_sel) & 
                (SD7 == D_sel) & 
                (SD8 == D_sel) & 
                (SD9 == D_sel)) || BYP ;

assign LH_D = BYP ? IN : SD8;

D_Latch latch0(.Q(OUT), .SB(SB), .RB(1'b1) ,.G(LH_EN) ,.D(LH_D));

endmodule
