module single_port_rom(/*autoarg*/
   // Outputs
   q,
   // Inputs
   addr, clk
   );

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 8;

input   [ADDR_WIDTH-1:0] addr;
input   clk;
output reg [DATA_WIDTH-1:0] q;



        
    reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

        initial
        begin
                $readmemh("/home/IC/Digital_Front_End_Verilog/ip_lib/rtl/DDS/triangular.txt", rom);
                //$readmemb("sin.txt", rom);
        end

        always @ (posedge clk)
        begin
                q <= rom[addr];
        end

endmodule
