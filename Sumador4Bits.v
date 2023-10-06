module MedioSumador (
  input A,
  input B,
  output S,
  output Co
);
  assign S = (A ^ B);
  assign Co = (A & B);
endmodule

module SumadorCompleto (
  input Cin,
  input A,
  input B,
  output St,
  output Cout
);
  wire s0;
  wire s1;
  wire s2;
  MedioSumador MedioSumador_i0 (
    .A( A ),
    .B( B ),
    .S( s0 ),
    .Co( s1 )
  );
  MedioSumador MedioSumador_i1 (
    .A( s0 ),
    .B( Cin ),
    .S( St ),
    .Co( s2 )
  );
  assign Cout = (s2 | s1);
endmodule

module Sumador4Bits (
  input Cin,
  input a0,
  input b0,
  input a1,
  input b1,
  input a2,
  input b2,
  input a3,
  input b3,
  output s0,
  output s1,
  output s2,
  output s3,
  output cout
);
  wire s4;
  wire s5;
  wire s6;
  SumadorCompleto SumadorCompleto_i0 (
    .Cin( Cin ),
    .A( a0 ),
    .B( b0 ),
    .St( s0 ),
    .Cout( s4 )
  );
  SumadorCompleto SumadorCompleto_i1 (
    .Cin( s4 ),
    .A( a1 ),
    .B( b1 ),
    .St( s1 ),
    .Cout( s5 )
  );
  SumadorCompleto SumadorCompleto_i2 (
    .Cin( s5 ),
    .A( a2 ),
    .B( b2 ),
    .St( s2 ),
    .Cout( s6 )
  );
  SumadorCompleto SumadorCompleto_i3 (
    .Cin( s6 ),
    .A( a3 ),
    .B( b3 ),
    .St( s3 ),
    .Cout( cout )
  );
endmodule
