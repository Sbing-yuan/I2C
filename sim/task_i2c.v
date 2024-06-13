parameter   SlvID           = 7'b111_0111;

parameter   WR              = 1'b0;
parameter   RD              = 1'b1;

parameter   Tsp             = 50;
parameter   Tbc             = 12.5;
`ifdef  I2C_100K
parameter   Tbuf_           = 4700;
parameter   Tsu_stop_       = 4000;
parameter   Tsu_start_      = 4700;
parameter   Thd_start_      = 4000;
parameter   Tlow_           = 4700;
parameter   Thigh_          = 4700;
parameter   Thd_dat_        = 0;
parameter   Tsu_dat_        = 250;
parameter   Tr              = 1000;
parameter   Tf              = 300;
`elsif  I2C_400K
parameter   Tbuf_           = 1300;
parameter   Tsu_stop_       = 600;
parameter   Tsu_start_      = 600;
parameter   Thd_start_      = 600;
parameter   Tlow            = 1300;
parameter   Thigh_          = 600;
parameter   Thd_dat_        = 0;
parameter   Tsu_dat_        = 100;
parameter   Tr              = 300;
parameter   Tf              = 300;
`else // default is 1MHz
parameter   Tbuf_           = 500;
parameter   Tsu_stop_       = 260;
parameter   Tsu_start_      = 260;
parameter   Thd_start_      = 260;
parameter   Tlow_           = 500;
parameter   Thigh_          = 260;
parameter   Thd_dat_        = 0;
parameter   Tsu_dat_        = 50;
parameter   Tr              = 120;
parameter   Tf              = 120;
`endif

`ifdef I2C_GLT
parameter   Tbuf            = Tbuf_ + Tf;
parameter   Tsu_stop        = Tsu_stop_ + Tr;
parameter   Tsu_start       = Tsu_start_ + Tf;
parameter   Thd_start       = Thd_start_ + Tf;
parameter   Tlow            = Tlow_ + Tr;
parameter   Thigh           = Thigh_ + Tf;
parameter   Thd_dat         = Thd_dat_;
parameter   Tsu_dat         = Tsu_dat_;
`else
parameter   Tbuf            = Tbuf_;
parameter   Tsu_stop        = Tsu_stop_;
parameter   Tsu_start       = Tsu_start_;
parameter   Thd_start       = Thd_start_;
parameter   Tlow            = Tlow_;
parameter   Thigh           = Thigh_;
parameter   Thd_dat         = Thd_dat_;
parameter   Tsu_dat         = Tsu_dat_;
`endif

parameter   Ttr_dat         = 0;

reg [7:0]   Rd_Mem[255:0];
reg         ACK;
reg         SDA_host;
reg         SCL_host;

wire        SDAi;

initial begin
    SDA_host = 1;
    SCL_host = 1;
end

//========================================
task Start;
begin
                        SDA_host = 1;
    #(Tbuf-Tsu_start)   SCL_host = 1;
    #(Tsu_start)        SDA_host = 0;
    #(Thd_start)        SCL_host = 0;
end
endtask

//========================================
task Stop;
begin
    #(Ttr_dat)          SDA_host = 0;
    #(Tlow-Ttr_dat)     SDA_host = 1;
    #(Tsu_stop)         SCL_host = 1;
end
endtask

//========================================
task Wr_SlvID;
input   [6:0]   SlvID;
input           R1_W0;
begin
    #(Ttr_dat) SDA_host = SlvID[6]; #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = SlvID[5]; #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = SlvID[4]; #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = SlvID[3]; #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = SlvID[2]; #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = SlvID[1]; #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = SlvID[0]; #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    //control bit
    #(Ttr_dat) SDA_host = R1_W0;    #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    //wait for ACK
    #(Ttr_dat) SDA_host = 1'bz;     #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
end
endtask

//========================================
task Wr_Data;
input   [7:0]   Data;
begin
    #(Ttr_dat) SDA_host = Data[7];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = Data[6];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = Data[5];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = Data[4];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = Data[3];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = Data[2];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = Data[1];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    #(Ttr_dat) SDA_host = Data[0];  #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0;
    //wait for ACK
   fork
    begin #(Ttr_dat) SDA_host = 1'bz;     #(Tlow-Ttr_dat) SCL_host = 1;#(Thigh) SCL_host = 0; end
    #(Tlow+Thigh) ACK = !SDAi;
   join
end
endtask

//========================================
task Rd_Data;
output  [7:0]   Data;
input           Last1;
begin
   fork
    #(Ttr_dat) SDA_host = 1;
    begin #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[7] = SDAi; end
   join
    #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[6] = SDAi;
    #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[5] = SDAi;
    #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[4] = SDAi;
    #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[3] = SDAi;
    #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[2] = SDAi;
    #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[1] = SDAi;
    #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; Data[0] = SDAi;
   fork
    #(Ttr_dat) SDA_host = Last1;
    begin #(Tlow) SCL_host = 1;  #(Thigh) SCL_host = 0; end
   join
end
endtask

//========================================
task Wr_1Byte;
input   [7:0]   Addr;
input   [7:0]   Data;
begin
    ACK = 0;
    Start;
    Wr_SlvID(SlvID, WR);
    Wr_Data(Addr);
    Wr_Data(Data);
    if (ACK === 1) Stop;
    else $display("Error! No Write ACK received");
    $display("%t Write I2C: Addr[%d] = %b ( %d )", $time, Addr, Data, Data);
end
endtask

//========================================
task Rd_1Byte;
input   [7:0]   Addr;
begin
    Start;
    Wr_SlvID(SlvID, WR);
    Wr_Data(Addr);
    Stop;
    Start;
    Wr_SlvID(SlvID, RD);
    Rd_Data(Rd_Mem[Addr&8'h7f], 1);
    $display("%t Read I2C : Addr[%d] = %b ( %d ) ", $time, Addr&8'h7f, Rd_Mem[Addr&8'h7f], Rd_Mem[Addr&8'h7f]);
    Stop;
end
endtask
