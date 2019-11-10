`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 10:06:12
// Design Name: 
// Module Name: dds_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dds_sim(

    );
 
reg     clk_50m = 0;
reg     DAC_A_B_s_0 = 0;
reg     reset_rtl_0 = 0;
reg     [11:0]  phase_data;
reg     [1:0]   mux;

dds_top dds_top_s(
    .clk_50MHz            (clk_50m),
    .mux                (mux),
    //.phase_data         (phase_data),
    .DAC_A_B_s_0        (),
    .da_cs_0            (),
    .out_da_data_0      (),
    //.led0             (),
    .out_da_wr_0        ()
    );

always #10 clk_50m = ~clk_50m;   

initial 
begin
    phase_data = 0;
    mux = 2'b00;
    //#10000
    //#100 phase_data = 12'h001; 
    //#1000000
   // mux = 2'b01;
   // #1000000
   // mux = 2'b10;
   // #1000000
   // mux = 2'b11;
   // #1000000
   // mux = 2'b00;
end


endmodule
