module DLY_chain_inv(
    IN,
    D39,
);

input   IN;
output  D39;

INV  U0/* synthesis keep */(.in(IN)    , .out(SD1));
INV  U1/* synthesis keep */(.in(SD1)   , .out(SD2));
INV  U2/* synthesis keep */(.in(SD2)   , .out(SD3));
INV  U3/* synthesis keep */(.in(SD3)   , .out(SD4));
INV  U4/* synthesis keep */(.in(SD4)   , .out(SD5));
INV  U5/* synthesis keep */(.in(SD5)   , .out(SD6));
INV  U6/* synthesis keep */(.in(SD6)   , .out(SD7));
INV  U7/* synthesis keep */(.in(SD7)   , .out(SD8));
INV  U8/* synthesis keep */(.in(SD8)   , .out(SD9));
INV  U9/* synthesis keep */(.in(SD9)   , .out(SD10));
INV U10/* synthesis keep */(.in(SD10)  , .out(SD11));
INV U11/* synthesis keep */(.in(SD11)  , .out(SD12));
INV U12/* synthesis keep */(.in(SD12)  , .out(SD13));
INV U13/* synthesis keep */(.in(SD13)  , .out(SD14));
INV U14/* synthesis keep */(.in(SD14)  , .out(SD15));
INV U15/* synthesis keep */(.in(SD15)  , .out(SD16));
INV U16/* synthesis keep */(.in(SD16)  , .out(SD17));
INV U17/* synthesis keep */(.in(SD17)  , .out(SD18));
INV U18/* synthesis keep */(.in(SD18)  , .out(SD19));
INV U19/* synthesis keep */(.in(SD19)  , .out(SD20));
INV U20/* synthesis keep */(.in(SD20)  , .out(SD21));
INV U21/* synthesis keep */(.in(SD21)  , .out(SD22));
INV U22/* synthesis keep */(.in(SD22)  , .out(SD23));
INV U23/* synthesis keep */(.in(SD23)  , .out(SD24));
INV U24/* synthesis keep */(.in(SD24)  , .out(SD25));
INV U25/* synthesis keep */(.in(SD25)  , .out(SD26));
INV U26/* synthesis keep */(.in(SD26)  , .out(SD27));
INV U27/* synthesis keep */(.in(SD27)  , .out(SD28));
INV U28/* synthesis keep */(.in(SD28)  , .out(SD29));
INV U29/* synthesis keep */(.in(SD29)  , .out(SD30));
INV U30/* synthesis keep */(.in(SD30)  , .out(SD31));
INV U31/* synthesis keep */(.in(SD31)  , .out(SD32));
INV U32/* synthesis keep */(.in(SD32)  , .out(SD33));
INV U33/* synthesis keep */(.in(SD33)  , .out(SD34));
INV U34/* synthesis keep */(.in(SD34)  , .out(SD35));
INV U35/* synthesis keep */(.in(SD35)  , .out(SD36));
INV U36/* synthesis keep */(.in(SD36)  , .out(SD37));
INV U37/* synthesis keep */(.in(SD37)  , .out(SD38));
INV U38/* synthesis keep */(.in(SD38)  , .out(D39));

endmodule
