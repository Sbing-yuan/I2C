`timescale 1ns/1ps
`define VCDDUMP
`define I2C_GLT

module TB();

`include "task_i2c.v"

reg clk_50M;
reg rst_n;

wand Pad_SDA;
wand Pad_SCL;

initial begin 
    clk_50M = 1'b0;
    rst_n = 1'b1;
    #1
    rst_n = 1'b0;
    #100;
    rst_n = 1'b1;
    #100;
    Rd_1Byte(8'd0);
    Rd_1Byte(8'd1);
    Rd_1Byte(8'd2);
    Rd_1Byte(8'd3);
    Rd_1Byte(8'd4);
    Rd_1Byte(8'd5);
    Rd_1Byte(8'd6);
    Rd_1Byte(8'd7);
    Wr_1Byte(8'd0, 8'd0);
    Wr_1Byte(8'd1, 8'd1);
    Wr_1Byte(8'd2, 8'd2);
    Wr_1Byte(8'd3, 8'd3);
    Wr_1Byte(8'd4, 8'd4);
    Wr_1Byte(8'd5, 8'd5);
    Wr_1Byte(8'd6, 8'd6);
    Wr_1Byte(8'd7, 8'd7);
    Rd_1Byte(8'd0);
    Rd_1Byte(8'd1);
    Rd_1Byte(8'd2);
    Rd_1Byte(8'd3);
    Rd_1Byte(8'd4);
    Rd_1Byte(8'd5);
    Rd_1Byte(8'd6);
    Rd_1Byte(8'd7);
    Wr_1Byte(8'd0, 8'd8);
    Wr_1Byte(8'd1, 8'd9);
    Wr_1Byte(8'd2, 8'd10);
    Wr_1Byte(8'd3, 8'd11);
    Wr_1Byte(8'd4, 8'd12);
    Wr_1Byte(8'd5, 8'd13);
    Wr_1Byte(8'd6, 8'd14);
    Wr_1Byte(8'd7, 8'd15);
    Rd_1Byte(8'd0);
    Rd_1Byte(8'd1);
    Rd_1Byte(8'd2);
    Rd_1Byte(8'd3);
    Rd_1Byte(8'd4);
    Rd_1Byte(8'd5);
    Rd_1Byte(8'd6);
    Rd_1Byte(8'd7);
    Start;
    Stop;
    Start;
    Stop;
    #100;
    $finish;
end

assign Pad_SDA = SDA_host;
assign Pad_SCL = SCL_host;
assign SDAi = Pad_SDA;

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

