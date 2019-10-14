
module complex_mult(/*autoarg*/
   // Outputs
   mult_i, mult_q,
   // Inputs
   dina_i, dina_q, dinb_i, dinb_q
   );

parameter   DINA_WIDTH = 0;
parameter   DINB_WIDTH = 0;

localparam  SUMA_WIDTH = DINA_WIDTH + 1'b1;
localparam  SUMB_WIDTH = DINB_WIDTH + 1'b1;
localparam  SUBA_WIDTH = DINA_WIDTH + 1'b1;
localparam  PRODUCT_A_WIDTH = SUMB_WIDTH + DINA_WIDTH;
localparam  PRODUCT_B_WIDTH = SUMA_WIDTH + DINB_WIDTH;
localparam  PRODUCT_C_WIDTH = SUBA_WIDTH + DINB_WIDTH;

localparam  MULT_WIDTH = DINA_WIDTH + DINB_WIDTH + 2'd2; 



input   signed  [DINA_WIDTH - 1:0]  dina_i;
input   signed  [DINA_WIDTH - 1:0]  dina_q;
input   signed  [DINB_WIDTH - 1:0]  dinb_i;
input   signed  [DINB_WIDTH - 1:0]  dinb_q;
output  signed  [MULT_WIDTH - 1:0]  mult_i;
output  signed  [MULT_WIDTH - 1:0]  mult_q;

//result_i = a_i * (b_i + b_q) - b_q * (a_i + a_q) 
//result_q = a_i * (b_i + b_q) - b_i * (a_i - a_q)

wire    signed  [SUMB_WIDTH - 1:0]  sumb;
wire    signed  [SUMA_WIDTH - 1:0]  suma;
wire    signed  [SUBA_WIDTH - 1:0]  suba;

wire    signed  [PRODUCT_A_WIDTH - 1:0] product_a;  
wire    signed  [PRODUCT_B_WIDTH - 1:0] product_b;
wire    signed  [PRODUCT_C_WIDTH - 1:0] product_c;

assign sumb[SUMB_WIDTH - 1:0] = dinb_i + dinb_q;
assign suma[SUMA_WIDTH - 1:0] = dina_i + dina_q;
assign suba[SUBA_WIDTH - 1:0] = dina_i - dina_q;

signed_mult
#(
                           .A_WIDTH             (DINA_WIDTH),
                           .B_WIDTH             (SUMB_WIDTH)
                         )
u0_signed_mult(/*autoinst*/
                           // Outputs
                           .product             (product_a[PRODUCT_A_WIDTH-1:0]),
                           // Inputs
                           .multa               (dina_i[DINA_WIDTH-1:0]),
                           .multb               (sumb[SUMB_WIDTH-1:0]));

signed_mult 
#(
                           .A_WIDTH             (DINB_WIDTH),
                           .B_WIDTH             (SUMA_WIDTH)
                         )
u1_signed_mult(/*autoinst*/
                           // Outputs
                           .product             (product_b[PRODUCT_B_WIDTH-1:0]),
                           // Inputs
                           .multa               (dinb_q[DINB_WIDTH-1:0]),
                           .multb               (suma[SUMA_WIDTH-1:0]));

signed_mult
#(
                           .A_WIDTH             (DINB_WIDTH),
                           .B_WIDTH             (SUBA_WIDTH)
                         )
u2_signed_mult(/*autoinst*/
                           // Outputs
                           .product             (product_c[PRODUCT_C_WIDTH-1:0]),
                           // Inputs
                           .multa               (dinb_i[DINB_WIDTH-1:0]),
                           .multb               (suba[SUBA_WIDTH-1:0]));

assign mult_i[MULT_WIDTH-1:0] = product_a - product_b;
assign mult_q[MULT_WIDTH-1:0] = product_a - product_c;


endmodule
