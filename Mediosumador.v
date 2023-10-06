module MedioSumador (
  input A,
  input B,
  output Cout,
  output Suma
);
  assign Cout = (A & B);
  assign Suma = (A ^ B);
endmodule
