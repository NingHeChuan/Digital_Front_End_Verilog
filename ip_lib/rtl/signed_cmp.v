module signed_mult(/*autoarg*/
   // Outputs
   product,
   // Inputs
   dat_a, dat_b, tc
   );

parameter   A_WIDTH = 8;
parameter   B_WIDTH = 8;
parameter   PRODUCT_WIDTH = A_WIDTH + B_WIDTH;

input   [A_WIDTH-1:0]   dat_a;
input   [B_WIDTH-1:0]   dat_b;
input                   tc;//0:unsigned 1:signed

output  [PRODUCT_WIDTH-1:0] product;

/*autoreg*/
// Beginning of automatic regs (for this module's undeclared outputs)
reg [PRODUCT_WIDTH-1:0] product;
// End of automatics
reg [A_WIDTH-1:0]dat_a_tmp;
reg [B_WIDTH-1:0]dat_b_tmp;
reg [PRODUCT_WIDTH-1:0]product_tmp;
always @(*)begin
        if(tc)begin
            dat_a_tmp[A_WIDTH-1:0] = dat_a[A_WIDTH-1]? (-dat_a): dat_a;
            dat_b_tmp[B_WIDTH-1:0] = dat_b[B_WIDTH-1]? (-dat_b): dat_b;
            product_tmp[PRODUCT_WIDTH-1:0] = dat_a_tmp * dat_b_tmp;
            product[PRODUCT_WIDTH-1:0] = (dat_a[A_WIDTH-1] ^ dat_b[B_WIDTH-1])? (-product_tmp): product_tmp;   
        end
        else begin
            product[PRODUCT_WIDTH-1:0] = dat_a * dat_b;
        end
end



endmodule

module signed_cmp;

function    [DATA_WIDTH-1:0] max_op;
input   [DATA_WIDTH-1:0]   dat_op0;
input   [DATA_WIDTH-1:0]   dat_op1;

reg    cmp_flag;
if(dat_op0[DATA_WIDTH-1] != dat_op1[DATA_WIDTH-1])begin
    cmp_flag = dat_op0;
end
else begin
    cmp_flag = (dat_op0[DATA_WIDTH-1])? ((-dat_op0[DATA_WIDTH-1:0]) > (-dat_op1[DATA_WIDTH-1:0])): (dat_op0[DATA_WIDTH-1:0] < dat_op1[DATA_WIDTH-1:0]);
end

max_op[DATA_WIDTH-1:0] = cmp_flag? dat_op1[DATA_WIDTH-1:0]: dat_op0[DATA_WIDTH-1:0];

endfunction


function [DATA_WIDTH-1:0] dat_abs;
        input [DATA_WIDTH-1:0] dat_in;

        assign dat_abs[DATA_WIDTH-1:0] = (dat_in[DATA_WIDTH-1])? (-dat_in): dat_in;

endfunction

endmodule
