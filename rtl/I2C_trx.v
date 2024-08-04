`define DEBUG
module I2C_trx(
`ifdef DEBUG
    a	  ,
    b	  ,
    c	  ,
    d	  ,
    e	  ,
    f	  ,
    g	  ,
    dp	  ,
    D1_sel,
    D2_sel,
    D3_sel,
    D4_sel,
    SCL_Deg,
    SDA_Deg,
`endif
/*AUTOARG*/
   // Inouts
   Pad_SDA, Pad_SCL,
   // Inputs
   rst_n, clk_50M
   );

input   rst_n;
input   clk_50M;
inout   Pad_SDA;
inout   Pad_SCL;
`ifdef DEBUG
output  a	  ;
output  b	  ;
output  c	  ;
output  d	  ;
output  e	  ;
output  f	  ;
output  g	  ;
output  dp	  ;
output  D1_sel;
output  D2_sel;
output  D3_sel;
output  D4_sel;
output  SCL_Deg;
output  SDA_Deg;
`endif

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [6:0]		ADDR;			// From UI2CCTL of I2CCtl.v
wire			D_VAL;			// From UI2CCTL of I2CCtl.v
wire [7:0]		REC_D;			// From UI2CCTL of I2CCtl.v
wire			SCL;			// From UClock_Central of Clock_Central.v
wire			SCL_Deg;		// From UDeGlitch_TOP of DeGlitch_TOP.v
wire			SCL_inv;		// From UClock_Central of Clock_Central.v
wire			SDA;			// From UClock_Central of Clock_Central.v
wire			SDA_Deg;		// From UDeGlitch_TOP of DeGlitch_TOP.v
wire			SDA_inv;		// From UClock_Central of Clock_Central.v
wire			SDAo;			// From UI2CCTL of I2CCtl.v
wire [4:0]		sm;			// From UI2CCTL of I2CCtl.v
wire			store_data;		// From UClock_Central of Clock_Central.v
// End of automatics
wire [7:0]      xmit_data;

`ifdef DEBUG
wire			a;			// From Useg7 of seg7.v
wire			b;			// From Useg7 of seg7.v
wire			c;			// From Useg7 of seg7.v
wire			d;			// From Useg7 of seg7.v
wire			dp;			// From Useg7 of seg7.v
wire			e;			// From Useg7 of seg7.v
wire			f;			// From Useg7 of seg7.v
wire			g;			// From Useg7 of seg7.v
wire			D1_sel;			// From Useg7 of seg7.v
wire			D2_sel;			// From Useg7 of seg7.v
wire			D3_sel;			// From Useg7 of seg7.v
wire			D4_sel;			// From Useg7 of seg7.v
`endif

I2CCtl UI2CCTL(
	       .SCL_din			(SCL_Deg),
	       .SDA_din			(SDA_Deg),
/*AUTOINST*/
	       // Outputs
	       .SDAo			(SDAo),
	       .ADDR			(ADDR[6:0]),
	       .REC_D			(REC_D[7:0]),
	       .D_VAL			(D_VAL),
	       .sm			(sm[4:0]),
	       // Inputs
	       .SCL			(SCL),
	       .SDA			(SDA),
	       .SCL_inv			(SCL_inv),
	       .SDA_inv			(SDA_inv),
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

DeGlitch_TOP UDeGlitch_TOP(
/*AUTOINST*/
			   // Outputs
			   .SDA_Deg		(SDA_Deg),
			   .SCL_Deg		(SCL_Deg),
			   // Inputs
			   .SDA_In		(SDA_In),
			   .SCL_In		(SCL_In),
			   .rst_n		(rst_n),
			   .DS_SDA		(1'b0),
			   .BYP_SDA_FF		(1'b0),
			   .BYP_SDA_FB		(1'b0),
			   .DS_SCL		(1'b0),
			   .BYP_SCL_FF		(1'b0),
			   .BYP_SCL_FB		(1'b0));

Clock_Central UClock_Central(
/*AUTOINST*/
			     // Outputs
			     .SCL		(SCL),
			     .SDA		(SDA),
			     .SCL_inv		(SCL_inv),
			     .SDA_inv		(SDA_inv),
			     .store_data	(store_data),
			     // Inputs
			     .SDA_In		(SDA_Deg),
			     .SCL_In		(SCL_Deg),
			     .D_VAL		(D_VAL),
			     .rst_n		(rst_n));

regbank Uregbank(
    .store_data     (store_data),
    .rst_n          (rst_n),
    .regbank_addr   (ADDR[6:0]),
    .regbank_wrdata (REC_D[7:0]),
    .regbank_rddata (xmit_data[7:0])
);

`ifdef DEBUG
seg7 Useg7(
	   // Outputs
	   .a				(a),
	   .b				(b),
	   .c				(c),
	   .d				(d),
	   .e				(e),
	   .f				(f),
	   .g				(g),
	   .dp				(dp),
	   .D1_sel			(D1_sel),
	   .D2_sel			(D2_sel),
	   .D3_sel			(D3_sel),
	   .D4_sel			(D4_sel),
	   // Inputs
	   .num1			(REC_D[3:0]),
	   .num2			(xmit_data[7:4]),
	   .num3			(sm[3:0]),
	   .num4			({1'b0, SDA, SCL, sm[4]}),
	   .scan_clk			(scan_clk),
	   .rst_n			(rst_n));

ClkDiv #(
    .CNT_BW(13)
)ScanClkDiv(
		  // Outputs
		  .out_clk		(scan_clk),
		  // Inputs
		  .in_clk		(clk_50M),
		  .B_n			(13'd4000),
		  .rst_n		(rst_n));

`endif

endmodule
