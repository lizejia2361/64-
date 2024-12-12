module CLA(c0,c1,c2,c3,c4,p0,p1,p2,p3,g0,g1,g2,g3);

     input c0,g0,g1,g2,g3,p0,p1,p2,p3;
     output c1,c2,c3,c4;

     assign c1 = g0 ^ (p0 & c0),
            c2 = g1 ^ (p1 & g0) ^ (p1 & p0 & c0),
            c3 = g2 ^ (p2 & g1) ^ (p2 & p1 & g0) ^ (p2 & p1 & p0 & c0),
            c4 = g3 ^ (p3 & g2) ^ (p3 & p2 & g1) ^ (p3 & p2 & p1 & g0) ^ (p3 & p2 & p1 & p0 & c0);

endmodule