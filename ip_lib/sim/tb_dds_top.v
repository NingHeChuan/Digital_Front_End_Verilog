`timescale 1ns/1ns

module tb_dds_top;
 
parameter   DATA_WIDTH = 12;
parameter   ADDR_WIDTH = 12;


reg     clk;
reg     rst_n;
reg     [11:0]  phase_data;
reg     [31:0]  freq_data;
wire [DATA_WIDTH-1:0] dout;


initial begin
    $dumpfile("tb_dds_top.dump");
    //$dumpfile("addertb.vcd");
    $dumpvars(0,tb_dds_top);
end

dds_top 
#(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
)
u_dds_top(/*autoinst*/
                  // Outputs
                  .dout                 (dout[DATA_WIDTH-1:0]),
                  // Inputs
                  .clk                  (clk),
                  .rst_n                (rst_n),
                  .freq_data            (freq_data[31:0]),
                  .phase_data           (phase_data[11:0]));


always #10 clk = ~clk;   

initial 
begin
        clk =0;
        rst_n = 0;
    phase_data = 0;
    freq_data = 32'h1;
#100 
rst_n = 1;


#100000000

   $finish;
end


endmodule
//Local Variables:
//verilog-library-directories:("../rtl/DDS")
//End:
