module dp_sram(/*autoarg*/
   // Outputs
   data_b,
   // Inputs
   clk, csen_n, addra, data_a, wrena_n, addrb, rdenb_n
   );

    parameter           ADDR_WIDTH  =   4;
    parameter           DATA_WIDTH  =   8;

    input               clk;
    input               csen_n;
    //Port A Signal
    input       [ADDR_WIDTH-1:0]   addra;
    input       [DATA_WIDTH-1:0]    data_a;
    input               wrena_n;
    //Port B Signal
    input       [ADDR_WIDTH-1:0]   addrb;
    input               rdenb_n;
    output   reg   [DATA_WIDTH-1:0]   data_b;

reg     [DATA_WIDTH-1:0]   register[2**ADDR_WIDTH-1:0];
reg     [ADDR_WIDTH-1:0]    addrb_r;

always @(posedge clk)begin
    if(!wrena_n && !csen_n)
        register[addra] <= data_a;
end

always @(posedge clk)begin
    if(!rdenb_n && !csen_n)
        data_b <= register[addrb];//read old data
        //addrb_r <= addrb//read new data
end

//assign data_b = register[addrb_r];//read new data


endmodule 
