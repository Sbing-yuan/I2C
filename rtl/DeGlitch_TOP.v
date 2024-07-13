module DeGlitch_TOP(
/*AUTOARG*/
   // Outputs
   SDA_Deg, SCL_Deg,
   // Inputs
   SDA_In, SCL_In, rst_n, DS_SDA, BYP_SDA_FF, BYP_SDA_FB, DS_SCL,
   BYP_SCL_FF, BYP_SCL_FB
   );

input   SDA_In;
input   SCL_In;
input   rst_n;
input   DS_SDA;
input   BYP_SDA_FF;
input   BYP_SDA_FB;
input   DS_SCL;
input   BYP_SCL_FF;
input   BYP_SCL_FB;

output  SDA_Deg;
output  SCL_Deg;

DeGlitch_FF SDA_DeGlitch_FF(
			    // Outputs
			    .OUT		(SDA_FF),
			    // Inputs
			    .IN			(SDA_In),
			    .DS			(DS_SDA),
			    .BYP		(BYP_SDA_FF),
			    .SB			(rst_n));

DeGlitch_FB SDA_DeGlitch_FB(
			    // Outputs
			    .OUT		(),
			    .DOUT		(SDA_Deg),
			    // Inputs
			    .IN			(SDA_FF),
			    .BYP		(BYP_SDA_FB),
			    .SB			(rst_n));

DeGlitch_FF SCL_DeGlitch_FF(
			    // Outputs
			    .OUT		(SCL_FF),
			    // Inputs
			    .IN			(SCL_In),
			    .DS			(DS_SCL),
			    .BYP		(BYP_SCL_FF),
			    .SB			(rst_n));

DeGlitch_FB SCL_DeGlitch_FB(
			    // Outputs
			    .OUT		(SCL_Deg),
			    .DOUT		(),
			    // Inputs
			    .IN			(SCL_FF),
			    .BYP		(BYP_SCL_FB),
			    .SB			(rst_n));

endmodule
