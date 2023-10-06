//  A testbench for Sumador4Bits_sumador4bits_tb
`timescale 1us/1ns

module Sumador4Bits_sumador4bits_tb;
    reg Cin;
    reg a0;
    reg b0;
    reg a1;
    reg b1;
    reg a2;
    reg b2;
    reg a3;
    reg b3;
    wire s0;
    wire s1;
    wire s2;
    wire s3;
    wire cout;

  Sumador4Bits Sumador4Bits0 (
    .Cin(Cin),
    .a0(a0),
    .b0(b0),
    .a1(a1),
    .b1(b1),
    .a2(a2),
    .b2(b2),
    .a3(a3),
    .b3(b3),
    .s0(s0),
    .s1(s1),
    .s2(s2),
    .s3(s3),
    .cout(cout)
  );

    reg [13:0] patterns[0:511];
    integer i;

    initial begin
      patterns[0] = 14'b0_0_0_0_0_0_0_0_0_0_0_0_0_0;
      patterns[1] = 14'b0_0_0_0_0_0_0_0_1_0_0_0_1_0;
      patterns[2] = 14'b0_0_0_0_0_0_0_1_0_0_0_0_1_0;
      patterns[3] = 14'b0_0_0_0_0_0_0_1_1_0_0_0_0_1;
      patterns[4] = 14'b0_0_0_0_0_0_1_0_0_0_0_1_0_0;
      patterns[5] = 14'b0_0_0_0_0_0_1_0_1_0_0_1_1_0;
      patterns[6] = 14'b0_0_0_0_0_0_1_1_0_0_0_1_1_0;
      patterns[7] = 14'b0_0_0_0_0_0_1_1_1_0_0_1_0_1;
      patterns[8] = 14'b0_0_0_0_0_1_0_0_0_0_0_1_0_0;
      patterns[9] = 14'b0_0_0_0_0_1_0_0_1_0_0_1_1_0;
      patterns[10] = 14'b0_0_0_0_0_1_0_1_0_0_0_1_1_0;
      patterns[11] = 14'b0_0_0_0_0_1_0_1_1_0_0_1_0_1;
      patterns[12] = 14'b0_0_0_0_0_1_1_0_0_0_0_0_1_0;
      patterns[13] = 14'b0_0_0_0_0_1_1_0_1_0_0_0_0_1;
      patterns[14] = 14'b0_0_0_0_0_1_1_1_0_0_0_0_0_1;
      patterns[15] = 14'b0_0_0_0_0_1_1_1_1_0_0_0_1_1;
      patterns[16] = 14'b0_0_0_0_1_0_0_0_0_0_1_0_0_0;
      patterns[17] = 14'b0_0_0_0_1_0_0_0_1_0_1_0_1_0;
      patterns[18] = 14'b0_0_0_0_1_0_0_1_0_0_1_0_1_0;
      patterns[19] = 14'b0_0_0_0_1_0_0_1_1_0_1_0_0_1;
      patterns[20] = 14'b0_0_0_0_1_0_1_0_0_0_1_1_0_0;
      patterns[21] = 14'b0_0_0_0_1_0_1_0_1_0_1_1_1_0;
      patterns[22] = 14'b0_0_0_0_1_0_1_1_0_0_1_1_1_0;
      patterns[23] = 14'b0_0_0_0_1_0_1_1_1_0_1_1_0_1;
      patterns[24] = 14'b0_0_0_0_1_1_0_0_0_0_1_1_0_0;
      patterns[25] = 14'b0_0_0_0_1_1_0_0_1_0_1_1_1_0;
      patterns[26] = 14'b0_0_0_0_1_1_0_1_0_0_1_1_1_0;
      patterns[27] = 14'b0_0_0_0_1_1_0_1_1_0_1_1_0_1;
      patterns[28] = 14'b0_0_0_0_1_1_1_0_0_0_1_0_1_0;
      patterns[29] = 14'b0_0_0_0_1_1_1_0_1_0_1_0_0_1;
      patterns[30] = 14'b0_0_0_0_1_1_1_1_0_0_1_0_0_1;
      patterns[31] = 14'b0_0_0_0_1_1_1_1_1_0_1_0_1_1;
      patterns[32] = 14'b0_0_0_1_0_0_0_0_0_0_1_0_0_0;
      patterns[33] = 14'b0_0_0_1_0_0_0_0_1_0_1_0_1_0;
      patterns[34] = 14'b0_0_0_1_0_0_0_1_0_0_1_0_1_0;
      patterns[35] = 14'b0_0_0_1_0_0_0_1_1_0_1_0_0_1;
      patterns[36] = 14'b0_0_0_1_0_0_1_0_0_0_1_1_0_0;
      patterns[37] = 14'b0_0_0_1_0_0_1_0_1_0_1_1_1_0;
      patterns[38] = 14'b0_0_0_1_0_0_1_1_0_0_1_1_1_0;
      patterns[39] = 14'b0_0_0_1_0_0_1_1_1_0_1_1_0_1;
      patterns[40] = 14'b0_0_0_1_0_1_0_0_0_0_1_1_0_0;
      patterns[41] = 14'b0_0_0_1_0_1_0_0_1_0_1_1_1_0;
      patterns[42] = 14'b0_0_0_1_0_1_0_1_0_0_1_1_1_0;
      patterns[43] = 14'b0_0_0_1_0_1_0_1_1_0_1_1_0_1;
      patterns[44] = 14'b0_0_0_1_0_1_1_0_0_0_1_0_1_0;
      patterns[45] = 14'b0_0_0_1_0_1_1_0_1_0_1_0_0_1;
      patterns[46] = 14'b0_0_0_1_0_1_1_1_0_0_1_0_0_1;
      patterns[47] = 14'b0_0_0_1_0_1_1_1_1_0_1_0_1_1;
      patterns[48] = 14'b0_0_0_1_1_0_0_0_0_0_0_1_0_0;
      patterns[49] = 14'b0_0_0_1_1_0_0_0_1_0_0_1_1_0;
      patterns[50] = 14'b0_0_0_1_1_0_0_1_0_0_0_1_1_0;
      patterns[51] = 14'b0_0_0_1_1_0_0_1_1_0_0_1_0_1;
      patterns[52] = 14'b0_0_0_1_1_0_1_0_0_0_0_0_1_0;
      patterns[53] = 14'b0_0_0_1_1_0_1_0_1_0_0_0_0_1;
      patterns[54] = 14'b0_0_0_1_1_0_1_1_0_0_0_0_0_1;
      patterns[55] = 14'b0_0_0_1_1_0_1_1_1_0_0_0_1_1;
      patterns[56] = 14'b0_0_0_1_1_1_0_0_0_0_0_0_1_0;
      patterns[57] = 14'b0_0_0_1_1_1_0_0_1_0_0_0_0_1;
      patterns[58] = 14'b0_0_0_1_1_1_0_1_0_0_0_0_0_1;
      patterns[59] = 14'b0_0_0_1_1_1_0_1_1_0_0_0_1_1;
      patterns[60] = 14'b0_0_0_1_1_1_1_0_0_0_0_1_1_0;
      patterns[61] = 14'b0_0_0_1_1_1_1_0_1_0_0_1_0_1;
      patterns[62] = 14'b0_0_0_1_1_1_1_1_0_0_0_1_0_1;
      patterns[63] = 14'b0_0_0_1_1_1_1_1_1_0_0_1_1_1;
      patterns[64] = 14'b0_0_1_0_0_0_0_0_0_1_0_0_0_0;
      patterns[65] = 14'b0_0_1_0_0_0_0_0_1_1_0_0_1_0;
      patterns[66] = 14'b0_0_1_0_0_0_0_1_0_1_0_0_1_0;
      patterns[67] = 14'b0_0_1_0_0_0_0_1_1_1_0_0_0_1;
      patterns[68] = 14'b0_0_1_0_0_0_1_0_0_1_0_1_0_0;
      patterns[69] = 14'b0_0_1_0_0_0_1_0_1_1_0_1_1_0;
      patterns[70] = 14'b0_0_1_0_0_0_1_1_0_1_0_1_1_0;
      patterns[71] = 14'b0_0_1_0_0_0_1_1_1_1_0_1_0_1;
      patterns[72] = 14'b0_0_1_0_0_1_0_0_0_1_0_1_0_0;
      patterns[73] = 14'b0_0_1_0_0_1_0_0_1_1_0_1_1_0;
      patterns[74] = 14'b0_0_1_0_0_1_0_1_0_1_0_1_1_0;
      patterns[75] = 14'b0_0_1_0_0_1_0_1_1_1_0_1_0_1;
      patterns[76] = 14'b0_0_1_0_0_1_1_0_0_1_0_0_1_0;
      patterns[77] = 14'b0_0_1_0_0_1_1_0_1_1_0_0_0_1;
      patterns[78] = 14'b0_0_1_0_0_1_1_1_0_1_0_0_0_1;
      patterns[79] = 14'b0_0_1_0_0_1_1_1_1_1_0_0_1_1;
      patterns[80] = 14'b0_0_1_0_1_0_0_0_0_1_1_0_0_0;
      patterns[81] = 14'b0_0_1_0_1_0_0_0_1_1_1_0_1_0;
      patterns[82] = 14'b0_0_1_0_1_0_0_1_0_1_1_0_1_0;
      patterns[83] = 14'b0_0_1_0_1_0_0_1_1_1_1_0_0_1;
      patterns[84] = 14'b0_0_1_0_1_0_1_0_0_1_1_1_0_0;
      patterns[85] = 14'b0_0_1_0_1_0_1_0_1_1_1_1_1_0;
      patterns[86] = 14'b0_0_1_0_1_0_1_1_0_1_1_1_1_0;
      patterns[87] = 14'b0_0_1_0_1_0_1_1_1_1_1_1_0_1;
      patterns[88] = 14'b0_0_1_0_1_1_0_0_0_1_1_1_0_0;
      patterns[89] = 14'b0_0_1_0_1_1_0_0_1_1_1_1_1_0;
      patterns[90] = 14'b0_0_1_0_1_1_0_1_0_1_1_1_1_0;
      patterns[91] = 14'b0_0_1_0_1_1_0_1_1_1_1_1_0_1;
      patterns[92] = 14'b0_0_1_0_1_1_1_0_0_1_1_0_1_0;
      patterns[93] = 14'b0_0_1_0_1_1_1_0_1_1_1_0_0_1;
      patterns[94] = 14'b0_0_1_0_1_1_1_1_0_1_1_0_0_1;
      patterns[95] = 14'b0_0_1_0_1_1_1_1_1_1_1_0_1_1;
      patterns[96] = 14'b0_0_1_1_0_0_0_0_0_1_1_0_0_0;
      patterns[97] = 14'b0_0_1_1_0_0_0_0_1_1_1_0_1_0;
      patterns[98] = 14'b0_0_1_1_0_0_0_1_0_1_1_0_1_0;
      patterns[99] = 14'b0_0_1_1_0_0_0_1_1_1_1_0_0_1;
      patterns[100] = 14'b0_0_1_1_0_0_1_0_0_1_1_1_0_0;
      patterns[101] = 14'b0_0_1_1_0_0_1_0_1_1_1_1_1_0;
      patterns[102] = 14'b0_0_1_1_0_0_1_1_0_1_1_1_1_0;
      patterns[103] = 14'b0_0_1_1_0_0_1_1_1_1_1_1_0_1;
      patterns[104] = 14'b0_0_1_1_0_1_0_0_0_1_1_1_0_0;
      patterns[105] = 14'b0_0_1_1_0_1_0_0_1_1_1_1_1_0;
      patterns[106] = 14'b0_0_1_1_0_1_0_1_0_1_1_1_1_0;
      patterns[107] = 14'b0_0_1_1_0_1_0_1_1_1_1_1_0_1;
      patterns[108] = 14'b0_0_1_1_0_1_1_0_0_1_1_0_1_0;
      patterns[109] = 14'b0_0_1_1_0_1_1_0_1_1_1_0_0_1;
      patterns[110] = 14'b0_0_1_1_0_1_1_1_0_1_1_0_0_1;
      patterns[111] = 14'b0_0_1_1_0_1_1_1_1_1_1_0_1_1;
      patterns[112] = 14'b0_0_1_1_1_0_0_0_0_1_0_1_0_0;
      patterns[113] = 14'b0_0_1_1_1_0_0_0_1_1_0_1_1_0;
      patterns[114] = 14'b0_0_1_1_1_0_0_1_0_1_0_1_1_0;
      patterns[115] = 14'b0_0_1_1_1_0_0_1_1_1_0_1_0_1;
      patterns[116] = 14'b0_0_1_1_1_0_1_0_0_1_0_0_1_0;
      patterns[117] = 14'b0_0_1_1_1_0_1_0_1_1_0_0_0_1;
      patterns[118] = 14'b0_0_1_1_1_0_1_1_0_1_0_0_0_1;
      patterns[119] = 14'b0_0_1_1_1_0_1_1_1_1_0_0_1_1;
      patterns[120] = 14'b0_0_1_1_1_1_0_0_0_1_0_0_1_0;
      patterns[121] = 14'b0_0_1_1_1_1_0_0_1_1_0_0_0_1;
      patterns[122] = 14'b0_0_1_1_1_1_0_1_0_1_0_0_0_1;
      patterns[123] = 14'b0_0_1_1_1_1_0_1_1_1_0_0_1_1;
      patterns[124] = 14'b0_0_1_1_1_1_1_0_0_1_0_1_1_0;
      patterns[125] = 14'b0_0_1_1_1_1_1_0_1_1_0_1_0_1;
      patterns[126] = 14'b0_0_1_1_1_1_1_1_0_1_0_1_0_1;
      patterns[127] = 14'b0_0_1_1_1_1_1_1_1_1_0_1_1_1;
      patterns[128] = 14'b0_1_0_0_0_0_0_0_0_1_0_0_0_0;
      patterns[129] = 14'b0_1_0_0_0_0_0_0_1_1_0_0_1_0;
      patterns[130] = 14'b0_1_0_0_0_0_0_1_0_1_0_0_1_0;
      patterns[131] = 14'b0_1_0_0_0_0_0_1_1_1_0_0_0_1;
      patterns[132] = 14'b0_1_0_0_0_0_1_0_0_1_0_1_0_0;
      patterns[133] = 14'b0_1_0_0_0_0_1_0_1_1_0_1_1_0;
      patterns[134] = 14'b0_1_0_0_0_0_1_1_0_1_0_1_1_0;
      patterns[135] = 14'b0_1_0_0_0_0_1_1_1_1_0_1_0_1;
      patterns[136] = 14'b0_1_0_0_0_1_0_0_0_1_0_1_0_0;
      patterns[137] = 14'b0_1_0_0_0_1_0_0_1_1_0_1_1_0;
      patterns[138] = 14'b0_1_0_0_0_1_0_1_0_1_0_1_1_0;
      patterns[139] = 14'b0_1_0_0_0_1_0_1_1_1_0_1_0_1;
      patterns[140] = 14'b0_1_0_0_0_1_1_0_0_1_0_0_1_0;
      patterns[141] = 14'b0_1_0_0_0_1_1_0_1_1_0_0_0_1;
      patterns[142] = 14'b0_1_0_0_0_1_1_1_0_1_0_0_0_1;
      patterns[143] = 14'b0_1_0_0_0_1_1_1_1_1_0_0_1_1;
      patterns[144] = 14'b0_1_0_0_1_0_0_0_0_1_1_0_0_0;
      patterns[145] = 14'b0_1_0_0_1_0_0_0_1_1_1_0_1_0;
      patterns[146] = 14'b0_1_0_0_1_0_0_1_0_1_1_0_1_0;
      patterns[147] = 14'b0_1_0_0_1_0_0_1_1_1_1_0_0_1;
      patterns[148] = 14'b0_1_0_0_1_0_1_0_0_1_1_1_0_0;
      patterns[149] = 14'b0_1_0_0_1_0_1_0_1_1_1_1_1_0;
      patterns[150] = 14'b0_1_0_0_1_0_1_1_0_1_1_1_1_0;
      patterns[151] = 14'b0_1_0_0_1_0_1_1_1_1_1_1_0_1;
      patterns[152] = 14'b0_1_0_0_1_1_0_0_0_1_1_1_0_0;
      patterns[153] = 14'b0_1_0_0_1_1_0_0_1_1_1_1_1_0;
      patterns[154] = 14'b0_1_0_0_1_1_0_1_0_1_1_1_1_0;
      patterns[155] = 14'b0_1_0_0_1_1_0_1_1_1_1_1_0_1;
      patterns[156] = 14'b0_1_0_0_1_1_1_0_0_1_1_0_1_0;
      patterns[157] = 14'b0_1_0_0_1_1_1_0_1_1_1_0_0_1;
      patterns[158] = 14'b0_1_0_0_1_1_1_1_0_1_1_0_0_1;
      patterns[159] = 14'b0_1_0_0_1_1_1_1_1_1_1_0_1_1;
      patterns[160] = 14'b0_1_0_1_0_0_0_0_0_1_1_0_0_0;
      patterns[161] = 14'b0_1_0_1_0_0_0_0_1_1_1_0_1_0;
      patterns[162] = 14'b0_1_0_1_0_0_0_1_0_1_1_0_1_0;
      patterns[163] = 14'b0_1_0_1_0_0_0_1_1_1_1_0_0_1;
      patterns[164] = 14'b0_1_0_1_0_0_1_0_0_1_1_1_0_0;
      patterns[165] = 14'b0_1_0_1_0_0_1_0_1_1_1_1_1_0;
      patterns[166] = 14'b0_1_0_1_0_0_1_1_0_1_1_1_1_0;
      patterns[167] = 14'b0_1_0_1_0_0_1_1_1_1_1_1_0_1;
      patterns[168] = 14'b0_1_0_1_0_1_0_0_0_1_1_1_0_0;
      patterns[169] = 14'b0_1_0_1_0_1_0_0_1_1_1_1_1_0;
      patterns[170] = 14'b0_1_0_1_0_1_0_1_0_1_1_1_1_0;
      patterns[171] = 14'b0_1_0_1_0_1_0_1_1_1_1_1_0_1;
      patterns[172] = 14'b0_1_0_1_0_1_1_0_0_1_1_0_1_0;
      patterns[173] = 14'b0_1_0_1_0_1_1_0_1_1_1_0_0_1;
      patterns[174] = 14'b0_1_0_1_0_1_1_1_0_1_1_0_0_1;
      patterns[175] = 14'b0_1_0_1_0_1_1_1_1_1_1_0_1_1;
      patterns[176] = 14'b0_1_0_1_1_0_0_0_0_1_0_1_0_0;
      patterns[177] = 14'b0_1_0_1_1_0_0_0_1_1_0_1_1_0;
      patterns[178] = 14'b0_1_0_1_1_0_0_1_0_1_0_1_1_0;
      patterns[179] = 14'b0_1_0_1_1_0_0_1_1_1_0_1_0_1;
      patterns[180] = 14'b0_1_0_1_1_0_1_0_0_1_0_0_1_0;
      patterns[181] = 14'b0_1_0_1_1_0_1_0_1_1_0_0_0_1;
      patterns[182] = 14'b0_1_0_1_1_0_1_1_0_1_0_0_0_1;
      patterns[183] = 14'b0_1_0_1_1_0_1_1_1_1_0_0_1_1;
      patterns[184] = 14'b0_1_0_1_1_1_0_0_0_1_0_0_1_0;
      patterns[185] = 14'b0_1_0_1_1_1_0_0_1_1_0_0_0_1;
      patterns[186] = 14'b0_1_0_1_1_1_0_1_0_1_0_0_0_1;
      patterns[187] = 14'b0_1_0_1_1_1_0_1_1_1_0_0_1_1;
      patterns[188] = 14'b0_1_0_1_1_1_1_0_0_1_0_1_1_0;
      patterns[189] = 14'b0_1_0_1_1_1_1_0_1_1_0_1_0_1;
      patterns[190] = 14'b0_1_0_1_1_1_1_1_0_1_0_1_0_1;
      patterns[191] = 14'b0_1_0_1_1_1_1_1_1_1_0_1_1_1;
      patterns[192] = 14'b0_1_1_0_0_0_0_0_0_0_1_0_0_0;
      patterns[193] = 14'b0_1_1_0_0_0_0_0_1_0_1_0_1_0;
      patterns[194] = 14'b0_1_1_0_0_0_0_1_0_0_1_0_1_0;
      patterns[195] = 14'b0_1_1_0_0_0_0_1_1_0_1_0_0_1;
      patterns[196] = 14'b0_1_1_0_0_0_1_0_0_0_1_1_0_0;
      patterns[197] = 14'b0_1_1_0_0_0_1_0_1_0_1_1_1_0;
      patterns[198] = 14'b0_1_1_0_0_0_1_1_0_0_1_1_1_0;
      patterns[199] = 14'b0_1_1_0_0_0_1_1_1_0_1_1_0_1;
      patterns[200] = 14'b0_1_1_0_0_1_0_0_0_0_1_1_0_0;
      patterns[201] = 14'b0_1_1_0_0_1_0_0_1_0_1_1_1_0;
      patterns[202] = 14'b0_1_1_0_0_1_0_1_0_0_1_1_1_0;
      patterns[203] = 14'b0_1_1_0_0_1_0_1_1_0_1_1_0_1;
      patterns[204] = 14'b0_1_1_0_0_1_1_0_0_0_1_0_1_0;
      patterns[205] = 14'b0_1_1_0_0_1_1_0_1_0_1_0_0_1;
      patterns[206] = 14'b0_1_1_0_0_1_1_1_0_0_1_0_0_1;
      patterns[207] = 14'b0_1_1_0_0_1_1_1_1_0_1_0_1_1;
      patterns[208] = 14'b0_1_1_0_1_0_0_0_0_0_0_1_0_0;
      patterns[209] = 14'b0_1_1_0_1_0_0_0_1_0_0_1_1_0;
      patterns[210] = 14'b0_1_1_0_1_0_0_1_0_0_0_1_1_0;
      patterns[211] = 14'b0_1_1_0_1_0_0_1_1_0_0_1_0_1;
      patterns[212] = 14'b0_1_1_0_1_0_1_0_0_0_0_0_1_0;
      patterns[213] = 14'b0_1_1_0_1_0_1_0_1_0_0_0_0_1;
      patterns[214] = 14'b0_1_1_0_1_0_1_1_0_0_0_0_0_1;
      patterns[215] = 14'b0_1_1_0_1_0_1_1_1_0_0_0_1_1;
      patterns[216] = 14'b0_1_1_0_1_1_0_0_0_0_0_0_1_0;
      patterns[217] = 14'b0_1_1_0_1_1_0_0_1_0_0_0_0_1;
      patterns[218] = 14'b0_1_1_0_1_1_0_1_0_0_0_0_0_1;
      patterns[219] = 14'b0_1_1_0_1_1_0_1_1_0_0_0_1_1;
      patterns[220] = 14'b0_1_1_0_1_1_1_0_0_0_0_1_1_0;
      patterns[221] = 14'b0_1_1_0_1_1_1_0_1_0_0_1_0_1;
      patterns[222] = 14'b0_1_1_0_1_1_1_1_0_0_0_1_0_1;
      patterns[223] = 14'b0_1_1_0_1_1_1_1_1_0_0_1_1_1;
      patterns[224] = 14'b0_1_1_1_0_0_0_0_0_0_0_1_0_0;
      patterns[225] = 14'b0_1_1_1_0_0_0_0_1_0_0_1_1_0;
      patterns[226] = 14'b0_1_1_1_0_0_0_1_0_0_0_1_1_0;
      patterns[227] = 14'b0_1_1_1_0_0_0_1_1_0_0_1_0_1;
      patterns[228] = 14'b0_1_1_1_0_0_1_0_0_0_0_0_1_0;
      patterns[229] = 14'b0_1_1_1_0_0_1_0_1_0_0_0_0_1;
      patterns[230] = 14'b0_1_1_1_0_0_1_1_0_0_0_0_0_1;
      patterns[231] = 14'b0_1_1_1_0_0_1_1_1_0_0_0_1_1;
      patterns[232] = 14'b0_1_1_1_0_1_0_0_0_0_0_0_1_0;
      patterns[233] = 14'b0_1_1_1_0_1_0_0_1_0_0_0_0_1;
      patterns[234] = 14'b0_1_1_1_0_1_0_1_0_0_0_0_0_1;
      patterns[235] = 14'b0_1_1_1_0_1_0_1_1_0_0_0_1_1;
      patterns[236] = 14'b0_1_1_1_0_1_1_0_0_0_0_1_1_0;
      patterns[237] = 14'b0_1_1_1_0_1_1_0_1_0_0_1_0_1;
      patterns[238] = 14'b0_1_1_1_0_1_1_1_0_0_0_1_0_1;
      patterns[239] = 14'b0_1_1_1_0_1_1_1_1_0_0_1_1_1;
      patterns[240] = 14'b0_1_1_1_1_0_0_0_0_0_1_1_0_0;
      patterns[241] = 14'b0_1_1_1_1_0_0_0_1_0_1_1_1_0;
      patterns[242] = 14'b0_1_1_1_1_0_0_1_0_0_1_1_1_0;
      patterns[243] = 14'b0_1_1_1_1_0_0_1_1_0_1_1_0_1;
      patterns[244] = 14'b0_1_1_1_1_0_1_0_0_0_1_0_1_0;
      patterns[245] = 14'b0_1_1_1_1_0_1_0_1_0_1_0_0_1;
      patterns[246] = 14'b0_1_1_1_1_0_1_1_0_0_1_0_0_1;
      patterns[247] = 14'b0_1_1_1_1_0_1_1_1_0_1_0_1_1;
      patterns[248] = 14'b0_1_1_1_1_1_0_0_0_0_1_0_1_0;
      patterns[249] = 14'b0_1_1_1_1_1_0_0_1_0_1_0_0_1;
      patterns[250] = 14'b0_1_1_1_1_1_0_1_0_0_1_0_0_1;
      patterns[251] = 14'b0_1_1_1_1_1_0_1_1_0_1_0_1_1;
      patterns[252] = 14'b0_1_1_1_1_1_1_0_0_0_1_1_1_0;
      patterns[253] = 14'b0_1_1_1_1_1_1_0_1_0_1_1_0_1;
      patterns[254] = 14'b0_1_1_1_1_1_1_1_0_0_1_1_0_1;
      patterns[255] = 14'b0_1_1_1_1_1_1_1_1_0_1_1_1_1;
      patterns[256] = 14'b1_0_0_0_0_0_0_0_0_1_0_0_0_0;
      patterns[257] = 14'b1_0_0_0_0_0_0_0_1_1_0_0_1_0;
      patterns[258] = 14'b1_0_0_0_0_0_0_1_0_1_0_0_1_0;
      patterns[259] = 14'b1_0_0_0_0_0_0_1_1_1_0_0_0_1;
      patterns[260] = 14'b1_0_0_0_0_0_1_0_0_1_0_1_0_0;
      patterns[261] = 14'b1_0_0_0_0_0_1_0_1_1_0_1_1_0;
      patterns[262] = 14'b1_0_0_0_0_0_1_1_0_1_0_1_1_0;
      patterns[263] = 14'b1_0_0_0_0_0_1_1_1_1_0_1_0_1;
      patterns[264] = 14'b1_0_0_0_0_1_0_0_0_1_0_1_0_0;
      patterns[265] = 14'b1_0_0_0_0_1_0_0_1_1_0_1_1_0;
      patterns[266] = 14'b1_0_0_0_0_1_0_1_0_1_0_1_1_0;
      patterns[267] = 14'b1_0_0_0_0_1_0_1_1_1_0_1_0_1;
      patterns[268] = 14'b1_0_0_0_0_1_1_0_0_1_0_0_1_0;
      patterns[269] = 14'b1_0_0_0_0_1_1_0_1_1_0_0_0_1;
      patterns[270] = 14'b1_0_0_0_0_1_1_1_0_1_0_0_0_1;
      patterns[271] = 14'b1_0_0_0_0_1_1_1_1_1_0_0_1_1;
      patterns[272] = 14'b1_0_0_0_1_0_0_0_0_1_1_0_0_0;
      patterns[273] = 14'b1_0_0_0_1_0_0_0_1_1_1_0_1_0;
      patterns[274] = 14'b1_0_0_0_1_0_0_1_0_1_1_0_1_0;
      patterns[275] = 14'b1_0_0_0_1_0_0_1_1_1_1_0_0_1;
      patterns[276] = 14'b1_0_0_0_1_0_1_0_0_1_1_1_0_0;
      patterns[277] = 14'b1_0_0_0_1_0_1_0_1_1_1_1_1_0;
      patterns[278] = 14'b1_0_0_0_1_0_1_1_0_1_1_1_1_0;
      patterns[279] = 14'b1_0_0_0_1_0_1_1_1_1_1_1_0_1;
      patterns[280] = 14'b1_0_0_0_1_1_0_0_0_1_1_1_0_0;
      patterns[281] = 14'b1_0_0_0_1_1_0_0_1_1_1_1_1_0;
      patterns[282] = 14'b1_0_0_0_1_1_0_1_0_1_1_1_1_0;
      patterns[283] = 14'b1_0_0_0_1_1_0_1_1_1_1_1_0_1;
      patterns[284] = 14'b1_0_0_0_1_1_1_0_0_1_1_0_1_0;
      patterns[285] = 14'b1_0_0_0_1_1_1_0_1_1_1_0_0_1;
      patterns[286] = 14'b1_0_0_0_1_1_1_1_0_1_1_0_0_1;
      patterns[287] = 14'b1_0_0_0_1_1_1_1_1_1_1_0_1_1;
      patterns[288] = 14'b1_0_0_1_0_0_0_0_0_1_1_0_0_0;
      patterns[289] = 14'b1_0_0_1_0_0_0_0_1_1_1_0_1_0;
      patterns[290] = 14'b1_0_0_1_0_0_0_1_0_1_1_0_1_0;
      patterns[291] = 14'b1_0_0_1_0_0_0_1_1_1_1_0_0_1;
      patterns[292] = 14'b1_0_0_1_0_0_1_0_0_1_1_1_0_0;
      patterns[293] = 14'b1_0_0_1_0_0_1_0_1_1_1_1_1_0;
      patterns[294] = 14'b1_0_0_1_0_0_1_1_0_1_1_1_1_0;
      patterns[295] = 14'b1_0_0_1_0_0_1_1_1_1_1_1_0_1;
      patterns[296] = 14'b1_0_0_1_0_1_0_0_0_1_1_1_0_0;
      patterns[297] = 14'b1_0_0_1_0_1_0_0_1_1_1_1_1_0;
      patterns[298] = 14'b1_0_0_1_0_1_0_1_0_1_1_1_1_0;
      patterns[299] = 14'b1_0_0_1_0_1_0_1_1_1_1_1_0_1;
      patterns[300] = 14'b1_0_0_1_0_1_1_0_0_1_1_0_1_0;
      patterns[301] = 14'b1_0_0_1_0_1_1_0_1_1_1_0_0_1;
      patterns[302] = 14'b1_0_0_1_0_1_1_1_0_1_1_0_0_1;
      patterns[303] = 14'b1_0_0_1_0_1_1_1_1_1_1_0_1_1;
      patterns[304] = 14'b1_0_0_1_1_0_0_0_0_1_0_1_0_0;
      patterns[305] = 14'b1_0_0_1_1_0_0_0_1_1_0_1_1_0;
      patterns[306] = 14'b1_0_0_1_1_0_0_1_0_1_0_1_1_0;
      patterns[307] = 14'b1_0_0_1_1_0_0_1_1_1_0_1_0_1;
      patterns[308] = 14'b1_0_0_1_1_0_1_0_0_1_0_0_1_0;
      patterns[309] = 14'b1_0_0_1_1_0_1_0_1_1_0_0_0_1;
      patterns[310] = 14'b1_0_0_1_1_0_1_1_0_1_0_0_0_1;
      patterns[311] = 14'b1_0_0_1_1_0_1_1_1_1_0_0_1_1;
      patterns[312] = 14'b1_0_0_1_1_1_0_0_0_1_0_0_1_0;
      patterns[313] = 14'b1_0_0_1_1_1_0_0_1_1_0_0_0_1;
      patterns[314] = 14'b1_0_0_1_1_1_0_1_0_1_0_0_0_1;
      patterns[315] = 14'b1_0_0_1_1_1_0_1_1_1_0_0_1_1;
      patterns[316] = 14'b1_0_0_1_1_1_1_0_0_1_0_1_1_0;
      patterns[317] = 14'b1_0_0_1_1_1_1_0_1_1_0_1_0_1;
      patterns[318] = 14'b1_0_0_1_1_1_1_1_0_1_0_1_0_1;
      patterns[319] = 14'b1_0_0_1_1_1_1_1_1_1_0_1_1_1;
      patterns[320] = 14'b1_0_1_0_0_0_0_0_0_0_1_0_0_0;
      patterns[321] = 14'b1_0_1_0_0_0_0_0_1_0_1_0_1_0;
      patterns[322] = 14'b1_0_1_0_0_0_0_1_0_0_1_0_1_0;
      patterns[323] = 14'b1_0_1_0_0_0_0_1_1_0_1_0_0_1;
      patterns[324] = 14'b1_0_1_0_0_0_1_0_0_0_1_1_0_0;
      patterns[325] = 14'b1_0_1_0_0_0_1_0_1_0_1_1_1_0;
      patterns[326] = 14'b1_0_1_0_0_0_1_1_0_0_1_1_1_0;
      patterns[327] = 14'b1_0_1_0_0_0_1_1_1_0_1_1_0_1;
      patterns[328] = 14'b1_0_1_0_0_1_0_0_0_0_1_1_0_0;
      patterns[329] = 14'b1_0_1_0_0_1_0_0_1_0_1_1_1_0;
      patterns[330] = 14'b1_0_1_0_0_1_0_1_0_0_1_1_1_0;
      patterns[331] = 14'b1_0_1_0_0_1_0_1_1_0_1_1_0_1;
      patterns[332] = 14'b1_0_1_0_0_1_1_0_0_0_1_0_1_0;
      patterns[333] = 14'b1_0_1_0_0_1_1_0_1_0_1_0_0_1;
      patterns[334] = 14'b1_0_1_0_0_1_1_1_0_0_1_0_0_1;
      patterns[335] = 14'b1_0_1_0_0_1_1_1_1_0_1_0_1_1;
      patterns[336] = 14'b1_0_1_0_1_0_0_0_0_0_0_1_0_0;
      patterns[337] = 14'b1_0_1_0_1_0_0_0_1_0_0_1_1_0;
      patterns[338] = 14'b1_0_1_0_1_0_0_1_0_0_0_1_1_0;
      patterns[339] = 14'b1_0_1_0_1_0_0_1_1_0_0_1_0_1;
      patterns[340] = 14'b1_0_1_0_1_0_1_0_0_0_0_0_1_0;
      patterns[341] = 14'b1_0_1_0_1_0_1_0_1_0_0_0_0_1;
      patterns[342] = 14'b1_0_1_0_1_0_1_1_0_0_0_0_0_1;
      patterns[343] = 14'b1_0_1_0_1_0_1_1_1_0_0_0_1_1;
      patterns[344] = 14'b1_0_1_0_1_1_0_0_0_0_0_0_1_0;
      patterns[345] = 14'b1_0_1_0_1_1_0_0_1_0_0_0_0_1;
      patterns[346] = 14'b1_0_1_0_1_1_0_1_0_0_0_0_0_1;
      patterns[347] = 14'b1_0_1_0_1_1_0_1_1_0_0_0_1_1;
      patterns[348] = 14'b1_0_1_0_1_1_1_0_0_0_0_1_1_0;
      patterns[349] = 14'b1_0_1_0_1_1_1_0_1_0_0_1_0_1;
      patterns[350] = 14'b1_0_1_0_1_1_1_1_0_0_0_1_0_1;
      patterns[351] = 14'b1_0_1_0_1_1_1_1_1_0_0_1_1_1;
      patterns[352] = 14'b1_0_1_1_0_0_0_0_0_0_0_1_0_0;
      patterns[353] = 14'b1_0_1_1_0_0_0_0_1_0_0_1_1_0;
      patterns[354] = 14'b1_0_1_1_0_0_0_1_0_0_0_1_1_0;
      patterns[355] = 14'b1_0_1_1_0_0_0_1_1_0_0_1_0_1;
      patterns[356] = 14'b1_0_1_1_0_0_1_0_0_0_0_0_1_0;
      patterns[357] = 14'b1_0_1_1_0_0_1_0_1_0_0_0_0_1;
      patterns[358] = 14'b1_0_1_1_0_0_1_1_0_0_0_0_0_1;
      patterns[359] = 14'b1_0_1_1_0_0_1_1_1_0_0_0_1_1;
      patterns[360] = 14'b1_0_1_1_0_1_0_0_0_0_0_0_1_0;
      patterns[361] = 14'b1_0_1_1_0_1_0_0_1_0_0_0_0_1;
      patterns[362] = 14'b1_0_1_1_0_1_0_1_0_0_0_0_0_1;
      patterns[363] = 14'b1_0_1_1_0_1_0_1_1_0_0_0_1_1;
      patterns[364] = 14'b1_0_1_1_0_1_1_0_0_0_0_1_1_0;
      patterns[365] = 14'b1_0_1_1_0_1_1_0_1_0_0_1_0_1;
      patterns[366] = 14'b1_0_1_1_0_1_1_1_0_0_0_1_0_1;
      patterns[367] = 14'b1_0_1_1_0_1_1_1_1_0_0_1_1_1;
      patterns[368] = 14'b1_0_1_1_1_0_0_0_0_0_1_1_0_0;
      patterns[369] = 14'b1_0_1_1_1_0_0_0_1_0_1_1_1_0;
      patterns[370] = 14'b1_0_1_1_1_0_0_1_0_0_1_1_1_0;
      patterns[371] = 14'b1_0_1_1_1_0_0_1_1_0_1_1_0_1;
      patterns[372] = 14'b1_0_1_1_1_0_1_0_0_0_1_0_1_0;
      patterns[373] = 14'b1_0_1_1_1_0_1_0_1_0_1_0_0_1;
      patterns[374] = 14'b1_0_1_1_1_0_1_1_0_0_1_0_0_1;
      patterns[375] = 14'b1_0_1_1_1_0_1_1_1_0_1_0_1_1;
      patterns[376] = 14'b1_0_1_1_1_1_0_0_0_0_1_0_1_0;
      patterns[377] = 14'b1_0_1_1_1_1_0_0_1_0_1_0_0_1;
      patterns[378] = 14'b1_0_1_1_1_1_0_1_0_0_1_0_0_1;
      patterns[379] = 14'b1_0_1_1_1_1_0_1_1_0_1_0_1_1;
      patterns[380] = 14'b1_0_1_1_1_1_1_0_0_0_1_1_1_0;
      patterns[381] = 14'b1_0_1_1_1_1_1_0_1_0_1_1_0_1;
      patterns[382] = 14'b1_0_1_1_1_1_1_1_0_0_1_1_0_1;
      patterns[383] = 14'b1_0_1_1_1_1_1_1_1_0_1_1_1_1;
      patterns[384] = 14'b1_1_0_0_0_0_0_0_0_0_1_0_0_0;
      patterns[385] = 14'b1_1_0_0_0_0_0_0_1_0_1_0_1_0;
      patterns[386] = 14'b1_1_0_0_0_0_0_1_0_0_1_0_1_0;
      patterns[387] = 14'b1_1_0_0_0_0_0_1_1_0_1_0_0_1;
      patterns[388] = 14'b1_1_0_0_0_0_1_0_0_0_1_1_0_0;
      patterns[389] = 14'b1_1_0_0_0_0_1_0_1_0_1_1_1_0;
      patterns[390] = 14'b1_1_0_0_0_0_1_1_0_0_1_1_1_0;
      patterns[391] = 14'b1_1_0_0_0_0_1_1_1_0_1_1_0_1;
      patterns[392] = 14'b1_1_0_0_0_1_0_0_0_0_1_1_0_0;
      patterns[393] = 14'b1_1_0_0_0_1_0_0_1_0_1_1_1_0;
      patterns[394] = 14'b1_1_0_0_0_1_0_1_0_0_1_1_1_0;
      patterns[395] = 14'b1_1_0_0_0_1_0_1_1_0_1_1_0_1;
      patterns[396] = 14'b1_1_0_0_0_1_1_0_0_0_1_0_1_0;
      patterns[397] = 14'b1_1_0_0_0_1_1_0_1_0_1_0_0_1;
      patterns[398] = 14'b1_1_0_0_0_1_1_1_0_0_1_0_0_1;
      patterns[399] = 14'b1_1_0_0_0_1_1_1_1_0_1_0_1_1;
      patterns[400] = 14'b1_1_0_0_1_0_0_0_0_0_0_1_0_0;
      patterns[401] = 14'b1_1_0_0_1_0_0_0_1_0_0_1_1_0;
      patterns[402] = 14'b1_1_0_0_1_0_0_1_0_0_0_1_1_0;
      patterns[403] = 14'b1_1_0_0_1_0_0_1_1_0_0_1_0_1;
      patterns[404] = 14'b1_1_0_0_1_0_1_0_0_0_0_0_1_0;
      patterns[405] = 14'b1_1_0_0_1_0_1_0_1_0_0_0_0_1;
      patterns[406] = 14'b1_1_0_0_1_0_1_1_0_0_0_0_0_1;
      patterns[407] = 14'b1_1_0_0_1_0_1_1_1_0_0_0_1_1;
      patterns[408] = 14'b1_1_0_0_1_1_0_0_0_0_0_0_1_0;
      patterns[409] = 14'b1_1_0_0_1_1_0_0_1_0_0_0_0_1;
      patterns[410] = 14'b1_1_0_0_1_1_0_1_0_0_0_0_0_1;
      patterns[411] = 14'b1_1_0_0_1_1_0_1_1_0_0_0_1_1;
      patterns[412] = 14'b1_1_0_0_1_1_1_0_0_0_0_1_1_0;
      patterns[413] = 14'b1_1_0_0_1_1_1_0_1_0_0_1_0_1;
      patterns[414] = 14'b1_1_0_0_1_1_1_1_0_0_0_1_0_1;
      patterns[415] = 14'b1_1_0_0_1_1_1_1_1_0_0_1_1_1;
      patterns[416] = 14'b1_1_0_1_0_0_0_0_0_0_0_1_0_0;
      patterns[417] = 14'b1_1_0_1_0_0_0_0_1_0_0_1_1_0;
      patterns[418] = 14'b1_1_0_1_0_0_0_1_0_0_0_1_1_0;
      patterns[419] = 14'b1_1_0_1_0_0_0_1_1_0_0_1_0_1;
      patterns[420] = 14'b1_1_0_1_0_0_1_0_0_0_0_0_1_0;
      patterns[421] = 14'b1_1_0_1_0_0_1_0_1_0_0_0_0_1;
      patterns[422] = 14'b1_1_0_1_0_0_1_1_0_0_0_0_0_1;
      patterns[423] = 14'b1_1_0_1_0_0_1_1_1_0_0_0_1_1;
      patterns[424] = 14'b1_1_0_1_0_1_0_0_0_0_0_0_1_0;
      patterns[425] = 14'b1_1_0_1_0_1_0_0_1_0_0_0_0_1;
      patterns[426] = 14'b1_1_0_1_0_1_0_1_0_0_0_0_0_1;
      patterns[427] = 14'b1_1_0_1_0_1_0_1_1_0_0_0_1_1;
      patterns[428] = 14'b1_1_0_1_0_1_1_0_0_0_0_1_1_0;
      patterns[429] = 14'b1_1_0_1_0_1_1_0_1_0_0_1_0_1;
      patterns[430] = 14'b1_1_0_1_0_1_1_1_0_0_0_1_0_1;
      patterns[431] = 14'b1_1_0_1_0_1_1_1_1_0_0_1_1_1;
      patterns[432] = 14'b1_1_0_1_1_0_0_0_0_0_1_1_0_0;
      patterns[433] = 14'b1_1_0_1_1_0_0_0_1_0_1_1_1_0;
      patterns[434] = 14'b1_1_0_1_1_0_0_1_0_0_1_1_1_0;
      patterns[435] = 14'b1_1_0_1_1_0_0_1_1_0_1_1_0_1;
      patterns[436] = 14'b1_1_0_1_1_0_1_0_0_0_1_0_1_0;
      patterns[437] = 14'b1_1_0_1_1_0_1_0_1_0_1_0_0_1;
      patterns[438] = 14'b1_1_0_1_1_0_1_1_0_0_1_0_0_1;
      patterns[439] = 14'b1_1_0_1_1_0_1_1_1_0_1_0_1_1;
      patterns[440] = 14'b1_1_0_1_1_1_0_0_0_0_1_0_1_0;
      patterns[441] = 14'b1_1_0_1_1_1_0_0_1_0_1_0_0_1;
      patterns[442] = 14'b1_1_0_1_1_1_0_1_0_0_1_0_0_1;
      patterns[443] = 14'b1_1_0_1_1_1_0_1_1_0_1_0_1_1;
      patterns[444] = 14'b1_1_0_1_1_1_1_0_0_0_1_1_1_0;
      patterns[445] = 14'b1_1_0_1_1_1_1_0_1_0_1_1_0_1;
      patterns[446] = 14'b1_1_0_1_1_1_1_1_0_0_1_1_0_1;
      patterns[447] = 14'b1_1_0_1_1_1_1_1_1_0_1_1_1_1;
      patterns[448] = 14'b1_1_1_0_0_0_0_0_0_1_1_0_0_0;
      patterns[449] = 14'b1_1_1_0_0_0_0_0_1_1_1_0_1_0;
      patterns[450] = 14'b1_1_1_0_0_0_0_1_0_1_1_0_1_0;
      patterns[451] = 14'b1_1_1_0_0_0_0_1_1_1_1_0_0_1;
      patterns[452] = 14'b1_1_1_0_0_0_1_0_0_1_1_1_0_0;
      patterns[453] = 14'b1_1_1_0_0_0_1_0_1_1_1_1_1_0;
      patterns[454] = 14'b1_1_1_0_0_0_1_1_0_1_1_1_1_0;
      patterns[455] = 14'b1_1_1_0_0_0_1_1_1_1_1_1_0_1;
      patterns[456] = 14'b1_1_1_0_0_1_0_0_0_1_1_1_0_0;
      patterns[457] = 14'b1_1_1_0_0_1_0_0_1_1_1_1_1_0;
      patterns[458] = 14'b1_1_1_0_0_1_0_1_0_1_1_1_1_0;
      patterns[459] = 14'b1_1_1_0_0_1_0_1_1_1_1_1_0_1;
      patterns[460] = 14'b1_1_1_0_0_1_1_0_0_1_1_0_1_0;
      patterns[461] = 14'b1_1_1_0_0_1_1_0_1_1_1_0_0_1;
      patterns[462] = 14'b1_1_1_0_0_1_1_1_0_1_1_0_0_1;
      patterns[463] = 14'b1_1_1_0_0_1_1_1_1_1_1_0_1_1;
      patterns[464] = 14'b1_1_1_0_1_0_0_0_0_1_0_1_0_0;
      patterns[465] = 14'b1_1_1_0_1_0_0_0_1_1_0_1_1_0;
      patterns[466] = 14'b1_1_1_0_1_0_0_1_0_1_0_1_1_0;
      patterns[467] = 14'b1_1_1_0_1_0_0_1_1_1_0_1_0_1;
      patterns[468] = 14'b1_1_1_0_1_0_1_0_0_1_0_0_1_0;
      patterns[469] = 14'b1_1_1_0_1_0_1_0_1_1_0_0_0_1;
      patterns[470] = 14'b1_1_1_0_1_0_1_1_0_1_0_0_0_1;
      patterns[471] = 14'b1_1_1_0_1_0_1_1_1_1_0_0_1_1;
      patterns[472] = 14'b1_1_1_0_1_1_0_0_0_1_0_0_1_0;
      patterns[473] = 14'b1_1_1_0_1_1_0_0_1_1_0_0_0_1;
      patterns[474] = 14'b1_1_1_0_1_1_0_1_0_1_0_0_0_1;
      patterns[475] = 14'b1_1_1_0_1_1_0_1_1_1_0_0_1_1;
      patterns[476] = 14'b1_1_1_0_1_1_1_0_0_1_0_1_1_0;
      patterns[477] = 14'b1_1_1_0_1_1_1_0_1_1_0_1_0_1;
      patterns[478] = 14'b1_1_1_0_1_1_1_1_0_1_0_1_0_1;
      patterns[479] = 14'b1_1_1_0_1_1_1_1_1_1_0_1_1_1;
      patterns[480] = 14'b1_1_1_1_0_0_0_0_0_1_0_1_0_0;
      patterns[481] = 14'b1_1_1_1_0_0_0_0_1_1_0_1_1_0;
      patterns[482] = 14'b1_1_1_1_0_0_0_1_0_1_0_1_1_0;
      patterns[483] = 14'b1_1_1_1_0_0_0_1_1_1_0_1_0_1;
      patterns[484] = 14'b1_1_1_1_0_0_1_0_0_1_0_0_1_0;
      patterns[485] = 14'b1_1_1_1_0_0_1_0_1_1_0_0_0_1;
      patterns[486] = 14'b1_1_1_1_0_0_1_1_0_1_0_0_0_1;
      patterns[487] = 14'b1_1_1_1_0_0_1_1_1_1_0_0_1_1;
      patterns[488] = 14'b1_1_1_1_0_1_0_0_0_1_0_0_1_0;
      patterns[489] = 14'b1_1_1_1_0_1_0_0_1_1_0_0_0_1;
      patterns[490] = 14'b1_1_1_1_0_1_0_1_0_1_0_0_0_1;
      patterns[491] = 14'b1_1_1_1_0_1_0_1_1_1_0_0_1_1;
      patterns[492] = 14'b1_1_1_1_0_1_1_0_0_1_0_1_1_0;
      patterns[493] = 14'b1_1_1_1_0_1_1_0_1_1_0_1_0_1;
      patterns[494] = 14'b1_1_1_1_0_1_1_1_0_1_0_1_0_1;
      patterns[495] = 14'b1_1_1_1_0_1_1_1_1_1_0_1_1_1;
      patterns[496] = 14'b1_1_1_1_1_0_0_0_0_1_1_1_0_0;
      patterns[497] = 14'b1_1_1_1_1_0_0_0_1_1_1_1_1_0;
      patterns[498] = 14'b1_1_1_1_1_0_0_1_0_1_1_1_1_0;
      patterns[499] = 14'b1_1_1_1_1_0_0_1_1_1_1_1_0_1;
      patterns[500] = 14'b1_1_1_1_1_0_1_0_0_1_1_0_1_0;
      patterns[501] = 14'b1_1_1_1_1_0_1_0_1_1_1_0_0_1;
      patterns[502] = 14'b1_1_1_1_1_0_1_1_0_1_1_0_0_1;
      patterns[503] = 14'b1_1_1_1_1_0_1_1_1_1_1_0_1_1;
      patterns[504] = 14'b1_1_1_1_1_1_0_0_0_1_1_0_1_0;
      patterns[505] = 14'b1_1_1_1_1_1_0_0_1_1_1_0_0_1;
      patterns[506] = 14'b1_1_1_1_1_1_0_1_0_1_1_0_0_1;
      patterns[507] = 14'b1_1_1_1_1_1_0_1_1_1_1_0_1_1;
      patterns[508] = 14'b1_1_1_1_1_1_1_0_0_1_1_1_1_0;
      patterns[509] = 14'b1_1_1_1_1_1_1_0_1_1_1_1_0_1;
      patterns[510] = 14'b1_1_1_1_1_1_1_1_0_1_1_1_0_1;
      patterns[511] = 14'b1_1_1_1_1_1_1_1_1_1_1_1_1_1;

      for (i = 0; i < 512; i = i + 1)
      begin
        Cin = patterns[i][13];
        a0 = patterns[i][12];
        b0 = patterns[i][11];
        a1 = patterns[i][10];
        b1 = patterns[i][9];
        a2 = patterns[i][8];
        b2 = patterns[i][7];
        a3 = patterns[i][6];
        b3 = patterns[i][5];
        #10;
        if (patterns[i][4] !== 1'hx)
        begin
          if (s0 !== patterns[i][4])
          begin
            $display("%d:s0: (assertion error). Expected %h, found %h", i, patterns[i][4], s0);
            $finish;
          end
        end
        if (patterns[i][3] !== 1'hx)
        begin
          if (s1 !== patterns[i][3])
          begin
            $display("%d:s1: (assertion error). Expected %h, found %h", i, patterns[i][3], s1);
            $finish;
          end
        end
        if (patterns[i][2] !== 1'hx)
        begin
          if (s2 !== patterns[i][2])
          begin
            $display("%d:s2: (assertion error). Expected %h, found %h", i, patterns[i][2], s2);
            $finish;
          end
        end
        if (patterns[i][1] !== 1'hx)
        begin
          if (s3 !== patterns[i][1])
          begin
            $display("%d:s3: (assertion error). Expected %h, found %h", i, patterns[i][1], s3);
            $finish;
          end
        end
        if (patterns[i][0] !== 1'hx)
        begin
          if (cout !== patterns[i][0])
          begin
            $display("%d:cout: (assertion error). Expected %h, found %h", i, patterns[i][0], cout);
            $finish;
          end
        end
      end

      $display("All tests passed.");
      
    $dumpfile("sumador4bits.vcd");
    $dumpvars(0, Sumador4Bits_sumador4bits_tb);
    end
    endmodule
