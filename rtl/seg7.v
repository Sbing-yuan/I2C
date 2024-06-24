// Common Annode Seven Segement display
module seg7(
/*AUTOARG*/
   // Outputs
   a, b, c, d, e, f, g, dp, D1_sel, D2_sel, D3_sel, D4_sel,
   // Inputs
   num1, num2, num3, num4, scan_clk, rst_n
   );

output          a;
output          b;
output          c;
output          d;
output          e;
output          f;
output          g;
output          dp;
output          D1_sel;
output          D2_sel;
output          D3_sel;
output          D4_sel;
input   [3:0]   num1;
input   [3:0]   num2;
input   [3:0]   num3;
input   [3:0]   num4;
input           scan_clk;
input           rst_n;

reg     [6:0]   code;
reg             D1_sel;
reg             D2_sel;
reg             D3_sel;
reg             D4_sel;
wire    [3:0]   num_sel;

always@(posedge scan_clk or negedge rst_n)
    if(~rst_n)
        {D1_sel, D2_sel, D3_sel, D4_sel}  <= 4'b1110;
    else
        {D1_sel, D2_sel, D3_sel, D4_sel}  <= {D2_sel, D3_sel, D4_sel, D1_sel};

assign {a,b,c,d,e,f,g} = code[6:0];
assign dp = 1; // disable

assign num_sel =  (D4_sel == 1'b0) ? num4 : 
                  (D3_sel == 1'b0) ? num3 : 
                  (D2_sel == 1'b0) ? num2 : 
                  (D1_sel == 1'b0) ? num1 : num4;

always@(*)
begin
    case(num_sel[3:0])
    4'h0: code = 7'b000_0001;
    4'h1: code = 7'b100_1111;
    4'h2: code = 7'b001_0010;
    4'h3: code = 7'b000_0110;
    4'h4: code = 7'b100_1100;
    4'h5: code = 7'b010_0100;
    4'h6: code = 7'b010_0000;
    4'h7: code = 7'b000_1101;
    4'h8: code = 7'b000_0000;
    4'h9: code = 7'b000_1100;
    4'hA: code = 7'b000_1000;
    4'hB: code = 7'b110_0000;
    4'hC: code = 7'b011_0001;
    4'hD: code = 7'b100_0010;
    4'hE: code = 7'b011_0000;
    4'hF: code = 7'b011_1000;
    default: code = 7'b000_0000;
    endcase
end

endmodule
