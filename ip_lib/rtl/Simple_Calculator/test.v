module test(
    input   a,
    input   b,
    input   d,
    output  c

);

assign c = (a==1 && b == 1)? d :c;

endmodule 
