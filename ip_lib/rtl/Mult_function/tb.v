`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:29:16 01/30/2017
// Design Name:   top
// Module Name:   E:/ISE/mult_fuction_clock/tb.v
// Project Name:  mult_fuction_clock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg mclk;
	reg rst_n;
	reg [3:0] key;
	reg clock;
	reg sel;
	reg stop;
	reg clr;

	// Outputs
	wire [3:0] an;
	wire [7:0] out;
	wire beep;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.mclk(mclk), 
		.rst_n(rst_n), 
		.key(key), 
		.clock(clock), 
		.sel(sel), 
		.stop(stop), 
		.clr(clr), 
		.an(an), 
		.out(out), 
		.beep(beep)
	);
	always #10 mclk = ~mclk;
	initial begin
		// Initialize Inputs
		mclk = 0;
		rst_n = 0;
		key = 0;
		clock = 0;
		sel = 0;
		stop = 0;
		clr = 0;

		// Wait 100 ns for global reset to finish
		#95; rst_n = 1'b1;
        
		// Add stimulus here

	end
      
endmodule

