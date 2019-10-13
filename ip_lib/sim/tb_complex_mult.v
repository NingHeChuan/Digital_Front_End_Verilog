module tb_complex_mult;

parameter   DINA_WIDTH = 8;
parameter   DINB_WIDTH = 8;
parameter   MULT_WIDTH = DINA_WIDTH + DINB_WIDTH+1;

reg   signed  [DINA_WIDTH - 1:0]  dina_i;
reg   signed  [DINA_WIDTH - 1:0]  dina_q;
reg   signed  [DINB_WIDTH - 1:0]  dinb_i;
reg   signed  [DINB_WIDTH - 1:0]  dinb_q;
wire  signed  [MULT_WIDTH - 1:0]  mult_i;
wire  signed  [MULT_WIDTH - 1:0]  mult_q;


complex_mult 
#(
  .DINA_WIDTH(DINA_WIDTH),
  .DINB_WIDTH(DINB_WIDTH)
)
u_complex_mult(/*autoinst*/
                            // Outputs
                            .mult_i             (mult_i[MULT_WIDTH-1:0]),
                            .mult_q             (mult_q[MULT_WIDTH-1:0]),
                            // Inputs
                            .dina_i             (dina_i[DINA_WIDTH-1:0]),
                            .dina_q             (dina_q[DINA_WIDTH-1:0]),
                            .dinb_i             (dinb_i[DINB_WIDTH-1:0]),
                            .dinb_q             (dinb_q[DINB_WIDTH-1:0]));


initial begin
    $dumpfile("tb_complex_mult.dump");
    //$dumpfile("addertb.vcd");
    $dumpvars(0,tb_complex_mult);
end

integer i;
integer j;

initial begin
  for(i = 4; i <= 15; i= i+1)begin
    for(j = 4; j <= 15; j = j+1)begin
        dina_i = $signed(i);
        dina_q = $signed(j);
        dinb_i = $signed(j);
        dinb_q = $signed(i);
        #50;
      $display("dina_i =%d, dina_q =%d, dinb_i =%d, dinb_q =%d, mult_i =%d, mult_q =%d",
               dina_i, dina_q, dinb_i, dinb_q, mult_i, mult_q);
    end
 end
    $finish;

end

endmodule
//Local Variables:
//verilog-library-directories:("../rtl")
//End:
