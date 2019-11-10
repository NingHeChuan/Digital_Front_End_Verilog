`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/08 09:30:43
// Design Name: 
// Module Name: Mux_DDS
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


module Mux_DDS(
    input   [1:0]   mux,
    input   [11:0]  cos,
    input   [11:0]  sin,
    input   [11:0]  square,
    input   [11:0]  triangular,
    output reg  [11:0]  dout
    );

always @(*)begin
    case(mux)
    2'b00:dout <= cos;
    2'b01:dout <= sin;
    2'b10:dout <= square;
    2'b11:dout <= triangular;
endcase

end


endmodule
