module adder(X,Y,Cin,S,Cout);

  input X,Y,Cin;
  output S,Cout;

  assign S = X ^ Y ^ Cin;
  assign Cout = (X ^ Y) & Cin | X & Y;
endmodule