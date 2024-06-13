`timescale 1ns/1ps
`define VCDDUMP

module TB();

`include "task_i2c.v"

reg clk_50M;
reg rst_n;

initial begin 
    clk_50M = 1'b0;
    rst_n = 1'b0;
    #100;
    rst_n = 1'b1;
    #100;
    Wr_1Byte(8'd0, 8'd0);
    Wr_1Byte(8'd1, 8'd1);
    Wr_1Byte(8'd2, 8'd2);
    #100;
    $finish;
end

assign Pad_SDA = SDA_host;
assign Pad_SCL = SCL_host;

I2C_trx UI2C_trx(
/*AUTOINST*/
		 // Inouts
		 .Pad_SDA		(Pad_SDA),
		 .Pad_SCL		(Pad_SCL),
		 // Inputs
		 .rst_n			(rst_n),
		 .clk_50M		(clk_50M));

always #10 clk_50M = ~clk_50M;

`ifdef VCDDUMP
initial begin
    $dumpfile("Test.vcd");  //
    $dumpvars(0,TB);       
end
`endif

endmodule

