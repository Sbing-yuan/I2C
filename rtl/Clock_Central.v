module Clock_Central(
/*AUTOARG*/
   // Outputs
   SCL, SDA, SCL_inv, SDA_inv, store_data,
   // Inputs
   SDA_In, SCL_In, D_VAL, rst_n
   );

input   SDA_In;
input   SCL_In;
input   D_VAL;
input   rst_n;

output  SCL;
output  SDA;
output  SCL_inv;
output  SDA_inv;
output  store_data;

reg     store_data;

assign  SCL = SCL_In;
assign  SDA = SDA_In;
assign  SCL_inv = ~SCL_In;
assign  SDA_inv = ~SDA_In;

always@(posedge SCL or negedge rst_n)
    if(~rst_n)
        store_data <= 1'b0;
    else
        store_data <= D_VAL;

endmodule
