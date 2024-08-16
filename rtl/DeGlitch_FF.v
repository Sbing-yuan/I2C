`define USE_INV
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

lcell U0/* synthesis keep */(.in(IN)  , .out(SD1));
lcell U1/* synthesis keep */(.in(SD1) , .out(SD2));
lcell U2/* synthesis keep */(.in(SD2) , .out(SD3));
lcell U3/* synthesis keep */(.in(SD3) , .out(SD4));
lcell U4/* synthesis keep */(.in(SD4) , .out(SD5));
lcell U5/* synthesis keep */(.in(SD5) , .out(SD6));
lcell U6/* synthesis keep */(.in(SD6) , .out(SD7));
lcell U7/* synthesis keep */(.in(SD7) , .out(SD8));
lcell U8/* synthesis keep */(.in(SD8) , .out(SD9));

`ifdef USE_INV
DLY_chain_inv Uchain0 (.IN(SD9),  .D39(D39));
DLY_chain_inv Uchain1 (.IN(D39),  .D39(D78));
INV  INV0             (.in(D78)  ,.out(D79));
INV  INV1             (.in(D79)  ,.out(D80));
DLY_chain_inv Uchain2 (.IN(D80),  .D39(D119));
DLY_chain_inv Uchain3 (.IN(D119), .D39(D158));
INV  INV2             (.in(D158) ,.out(D159));
INV  INV3             (.in(D159) ,.out(D160));
`else
DLY_chain Uchain0(.IN(SD9), .D80(D80));
DLY_chain Uchain1(.IN(D80), .D80(D160));
`endif

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
