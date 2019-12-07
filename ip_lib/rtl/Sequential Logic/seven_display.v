`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:02 10/04/2016 
// Design Name: 
// Module Name:    seven_display 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seven_display(in, out
    );
	 input [3:0] in;
	 output reg [6:0] out;
	 always @(*)
	 begin
		case(in)//低电平有效
		0: out <= 7'b0000001;
		1: out <= 7'b1001111;
		2: out <= 7'b0010010;
		3: out <= 7'b0000110;
		4: out <= 7'b1001100;
		5: out <= 7'b0100100;
		6: out <= 7'b0100000;
		7: out <= 7'b0001111;
		8: out <= 7'b0000000;
		9: out <= 7'b0000100;
		'hA: out <= 7'b0001000;
		'hB: out <= 7'b1100000;
		'hC: out <= 7'b0110001;
		'hD: out <= 7'b1000010;
		'hE: out <= 7'b0110000;
		'hF: out <= 7'b0111000;
		default: out <= 7'b0000000;
		endcase
	 end


endmodule
