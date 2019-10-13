module test (/*AUTOARG*/
   // Outputs
   douty,
   // Inputs
   clk, rst_n, i
   );

input clk;
input rst_n;   
input i;
output              douty;

parameter DWIDTH=32;

/*AUTOREG*/
// Beginning of automatic regs (for this module's undeclared outputs)
reg                     douty;
// End of automatics

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [DWIDTH-1:0]       o;                      // From u_foo of foo.v
// End of automatics

assign doutx = i;

always @(posedge clk or negedge rst_n)begin
  if(!rst_n)begin
    douty <= 1'd0;
  end
  else 
    douty <= doutx;
end

assign doutx = i & o[DWODTH-1];

foo u_foo(/*autoinst*/
          // Outputs
          .o                            (o[DWIDTH-1:0]),
          // Inputs
          .i                            (i));

endmodule
//Local Variables:
//verilog-library-directories:("." "foo")
//End:
