//  A testbench for SumadorCompleto_tb
`timescale 1us/1ns

module SumadorCompleto_tb;
    reg Cin;
    reg A;
    reg B;
    wire St;
    wire Cout;

  SumadorCompleto SumadorCompleto0 (
    .Cin(Cin),
    .A(A),
    .B(B),
    .St(St),
    .Cout(Cout)
  );

    reg [4:0] patterns[0:7];
    integer i;

    initial begin
      patterns[0] = 5'b0_0_0_0_0;
      patterns[1] = 5'b0_0_1_1_0;
      patterns[2] = 5'b0_1_0_1_0;
      patterns[3] = 5'b0_1_1_0_1;
      patterns[4] = 5'b1_0_0_1_0;
      patterns[5] = 5'b1_0_1_0_1;
      patterns[6] = 5'b1_1_0_0_1;
      patterns[7] = 5'b1_1_1_1_1;

      for (i = 0; i < 8; i = i + 1)
      begin
        Cin = patterns[i][4];
        A = patterns[i][3];
        B = patterns[i][2];
        #10;
        if (patterns[i][1] !== 1'hx)
        begin
          if (St !== patterns[i][1])
          begin
            $display("%d:St: (assertion error). Expected %h, found %h", i, patterns[i][1], St);
            $finish;
          end
        end
        if (patterns[i][0] !== 1'hx)
        begin
          if (Cout !== patterns[i][0])
          begin
            $display("%d:Cout: (assertion error). Expected %h, found %h", i, patterns[i][0], Cout);
            $finish;
          end
        end
      end

      $display("All tests passed.");
    end
initial
  begin
    $dumpfile("SumadorCompleto.vcd");
    $dumpvars(0, SumadorCompleto_tb);
  end
    endmodule
