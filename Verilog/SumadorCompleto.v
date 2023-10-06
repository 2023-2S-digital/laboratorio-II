module Mediosumador (
  input A,
  input B,
  output Suma,
  output Cout
);
  assign Suma = (A ^ B);
  assign Cout = (A & B);
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
  Mediosumador Mediosumador_i0 (
    .A( A ),
    .B( B ),
    .Suma( s0 ),
    .Cout( s1 )
  );
  Mediosumador Mediosumador_i1 (
    .A( s0 ),
    .B( Cin ),
    .Suma( St ),
    .Cout( s2 )
  );
  assign Cout = (s2 | s1);
endmodule
