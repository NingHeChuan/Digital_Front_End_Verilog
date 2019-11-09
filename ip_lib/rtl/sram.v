module sram(/*autoarg*/
   // Outputs
   data_o,
   // Inputs
   clk, addr, csen_n, wren_n, data_i
   );

    parameter           ADDR_WIDTH  =   4;
    parameter           DATA_WIDTH  =   8;

    input               clk;
    input       [ADDR_WIDTH-1:0]   addr;
    input               csen_n;
    input               wren_n;
    input       [DATA_WIDTH-1:0]    data_i;
    output     reg [DATA_WIDTH-1:0]    data_o;


reg     [DATA_WIDTH-1:0]   register[2**ADDR_WIDTH-1:0];

always @(posedge clk)begin
    if(!wren_n && !csen_n)
        register[addr] <= data_i;
end

always @(posedge clk)begin
    if(wren_n && !csen_n)
        data_o <= register[addr];
end

endmodule
