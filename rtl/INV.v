module INV(in, out);

input   in;
output  out;

assign #(0.5) out = ~in;

endmodule
