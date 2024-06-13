module GPIO(
/*AUTOARG*/
   // Outputs
   In,
   // Inouts
   Pad,
   // Inputs
   Out, OE
   );

inout   Pad;
input   Out;
input   OE;
output  In;

assign Pad = OE ? Out: 1'bz;
assign In = OE || Pad;

endmodule
