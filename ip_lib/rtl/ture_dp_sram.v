module ture_dp_sram(/*autoarg*/
   // Outputs
   douta, doutb,
   // Inputs
   clka, clkb, csen_n, dina, addra, wrena_n, rdena_n, dinb, addrb, wrenb_n,
   rdenb_n
   );
    parameter           ADDR_WIDTH  =   4;
    parameter           DATA_WIDTH  =   8;
    input           clka;
    input           clkb;
    input           csen_n;
    //Port A Signal
    input   [DATA_WIDTH-1:0]   dina;
    input   [ADDR_WIDTH-1:0]   addra;
    output reg [DATA_WIDTH-1:0]   douta;
    input           wrena_n;
    input           rdena_n;
    //Port B Signal
    input   [DATA_WIDTH-1:0]   dinb;
    input   [ADDR_WIDTH-1:0]   addrb;
    output reg [DATA_WIDTH-1:0]   doutb;
    input           wrenb_n;
    input           rdenb_n;

reg     [DATA_WIDTH-1:0]   register[2**ADDR_WIDTH-1:0];

always @(posedge clka)begin
        if(!wrena_n && !csen_n)begin
        register[addra] <= dina;
        douta <= dina;
end
    else if(!csen_n)
        douta <= register[addra];    
end

always @(posedge clkb)begin
        if(!wrenb_n && !csen_n)begin
        register[addrb] <= dinb;
        doutb <= dinb;
end
    else if (!csen_n)begin
        doutb <= register[addrb];
    end
end

endmodule 
