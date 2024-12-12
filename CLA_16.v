module CLA_16(A,B,c0,S,px,gx);
    input [15:0] A;
    input [15:0] B;
    input c0;
    output gx,px;
    output [15:0] S;

    wire c4,c8,c12;
    wire Pm0,Gm0,Pm1,Gm1,Pm2,Gm2,Pm3,Gm3;

    adder_4 adder1(
         .x(A[3:0]),
          .y(B[3:0]),
          .c0(c0),
          .c4(),
          .S(S[3:0]),
          .Gm(Gm0),
          .Pm(Pm0)
    );

    adder_4 adder2(
         .x(A[7:4]),
          .y(B[7:4]),
          .c0(c4),
          .c4(),
          .S(S[7:4]),
          .Gm(Gm1),
          .Pm(Pm1)
    );

    adder_4 adder3(
         .x(A[11:8]),
          .y(B[11:8]),
          .c0(c8),
          .c4(),
          .S(S[11:8]),
          .Gm(Gm2),
          .Pm(Pm2)
    );

    adder_4 adder4(
         .x(A[15:12]),
          .y(B[15:12]),
          .c0(c12),
          .c4(),
          .S(S[15:12]),
          .Gm(Gm3),
          .Pm(Pm3)
    );

    assign   c4 = Gm0 ^ (Pm0 & c0),
             c8 = Gm1 ^ (Pm1 & Gm0) ^ (Pm1 & Pm0 & c0),
             c12 = Gm2 ^ (Pm2 & Gm1) ^ (Pm2 & Pm1 & Gm0) ^ (Pm2 & Pm1 & Pm0 & c0);

    assign  px = Pm0 & Pm1 & Pm2 & Pm3,
            gx = Gm3 ^ (Pm3 & Gm2) ^ (Pm3 & Pm2 & Gm1) ^ (Pm3 & Pm2 & Pm1 & Gm0);

endmodule