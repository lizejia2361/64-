module adder64(A, B, S, C64);
    input [63:0] A;
    input [63:0] B;
    output [63:0] S;
    output C64;

    wire px0, gx0, px1, gx1, px2, gx2;
    wire c16, c32;

    // First 16-bit CLA
    CLA_16 CLA1(
        .A(A[15:0]),
        .B(B[15:0]),
        .c0(0),
        .S(S[15:0]),
        .px(px0),
        .gx(gx0)
    );

    // Next 16-bit CLA
    CLA_16 CLA2(
        .A(A[31:16]),
        .B(B[31:16]),
        .c0(c16),
        .S(S[31:16]),
        .px(px1),
        .gx(gx1)
    );

    // Next 16-bit CLA
    CLA_16 CLA3(
        .A(A[47:32]),
        .B(B[47:32]),
        .c0(c32),
        .S(S[47:32]),
        .px(px2),
        .gx(gx2)
    );

    // Last 16-bit CLA
    CLA_16 CLA4(
        .A(A[63:48]),
        .B(B[63:48]),
        .c0(gx2), // The carry-in to the last CLA is the gx output of the third CLA
        .S(S[63:48]),
        .px(),
        .gx(C64) // The carry-out of the last CLA is the overall carry-out
    );

    // Generate the carry signals for each CLA
    assign c16 = gx0 ^ (px0 && 0); // c0 = 0 for the first CLA
    assign c32 = gx1 ^ (px1 && c16);
    assign c64 = gx2 ^ (px2 && c32); // This would be the carry-out if needed

endmodule