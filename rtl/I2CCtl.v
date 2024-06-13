module I2CCtl(
/*AUTOARG*/
   // Outputs
   SDAo, ADDR, REC_D, D_VAL,
   // Inputs
   SCL, SDA, SCL_inv, SDA_inv, SCL_din, SDA_din, rst_n, xmit_data
   );

input           SCL;
input           SDA;
input           SCL_inv;
input           SDA_inv;
input           SCL_din;
input           SDA_din;
input           rst_n;
input   [7:0]   xmit_data;

output          SDAo;
output  [6:0]   ADDR;
output  [7:0]   REC_D;
output          D_VAL;

parameter SM_IDLE       = 0 , St_SM_IDLE       = 5'b0_0001;
parameter SM_READ       = 1 , St_SM_READ       = 5'b0_0010;
parameter SM_WRITE      = 2 , St_SM_WRITE      = 5'b0_0100;
parameter SM_WRITE_ADDP = 3 , St_SM_WRITE_ADDP = 5'b0_1000;
parameter SM_NOT_ME     = 4 , St_SM_NOT_ME     = 5'b1_0000;

parameter SL_ADDR = 7'h77;

//reg declaration
reg [3:0] bit_cnt;
reg [4:0] sm;
reg       RNW;
reg       D_VAL;
reg [7:0] addp;
reg       drive_ack;
reg       detect_s;
reg       detect_p;
reg [7:0] rec_data;
reg [7:0] xmit_shift;

//wire declaration
wire      sda_down_xmit;

//
assign ADDR  = addp;
assign REC_D = rec_data;

// bit count, state machine
assign rst_n_sm = rst_n & ~detect_s & ~detect_p;
always@(posedge SCL or negedge rst_n_sm) 
begin
    if(~rst_n_sm)
    begin
        bit_cnt     <= 4'b0000;
        sm          <= St_SM_IDLE;
        RNW         <= 1'b1;
    end
    else
    begin
        // count from 0 to 8
        if(bit_cnt[3])  bit_cnt <= 4'b0000;
        else            bit_cnt <= bit_cnt + 4'b0001;

        if(bit_cnt != 4'b1000)
        begin
            RNW     <= RNW;
            sm      <= sm;
        end
        else
        begin
            case(sm)
                St_SM_IDLE:
                begin
                    if(rec_data[7:1] == SL_ADDR[6:0])
                    begin
                        if(rec_data[0] == 1'b1)
                        begin
                            RNW <= 1'b1;
                            sm  <= St_SM_READ;
                        end
                        else
                        begin
                            RNW <= 1'b1;
                            sm  <= St_SM_WRITE_ADDP;
                        end
                    end
                    else
                    begin
                        RNW <= 1'b1;
                        sm  <= St_SM_NOT_ME;
                    end
                end
                St_SM_READ:
                begin
                    RNW <= 1'b1;
                    if(SDA_din) // master not ack
                        sm  <= St_SM_NOT_ME;
                    else // master ack
                        sm  <= St_SM_READ;
                end
                St_SM_WRITE_ADDP:
                begin
                    RNW <= 1'b0;
                    sm  <= St_SM_WRITE;
                end
                St_SM_WRITE:
                begin
                    RNW <= 1'b0;
                    sm  <= St_SM_WRITE;
                end
                default:
                begin
                    RNW <= RNW;
                    sm  <= St_SM_NOT_ME;
                end
            endcase
        end
    end
end

always@(posedge SCL_inv or negedge rst_n_sm)
begin
    if(!rst_n_sm)
        D_VAL <= 1'b0;
    else
    begin
        if(bit_cnt[3:0] == 4'b1000 && RNW == 1'b0 && sm[SM_WRITE])
            D_VAL <= 1'b1;
        else
            D_VAL <= 1'b0;
    end
end

// addp: address pointer
always @(posedge SCL or negedge rst_n)
    if(~rst_n)
        addp[7:0] <= 8'b0000_0000;
    else if((bit_cnt[3:0] == 4'b1000) & sm[SM_WRITE_ADDP])
        addp[7:0] <= rec_data[7:0];

always @(posedge SCL_inv or negedge rst_n)
begin
    if(!rst_n)  drive_ack <= 1'b0;
    else        drive_ack <= bit_cnt[3:0] == 4'b1000 && (
                             // ACK slave address
                             (sm[SM_IDLE] && (rec_data[7:1] == SL_ADDR[6:0])) ||
                             // ACK address pointer write
                             sm[SM_WRITE_ADDP] ||
                             // ACK data write
                             sm[SM_WRITE] 
                            );
end

// actively drive low, passively high
assign Tx_out = sm[SM_READ] ? sda_down_xmit : 1'b1;
assign SDAo = !drive_ack & Tx_out;

// detect_s, detect_p
// I2C start/stop event detection
assign rst_n_s = rst_n & SCL_din;
always@(posedge SDA_inv or negedge rst_n_s)
    if(rst_n_s)
        detect_s <= 1'b0;
    else
        detect_s <= SCL_din;

assign rst_n_p = rst_n & SCL_din & ~detect_s;
always@(posedge SDA or negedge rst_n_p)
    if(rst_n_p)
        detect_p <= 1'b0;
    else
        detect_p <= SCL_din;

// received data
always @(posedge SCL or negedge rst_n)
begin
    if(!rst_n)
        rec_data[7:0] <= 8'h00;
    else
        if(bit_cnt[3])
            rec_data[7:0] <= rec_data[7:0];
        else
            rec_data[7:0] <= {rec_data[6:0], SDA_din};
end

// transmit shifter
assign rst_n_sf = rst_n & ~detect_s & ~detect_p;
always @(posedge SCL_inv or  negedge rst_n_sf)
begin
    if(~rst_n_sf)
        xmit_shift[7:0] <= 8'hff;
    else
        if(bit_cnt[3:0] == 4'b0000)
            xmit_shift[7:0] <= xmit_data[7:0];
        else
            xmit_shift[7:0] <= {xmit_shift[6:0], 1'b1};
end

assign sda_down_xmit = xmit_shift[7];

endmodule
