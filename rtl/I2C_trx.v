module I2C_trx(
/*AUTOARG*/
   // Inouts
   Pad_SDA, Pad_SCL,
   // Inputs
   rst_n, clk_50M
   );

input rst_n;
input clk_50M;
inout Pad_SDA;
inout Pad_SCL;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [6:0]		ADDR;			// From UI2CCTL of I2CCtl.v
wire			D_VAL;			// From UI2CCTL of I2CCtl.v
wire [7:0]		REC_D;			// From UI2CCTL of I2CCtl.v
wire			SCL;			// From UClock_Central of Clock_Central.v
wire			SCL_inv;		// From UClock_Central of Clock_Central.v
wire			SDA;			// From UClock_Central of Clock_Central.v
wire			SDA_inv;		// From UClock_Central of Clock_Central.v
wire			SDAo;			// From UI2CCTL of I2CCtl.v
// End of automatics
wire [7:0]      xmit_data;

assign  xmit_data = 8'h5A;

I2CCtl UI2CCTL(
/*AUTOINST*/
	       // Outputs
	       .SDAo			(SDAo),
	       .ADDR			(ADDR[6:0]),
	       .REC_D			(REC_D[7:0]),
	       .D_VAL			(D_VAL),
	       // Inputs
	       .SCL			(SCL),
	       .SDA			(SDA),
	       .SCL_inv			(SCL_inv),
	       .SDA_inv			(SDA_inv),
	       .SCL_din			(SCL_In),
	       .SDA_din			(SDA_In),
	       .rst_n			(rst_n),
	       .xmit_data		(xmit_data[7:0]));

GPIO SDA_GPIO(
	      // Inouts
	      .Pad			(Pad_SDA),
	      // Outputs
	      .In			(SDA_In),
	      // Inputs
	      .Out			(SDAo),
	      .OE			(~SDAo));

GPIO SCL_GPIO(
	      // Inouts
	      .Pad			(Pad_SCL),
	      // Outputs
	      .In			(SCL_In),
	      // Inputs
	      .Out			(1'b0),
	      .OE			(1'b0));

Clock_Central UClock_Central(
/*AUTOINST*/
			     // Outputs
			     .SCL		(SCL),
			     .SDA		(SDA),
			     .SCL_inv		(SCL_inv),
			     .SDA_inv		(SDA_inv),
			     // Inputs
			     .SDA_In		(SDA_In),
			     .SCL_In		(SCL_In));

endmodule
