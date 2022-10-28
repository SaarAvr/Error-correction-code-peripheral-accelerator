`resetall
`timescale 1ns/10ps
module ecc_enc_dec#(
  parameter AMBA_WORD = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH = 32
)
( 
   // Port Declarations
 
 input   wire                            clk,
 input   wire                            reset,
 
 input   wire     [AMBA_ADDR_WIDTH-1 :0] PADDR,
 input   wire                            PENABLE,
 input   wire                            PSEL,
 input   wire     [AMBA_WORD-1 :0]       PWDATA,
 input   wire                            PWRITE,

 output   wire    [AMBA_WORD-1 :0]       PRDATA,
 output   wire    [DATA_WIDTH-1 :0]      data_out,
 output   wire                           operation_done,
 output   wire    [1:0]                  num_of_errors
);


//registers 
wire [1:0]                 REG_ENABLE_APB_Slave;

wire [AMBA_WORD-1:0]       CTRL_Register_Bank;
wire [AMBA_WORD-1:0]       DATA_IN_Register_Bank;
wire [AMBA_WORD-1:0]       CODEWORD_WIDTH_Register_Bank;
wire [AMBA_WORD-1:0]       NOISE_Register_Bank;
wire                       CTRL_ready_Register_Bank;



APB_Slave #(
  .DATA_WIDTH(DATA_WIDTH))
APB_Slave(
.clk               (clk),
.reset             (reset),
.PENABLE           (PENABLE),
.PSEL              (PSEL),
.PWRITE            (PWRITE),
.REG_ENABLE        (REG_ENABLE_APB_Slave)
);




Register_Bank #(
.AMBA_WORD(AMBA_WORD), .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH))
Register_Bank(
.clk                  (clk),
.reset                (reset),
.PADDR                (PADDR),
.PWDATA               (PWDATA),
.REG_ENABLE           (REG_ENABLE_APB_Slave),
.CTRL                 (CTRL_Register_Bank),
.DATA_IN              (DATA_IN_Register_Bank),
.CODEWORD_WIDTH       (CODEWORD_WIDTH_Register_Bank),
.NOISE                (NOISE_Register_Bank),
.PRDATA               (PRDATA),
.CTRL_ready           (CTRL_ready_Register_Bank)
);



controller #(
.AMBA_WORD(AMBA_WORD), .DATA_WIDTH(DATA_WIDTH))
controller(
.clk                    (clk),
.reset                  (reset),
.CTRL                   (CTRL_Register_Bank),
.DATA_IN                (DATA_IN_Register_Bank),
.CODEWORD_WIDTH         (CODEWORD_WIDTH_Register_Bank),
.NOISE                  (NOISE_Register_Bank),
.CTRL_ready             (CTRL_ready_Register_Bank),
.data_out               (data_out),
.operation_done         (operation_done),
.num_of_errors          (num_of_errors)
);

endmodule
