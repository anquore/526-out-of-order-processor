
module enableD_FF ( q, d, reset, enable, clk );
  input d, reset, enable, clk;
  output q;
  wire   n1;

  EDFKCNQD1 \theFlop/q_reg  ( .CN(n1), .D(d), .E(enable), .CP(clk), .Q(q) );
  CKND0 U1 ( .I(reset), .ZN(n1) );
endmodule

