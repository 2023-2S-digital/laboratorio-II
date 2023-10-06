//  A testbench for MedioSumador_tb
`timescale 1us/1ns

module MedioSumador_tb;
    reg A;
    reg B;
    wire Cout;
    wire Suma;

  MedioSumador MedioSumador0 (
    .A(A),
    .B(B),
    .Cout(Cout),
    .Suma(Suma)
  );

    reg [3:0] patterns[0:3];
    integer i;

    initial begin
      patterns[0] = 4'b0_0_0_0;
      patterns[1] = 4'b0_1_0_1;
      patterns[2] = 4'b1_0_0_1;
      patterns[3] = 4'b1_1_1_0;

      for (i = 0; i < 4; i = i + 1)
      begin
        A = patterns[i][3];
        B = patterns[i][2];
        #10;
        if (patterns[i][1] !== 1'hx)
        begin
          if (Cout !== patterns[i][1])
          begin
            $display("%d:Cout: (assertion error). Expected %h, found %h", i, patterns[i][1], Cout);
            $finish;
          end
        end
        if (patterns[i][0] !== 1'hx)
        begin
          if (Suma !== patterns[i][0])
          begin
            $display("%d:Suma: (assertion error). Expected %h, found %h", i, patterns[i][0], Suma);
            $finish;
          end
        end
      end

      $display("All tests passed.");
    end
      initial
  begin
    $dumpfile("Mediotop.vcd");
    $dumpvars(0, MedioSumador_tb);
  end
    endmodule
