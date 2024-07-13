`timescale 1ns/1ps
module lcell(
   in,
   out
   );

input   in;
output  out;

assign #(0.3) out =  in;

endmodule
