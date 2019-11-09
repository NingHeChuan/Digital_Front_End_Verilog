module tb_ram;

    parameter           ADDR_WIDTH  =   4;
    parameter           DATA_WIDTH  =   8;
    reg           clka;
    reg           clkb;
    reg           csen_n;
    //Port A Signal
    reg   [DATA_WIDTH-1:0]   dina;
    reg   [ADDR_WIDTH-1:0]   addra;
    wire [DATA_WIDTH-1:0]   douta;
    reg           wrena_n;
    reg           rdena_n;
    //Port B Signal
    reg   [DATA_WIDTH-1:0]   dinb;
    reg   [ADDR_WIDTH-1:0]   addrb;
    wire    [DATA_WIDTH-1:0]   doutb;
    reg           wrenb_n;
    reg           rdenb_n;

initial begin
    $dumpfile("tb_ram.dump");
    //$dumpfile("addertb.vcd");
    $dumpvars(0,tb_ram);
end

sram u_sram(/*autoinst*/
            // Outputs
            .data_o                     (douta[DATA_WIDTH-1:0]),
            // Inputs
            .clk                        (clka),
            .addr                       (addra[ADDR_WIDTH-1:0]),
            .csen_n                     (csen_n),
            .wren_n                     (wrena_n),
            .data_i                     (dina[DATA_WIDTH-1:0])); 

dp_sram u_dp_sram(/*autoinst*/
                  // Outputs
                  .data_b               (doutb[DATA_WIDTH-1:0]),
                  // Inputs
                  .clk                  (clka),
                  .csen_n               (csen_n),
                  .addra                (addra[ADDR_WIDTH-1:0]),
                  .wrena_n              (wrena_n),
                  .addrb                (addrb[ADDR_WIDTH-1:0]),
                  .rdenb_n              (rdenb_n),
                  .data_a               (dina[DATA_WIDTH-1:0]));

ture_dp_sram u_ture_dp_sram(/*autoinst*/
                            // Outputs
                            .douta              (douta[DATA_WIDTH-1:0]),
                            .doutb              (doutb[DATA_WIDTH-1:0]),
                            // Inputs
                            .clka               (clka),
                            .clkb               (clkb),
                            .csen_n             (csen_n),
                            .dina               (dina[DATA_WIDTH-1:0]),
                            .addra              (addra[ADDR_WIDTH-1:0]),
                            .wrena_n            (wrena_n),
                            .rdena_n            (rdena_n),
                            .dinb               (dinb[DATA_WIDTH-1:0]),
                            .addrb              (addrb[ADDR_WIDTH-1:0]),
                            .wrenb_n            (wrenb_n),
                            .rdenb_n            (rdenb_n));


always #20 clka = ~clka;

always #8 clkb = ~clkb;

integer i;

initial begin
clka = 0;
clkb = 0;
csen_n = 1'b1;
dina = 0;
addra = 0;
wrena_n = 1;
rdena_n = 1;
dinb = 0;
addrb = 0;
wrenb_n = 1;
rdenb_n = 1;

#100
csen_n = 0;

for(i = 0; i < 16; i = i + 1)begin  
    wrena_n = 0;
    addra = i;
    dina = i+1;
    #100;
end
    wrena_n = 1;
#1000

for(i = 0; i < 16; i = i + 1)begin  
    rdena_n = 0;
    addra = i;
    #100;
end
    rdena_n = 1;

#1000

for(i = 0; i < 16; i = i + 1)begin  
    wrenb_n = 0;
    addrb = i;
    dinb = i+2;
    #100;
end
    wrenb_n = 1;
#1000

for(i = 0; i < 16; i = i + 1)begin  
    rdenb_n = 0;
    addrb = i;
    #100;
end
    rdenb_n = 1;
$finish;

end

endmodule
//Local Variables:
//verilog-library-directories:("../rtl")
//End:
