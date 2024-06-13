module Clock_Central(
/*AUTOARG*/
   // Outputs
   SCL, SDA, SCL_inv, SDA_inv,
   // Inputs
   SDA_In, SCL_In
   );

input   SDA_In;
input   SCL_In;
output  SCL;
output  SDA;
output  SCL_inv;
output  SDA_inv;

assign  SCL = SCL_In;
assign  SDA = SDA_In;
assign  SCL_inv = ~SCL_In;
assign  SDA_inv = ~SDA_In;

endmodule
