`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:07 09/30/2016 
// Design Name: 
// Module Name:    eight_three 
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
module eight_three(n, y
    );
	 input [7:0] n;
	 output reg [2:0] y;
	 always @(*)
	 begin
		 if(!n[7]) y = 3'b000;
		 else if(!n[6]) y = 3'b001;
		 else if(!n[5]) y = 3'b010;
		 else if(!n[4]) y = 3'b011;
		 else if(!n[3]) y = 3'b100;
		 else if(!n[2]) y = 3'b101;
		 else if(!n[1]) y = 3'b110;
		 else if(!n[0]) y = 3'b111;
	 end
endmodule
