`timescale  1ns/1ns
module adder64_tb;

  reg [63:0] A;
  reg [63:0] B;
  wire [63:0] S;
  wire c64;

  adder64 adder64(
        .A(A),
          .B(B),
          .S(S),
          .C64(c64)
         );

  initial begin
     A = 64'd0; B = 64'd0;

      #5;  A = 64'd 114514;  B = 64'd010086;
      #5;  A = 64'd 123456;  B = 64'd345678;
      #5;
      $stop;  
  end
endmodule