module D_Latch(
/*AUTOARG*/
   // Outputs
   Q, QB,
   // Inputs
   SB, RB, G, D
   );

input   SB;
input   RB;
input   G;
input   D;
output  Q;
output  QB;

reg Q;
always@(*)
    if(SB==0)
        Q = 1;
    else if(RB == 0)
        Q = 0;
    else if(G)
        Q = D;

assign  QB = ~Q;

endmodule
