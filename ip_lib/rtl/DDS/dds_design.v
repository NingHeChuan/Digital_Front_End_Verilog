`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 09:42:14
// Design Name: 
// Module Name: dds_top
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


module dds_top(
    input           clk_50MHz,    //50Mhz
    //input   [7:0]   freq_data,
    //input   [7:0]   phase_data,
    input   [1:0]   mux,
    //AD5447 Signal
    output          DAC_A_B_s_0,
    output          da_cs_0,
    output [11:0]   out_da_data_0,
    output          out_da_wr_0
    );

//-------------------------------------------------------
wire            m_axis_data_tvalid;
wire    [31:0]  m_axis_data_tdata;
reg     [31:0]  rst_count=0;
reg             rst;
//dds rom
reg     [31:0]  fcnt;
wire     [11:0]  addra;
wire    [11:0]  douta;
wire [31:0] freq_data = 5000;
wire [11:0] phase_data = 8'hff;
//
wire   [1:0]   mux;
wire   [11:0]  cos;
wire   [11:0]  sin;
wire   [11:0]  square;
wire   [11:0]  triangular;

//-------------------------------------------------------
always @(posedge clk_50MHz) 
   //if(rst_count==32'h00Ff1111)
    if(rst_count==32'h00000111)begin
        rst_count<=rst_count; 
        rst<=1'b1;
   end
   else begin
       rst_count<=rst_count+ 32'h1;
       rst <=1'b0; 
    end

always @(posedge clk_50MHz or negedge rst)begin
	if(!rst)
		fcnt <= 32'd0;
	else
		fcnt <= fcnt + freq_data;
end

assign addra = fcnt[31:20] + phase_data;

//-------------------------------------------------------
//sin
blk_mem_sin blk_mem_sin_inst (
  .clka(clk_50MHz),     // input wire clka
  .addra(addra),        // input wire [11 : 0] addra
  .douta(sin)           // output wire [11 : 0] douta
);
//cos
blk_mem_cos blk_mem_cos_inst (
  .clka(clk_50MHz),     // input wire clka
  .addra(addra),        // input wire [11 : 0] addra
  .douta(cos)           // output wire [11 : 0] douta
);
//square
blk_mem_square blk_mem_square_inst (
  .clka(clk_50MHz),     // input wire clka
  .addra(addra),        // input wire [11 : 0] addra
  .douta(square)        // output wire [11 : 0] douta
);
/// 
blk_mem_triangular blk_mem_triangular_inst (
  .clka(clk_50MHz),     // input wire clka
  .addra(addra),        // input wire [11 : 0] addra
  .douta(triangular)    // output wire [11 : 0] douta
);

//-------------------------------------------------------
Mux_DDS Mux_DDS_inst(
    .mux            (mux       ),
    .cos            (cos       ),
    .sin            (sin       ),
    .square         (square    ),
    .triangular     (triangular),
    .dout           (douta      )
    );

//-------------------------------------------------------
//AD5447
DA_5428 #(
    .Ndata(12)
  ) 
  DA_inst (
    .clk                (clk_50MHz),
    .rst                (rst),
    .m_axis_data_tvalid (),
    .m_axis_data_tdata  (douta),
    .DAC_A_B_s          (DAC_A_B_s_0),
    .da_cs              (da_cs_0),
    .out_da_wr          (out_da_wr_0),
    .out_da_data        (out_da_data_0)
  );
    
endmodule
