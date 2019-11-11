module dds_top(/*autoarg*/
   // Outputs
   dout,
   // Inputs
   clk, rst_n, freq_data, phase_data
   );

parameter   DATA_WIDTH = 12;
parameter   ADDR_WIDTH = 12;


input       clk;
input       rst_n;
input   [31:0] freq_data;  
input   [11:0] phase_data;
output  [DATA_WIDTH-1:0]    dout;



reg     [31:0]  fcnt;
wire    [ADDR_WIDTH-1:0]  addra;

always @(posedge clk or negedge rst_n)begin
        if(!rst_n)
                fcnt <= 32'd0;
        else
                fcnt <= fcnt + freq_data;
end

assign addra = fcnt[16:5] + phase_data;


single_port_rom 
#(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
)
u_sin(/*autoinst*/
      // Outputs
      .q                                (dout[DATA_WIDTH-1:0]),
      // Inputs
      .addr                             (addra[ADDR_WIDTH-1:0]),
      .clk                              (clk));

endmodule
//Local Variables:
//verilog-library-directories:(".")
//End:
