module regbank(
    store_data,
    rst_n,
    regbank_addr,
    regbank_wrdata,
    regbank_rddata
);

input store_data;
input rst_n;
input [6:0] regbank_addr;
input [7:0] regbank_wrdata;
output [7:0] regbank_rddata;

//------------------------------------------------------------------------------
reg [7:0] data_00, data_10, data_20, data_30, data_40, data_50, data_60, data_70;
reg [7:0] data_01, data_11, data_21, data_31, data_41, data_51, data_61, data_71;
reg [7:0] data_02, data_12, data_22, data_32, data_42, data_52, data_62, data_72;
reg [7:0] data_03, data_13, data_23, data_33, data_43, data_53, data_63, data_73;
reg [7:0] data_04, data_14, data_24, data_34, data_44, data_54, data_64, data_74;
reg [7:0] data_05, data_15, data_25, data_35, data_45, data_55, data_65, data_75;
reg [7:0] data_06, data_16, data_26, data_36, data_46, data_56, data_66, data_76;
reg [7:0] data_07, data_17, data_27, data_37, data_47, data_57, data_67, data_77;
reg [7:0] data_08, data_18, data_28, data_38, data_48, data_58, data_68, data_78;
reg [7:0] data_09, data_19, data_29, data_39, data_49, data_59, data_69, data_79;
reg [7:0] data_0A, data_1A, data_2A, data_3A, data_4A, data_5A, data_6A, data_7A;
reg [7:0] data_0B, data_1B, data_2B, data_3B, data_4B, data_5B, data_6B, data_7B;
reg [7:0] data_0C, data_1C, data_2C, data_3C, data_4C, data_5C, data_6C, data_7C;
reg [7:0] data_0D, data_1D, data_2D, data_3D, data_4D, data_5D, data_6D, data_7D;
reg [7:0] data_0E, data_1E, data_2E, data_3E, data_4E, data_5E, data_6E, data_7E;
reg [7:0] data_0F, data_1F, data_2F, data_3F, data_4F, data_5F, data_6F, data_7F;
reg [7:0] regbank_rddata;
//------------------------------------------------------------------------------
`include "../rtl/default.v"
//------------------------------------------------------------------------------

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_00 <= DEF_DATA00;
    else if (regbank_addr == 7'h00)         data_00 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_01 <= DEF_DATA01;
    else if (regbank_addr == 7'h01)         data_01 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_02 <= DEF_DATA02;
    else if (regbank_addr == 7'h02)         data_02 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_03 <= DEF_DATA03;
    else if (regbank_addr == 7'h03)         data_03 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_04 <= DEF_DATA04;
    else if (regbank_addr == 7'h04)         data_04 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_05 <= DEF_DATA05;
    else if (regbank_addr == 7'h05)         data_05 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_06 <= DEF_DATA06;
    else if (regbank_addr == 7'h06)         data_06 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_07 <= DEF_DATA07;
    else if (regbank_addr == 7'h07)         data_07 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_08 <= DEF_DATA08;
    else if (regbank_addr == 7'h08)         data_08 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_09 <= DEF_DATA09;
    else if (regbank_addr == 7'h09)         data_09 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_0A <= DEF_DATA0A;
    else if (regbank_addr == 7'h0A)         data_0A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_0B <= DEF_DATA0B;
    else if (regbank_addr == 7'h0B)         data_0B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_0C <= DEF_DATA0C;
    else if (regbank_addr == 7'h0C)         data_0C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_0D <= DEF_DATA0D;
    else if (regbank_addr == 7'h0D)         data_0D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_0E <= DEF_DATA0E;
    else if (regbank_addr == 7'h0E)         data_0E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_0F <= DEF_DATA0F;
    else if (regbank_addr == 7'h0F)         data_0F <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_10 <= DEF_DATA10;
    else if (regbank_addr == 7'h10)         data_10 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_11 <= DEF_DATA11;
    else if (regbank_addr == 7'h11)         data_11 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_12 <= DEF_DATA12;
    else if (regbank_addr == 7'h12)         data_12 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_13 <= DEF_DATA13;
    else if (regbank_addr == 7'h13)         data_13 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_14 <= DEF_DATA14;
    else if (regbank_addr == 7'h14)         data_14 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_15 <= DEF_DATA15;
    else if (regbank_addr == 7'h15)         data_15 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_16 <= DEF_DATA16;
    else if (regbank_addr == 7'h16)         data_16 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_17 <= DEF_DATA17;
    else if (regbank_addr == 7'h17)         data_17 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_18 <= DEF_DATA18;
    else if (regbank_addr == 7'h18)         data_18 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_19 <= DEF_DATA19;
    else if (regbank_addr == 7'h19)         data_19 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_1A <= DEF_DATA1A;
    else if (regbank_addr == 7'h1A)         data_1A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_1B <= DEF_DATA1B;
    else if (regbank_addr == 7'h1B)         data_1B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_1C <= DEF_DATA1C;
    else if (regbank_addr == 7'h1C)         data_1C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_1D <= DEF_DATA1D;
    else if (regbank_addr == 7'h1D)         data_1D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_1E <= DEF_DATA1E;
    else if (regbank_addr == 7'h1E)         data_1E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_1F <= DEF_DATA1F;
    else if (regbank_addr == 7'h1F)         data_1F <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_20 <= DEF_DATA20;
    else if (regbank_addr == 7'h20)         data_20 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_21 <= DEF_DATA21;
    else if (regbank_addr == 7'h21)         data_21 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_22 <= DEF_DATA22;
    else if (regbank_addr == 7'h22)         data_22 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_23 <= DEF_DATA23;
    else if (regbank_addr == 7'h23)         data_23 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_24 <= DEF_DATA24;
    else if (regbank_addr == 7'h24)         data_24 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_25 <= DEF_DATA25;
    else if (regbank_addr == 7'h25)         data_25 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_26 <= DEF_DATA26;
    else if (regbank_addr == 7'h26)         data_26 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_27 <= DEF_DATA27;
    else if (regbank_addr == 7'h27)         data_27 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_28 <= DEF_DATA28;
    else if (regbank_addr == 7'h28)         data_28 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_29 <= DEF_DATA29;
    else if (regbank_addr == 7'h29)         data_29 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_2A <= DEF_DATA2A;
    else if (regbank_addr == 7'h2A)         data_2A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_2B <= DEF_DATA2B;
    else if (regbank_addr == 7'h2B)         data_2B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_2C <= DEF_DATA2C;
    else if (regbank_addr == 7'h2C)         data_2C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_2D <= DEF_DATA2D;
    else if (regbank_addr == 7'h2D)         data_2D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_2E <= DEF_DATA2E;
    else if (regbank_addr == 7'h2E)         data_2E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_2F <= DEF_DATA2F;
    else if (regbank_addr == 7'h2F)         data_2F <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_30 <= DEF_DATA30;
    else if (regbank_addr == 7'h30)         data_30 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_31 <= DEF_DATA31;
    else if (regbank_addr == 7'h31)         data_31 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_32 <= DEF_DATA32;
    else if (regbank_addr == 7'h32)         data_32 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_33 <= DEF_DATA33;
    else if (regbank_addr == 7'h33)         data_33 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_34 <= DEF_DATA34;
    else if (regbank_addr == 7'h34)         data_34 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_35 <= DEF_DATA35;
    else if (regbank_addr == 7'h35)         data_35 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_36 <= DEF_DATA36;
    else if (regbank_addr == 7'h36)         data_36 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_37 <= DEF_DATA37;
    else if (regbank_addr == 7'h37)         data_37 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_38 <= DEF_DATA38;
    else if (regbank_addr == 7'h38)         data_38 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_39 <= DEF_DATA39;
    else if (regbank_addr == 7'h39)         data_39 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_3A <= DEF_DATA3A;
    else if (regbank_addr == 7'h3A)         data_3A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_3B <= DEF_DATA3B;
    else if (regbank_addr == 7'h3B)         data_3B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_3C <= DEF_DATA3C;
    else if (regbank_addr == 7'h3C)         data_3C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_3D <= DEF_DATA3D;
    else if (regbank_addr == 7'h3D)         data_3D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_3E <= DEF_DATA3E;
    else if (regbank_addr == 7'h3E)         data_3E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_3F <= DEF_DATA3F;
    else if (regbank_addr == 7'h3F)         data_3F <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_40 <= DEF_DATA40;
    else if (regbank_addr == 7'h40)         data_40 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_41 <= DEF_DATA41;
    else if (regbank_addr == 7'h41)         data_41 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_42 <= DEF_DATA42;
    else if (regbank_addr == 7'h42)         data_42 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_43 <= DEF_DATA43;
    else if (regbank_addr == 7'h43)         data_43 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_44 <= DEF_DATA44;
    else if (regbank_addr == 7'h44)         data_44 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_45 <= DEF_DATA45;
    else if (regbank_addr == 7'h45)         data_45 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_46 <= DEF_DATA46;
    else if (regbank_addr == 7'h46)         data_46 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_47 <= DEF_DATA47;
    else if (regbank_addr == 7'h47)         data_47 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_48 <= DEF_DATA48;
    else if (regbank_addr == 7'h48)         data_48 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_49 <= DEF_DATA49;
    else if (regbank_addr == 7'h49)         data_49 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_4A <= DEF_DATA4A;
    else if (regbank_addr == 7'h4A)         data_4A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_4B <= DEF_DATA4B;
    else if (regbank_addr == 7'h4B)         data_4B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_4C <= DEF_DATA4C;
    else if (regbank_addr == 7'h4C)         data_4C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_4D <= DEF_DATA4D;
    else if (regbank_addr == 7'h4D)         data_4D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_4E <= DEF_DATA4E;
    else if (regbank_addr == 7'h4E)         data_4E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_4F <= DEF_DATA4F;
    else if (regbank_addr == 7'h4F)         data_4F <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_50 <= DEF_DATA50;
    else if (regbank_addr == 7'h50)         data_50 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_51 <= DEF_DATA51;
    else if (regbank_addr == 7'h51)         data_51 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_52 <= DEF_DATA52;
    else if (regbank_addr == 7'h52)         data_52 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_53 <= DEF_DATA53;
    else if (regbank_addr == 7'h53)         data_53 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_54 <= DEF_DATA54;
    else if (regbank_addr == 7'h54)         data_54 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_55 <= DEF_DATA55;
    else if (regbank_addr == 7'h55)         data_55 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_56 <= DEF_DATA56;
    else if (regbank_addr == 7'h56)         data_56 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_57 <= DEF_DATA57;
    else if (regbank_addr == 7'h57)         data_57 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_58 <= DEF_DATA58;
    else if (regbank_addr == 7'h58)         data_58 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_59 <= DEF_DATA59;
    else if (regbank_addr == 7'h59)         data_59 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_5A <= DEF_DATA5A;
    else if (regbank_addr == 7'h5A)         data_5A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_5B <= DEF_DATA5B;
    else if (regbank_addr == 7'h5B)         data_5B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_5C <= DEF_DATA5C;
    else if (regbank_addr == 7'h5C)         data_5C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_5D <= DEF_DATA5D;
    else if (regbank_addr == 7'h5D)         data_5D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_5E <= DEF_DATA5E;
    else if (regbank_addr == 7'h5E)         data_5E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_5F <= DEF_DATA5F;
    else if (regbank_addr == 7'h5F)         data_5F <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_60 <= DEF_DATA60;
    else if (regbank_addr == 7'h60)         data_60 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_61 <= DEF_DATA61;
    else if (regbank_addr == 7'h61)         data_61 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_62 <= DEF_DATA62;
    else if (regbank_addr == 7'h62)         data_62 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_63 <= DEF_DATA63;
    else if (regbank_addr == 7'h63)         data_63 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_64 <= DEF_DATA64;
    else if (regbank_addr == 7'h64)         data_64 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_65 <= DEF_DATA65;
    else if (regbank_addr == 7'h65)         data_65 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_66 <= DEF_DATA66;
    else if (regbank_addr == 7'h66)         data_66 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_67 <= DEF_DATA67;
    else if (regbank_addr == 7'h67)         data_67 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_68 <= DEF_DATA68;
    else if (regbank_addr == 7'h68)         data_68 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_69 <= DEF_DATA69;
    else if (regbank_addr == 7'h69)         data_69 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_6A <= DEF_DATA6A;
    else if (regbank_addr == 7'h6A)         data_6A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_6B <= DEF_DATA6B;
    else if (regbank_addr == 7'h6B)         data_6B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_6C <= DEF_DATA6C;
    else if (regbank_addr == 7'h6C)         data_6C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_6D <= DEF_DATA6D;
    else if (regbank_addr == 7'h6D)         data_6D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_6E <= DEF_DATA6E;
    else if (regbank_addr == 7'h6E)         data_6E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_6F <= DEF_DATA6F;
    else if (regbank_addr == 7'h6F)         data_6F <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_70 <= DEF_DATA70;
    else if (regbank_addr == 7'h70)         data_70 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_71 <= DEF_DATA71;
    else if (regbank_addr == 7'h71)         data_71 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_72 <= DEF_DATA72;
    else if (regbank_addr == 7'h72)         data_72 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_73 <= DEF_DATA73;
    else if (regbank_addr == 7'h73)         data_73 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_74 <= DEF_DATA74;
    else if (regbank_addr == 7'h74)         data_74 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_75 <= DEF_DATA75;
    else if (regbank_addr == 7'h75)         data_75 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_76 <= DEF_DATA76;
    else if (regbank_addr == 7'h76)         data_76 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_77 <= DEF_DATA77;
    else if (regbank_addr == 7'h77)         data_77 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_78 <= DEF_DATA78;
    else if (regbank_addr == 7'h78)         data_78 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_79 <= DEF_DATA79;
    else if (regbank_addr == 7'h79)         data_79 <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_7A <= DEF_DATA7A;
    else if (regbank_addr == 7'h7A)         data_7A <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_7B <= DEF_DATA7B;
    else if (regbank_addr == 7'h7B)         data_7B <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_7C <= DEF_DATA7C;
    else if (regbank_addr == 7'h7C)         data_7C <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_7D <= DEF_DATA7D;
    else if (regbank_addr == 7'h7D)         data_7D <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_7E <= DEF_DATA7E;
    else if (regbank_addr == 7'h7E)         data_7E <= regbank_wrdata;

always@(posedge store_data or negedge rst_n)
    if(~rst_n)                              data_7F <= DEF_DATA7F;
    else if (regbank_addr == 7'h7F)         data_7F <= regbank_wrdata;

always@(*)
begin
    case(regbank_addr)
        7'h00: regbank_rddata = data_00;
        7'h01: regbank_rddata = data_01;
        7'h02: regbank_rddata = data_02;
        7'h03: regbank_rddata = data_03;
        7'h04: regbank_rddata = data_04;
        7'h05: regbank_rddata = data_05;
        7'h06: regbank_rddata = data_06;
        7'h07: regbank_rddata = data_07;
        7'h08: regbank_rddata = data_08;
        7'h09: regbank_rddata = data_09;
        7'h0A: regbank_rddata = data_0A;
        7'h0B: regbank_rddata = data_0B;
        7'h0C: regbank_rddata = data_0C;
        7'h0D: regbank_rddata = data_0D;
        7'h0E: regbank_rddata = data_0E;
        7'h0F: regbank_rddata = data_0F;
        7'h10: regbank_rddata = data_10;
        7'h11: regbank_rddata = data_11;
        7'h12: regbank_rddata = data_12;
        7'h13: regbank_rddata = data_13;
        7'h14: regbank_rddata = data_14;
        7'h15: regbank_rddata = data_15;
        7'h16: regbank_rddata = data_16;
        7'h17: regbank_rddata = data_17;
        7'h18: regbank_rddata = data_18;
        7'h19: regbank_rddata = data_19;
        7'h1A: regbank_rddata = data_1A;
        7'h1B: regbank_rddata = data_1B;
        7'h1C: regbank_rddata = data_1C;
        7'h1D: regbank_rddata = data_1D;
        7'h1E: regbank_rddata = data_1E;
        7'h1F: regbank_rddata = data_1F;
        7'h20: regbank_rddata = data_20;
        7'h21: regbank_rddata = data_21;
        7'h22: regbank_rddata = data_22;
        7'h23: regbank_rddata = data_23;
        7'h24: regbank_rddata = data_24;
        7'h25: regbank_rddata = data_25;
        7'h26: regbank_rddata = data_26;
        7'h27: regbank_rddata = data_27;
        7'h28: regbank_rddata = data_28;
        7'h29: regbank_rddata = data_29;
        7'h2A: regbank_rddata = data_2A;
        7'h2B: regbank_rddata = data_2B;
        7'h2C: regbank_rddata = data_2C;
        7'h2D: regbank_rddata = data_2D;
        7'h2E: regbank_rddata = data_2E;
        7'h2F: regbank_rddata = data_2F;
        7'h30: regbank_rddata = data_30;
        7'h31: regbank_rddata = data_31;
        7'h32: regbank_rddata = data_32;
        7'h33: regbank_rddata = data_33;
        7'h34: regbank_rddata = data_34;
        7'h35: regbank_rddata = data_35;
        7'h36: regbank_rddata = data_36;
        7'h37: regbank_rddata = data_37;
        7'h38: regbank_rddata = data_38;
        7'h39: regbank_rddata = data_39;
        7'h3A: regbank_rddata = data_3A;
        7'h3B: regbank_rddata = data_3B;
        7'h3C: regbank_rddata = data_3C;
        7'h3D: regbank_rddata = data_3D;
        7'h3E: regbank_rddata = data_3E;
        7'h3F: regbank_rddata = data_3F;
        7'h40: regbank_rddata = data_40;
        7'h41: regbank_rddata = data_41;
        7'h42: regbank_rddata = data_42;
        7'h43: regbank_rddata = data_43;
        7'h44: regbank_rddata = data_44;
        7'h45: regbank_rddata = data_45;
        7'h46: regbank_rddata = data_46;
        7'h47: regbank_rddata = data_47;
        7'h48: regbank_rddata = data_48;
        7'h49: regbank_rddata = data_49;
        7'h4A: regbank_rddata = data_4A;
        7'h4B: regbank_rddata = data_4B;
        7'h4C: regbank_rddata = data_4C;
        7'h4D: regbank_rddata = data_4D;
        7'h4E: regbank_rddata = data_4E;
        7'h4F: regbank_rddata = data_4F;
        7'h50: regbank_rddata = data_50;
        7'h51: regbank_rddata = data_51;
        7'h52: regbank_rddata = data_52;
        7'h53: regbank_rddata = data_53;
        7'h54: regbank_rddata = data_54;
        7'h55: regbank_rddata = data_55;
        7'h56: regbank_rddata = data_56;
        7'h57: regbank_rddata = data_57;
        7'h58: regbank_rddata = data_58;
        7'h59: regbank_rddata = data_59;
        7'h5A: regbank_rddata = data_5A;
        7'h5B: regbank_rddata = data_5B;
        7'h5C: regbank_rddata = data_5C;
        7'h5D: regbank_rddata = data_5D;
        7'h5E: regbank_rddata = data_5E;
        7'h5F: regbank_rddata = data_5F;
        7'h60: regbank_rddata = data_60;
        7'h61: regbank_rddata = data_61;
        7'h62: regbank_rddata = data_62;
        7'h63: regbank_rddata = data_63;
        7'h64: regbank_rddata = data_64;
        7'h65: regbank_rddata = data_65;
        7'h66: regbank_rddata = data_66;
        7'h67: regbank_rddata = data_67;
        7'h68: regbank_rddata = data_68;
        7'h69: regbank_rddata = data_69;
        7'h6A: regbank_rddata = data_6A;
        7'h6B: regbank_rddata = data_6B;
        7'h6C: regbank_rddata = data_6C;
        7'h6D: regbank_rddata = data_6D;
        7'h6E: regbank_rddata = data_6E;
        7'h6F: regbank_rddata = data_6F;
        7'h70: regbank_rddata = data_70;
        7'h71: regbank_rddata = data_71;
        7'h72: regbank_rddata = data_72;
        7'h73: regbank_rddata = data_73;
        7'h74: regbank_rddata = data_74;
        7'h75: regbank_rddata = data_75;
        7'h76: regbank_rddata = data_76;
        7'h77: regbank_rddata = data_77;
        7'h78: regbank_rddata = data_78;
        7'h79: regbank_rddata = data_79;
        7'h7A: regbank_rddata = data_7A;
        7'h7B: regbank_rddata = data_7B;
        7'h7C: regbank_rddata = data_7C;
        7'h7D: regbank_rddata = data_7D;
        7'h7E: regbank_rddata = data_7E;
        7'h7F: regbank_rddata = data_7F;
        default: ;
    endcase
end

endmodule
