//
// Verilog Module my_project50_lib.tb_ecc_enc_dec
//
// Created:
//          by - aharonlu.UNKNOWN (L330W523_NEW)
//          at - 23:06:24 12/ 1/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module tb_ecc_enc_dec ;

parameter AMBA_WORD = 32;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 32;


logic                         clk = 1'b0;
logic                         reset;
logic   [AMBA_ADDR_WIDTH-1:0] PADDR;
logic                         PENABLE;
logic                         PSEL;
logic   [AMBA_WORD-1:0]       PWDATA;
logic                         PWRITE;
  
logic   [AMBA_WORD-1 :0]      PRDATA;
logic   [DATA_WIDTH-1 :0]     data_out;
logic                         operation_done;
logic   [1:0]                 num_of_errors;
  

always //generate clk (what is the clock frequency & duty cycle in this simulation?)
 #1 clk <= ~clk;
 
ecc_enc_dec #(
.AMBA_WORD(AMBA_WORD), .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) ecc_enc_dec_inst
(
.clk               (clk),
.reset             (reset),
.PADDR             (PADDR),
.PENABLE           (PENABLE),
.PSEL              (PSEL),
.PWDATA            (PWDATA),
.PWRITE            (PWRITE),
.PRDATA            (PRDATA),
.data_out          (data_out),
.operation_done    (operation_done),
.num_of_errors     (num_of_errors)
);


initial begin
  
  #10.2ns;  //asyncrounsly de-assert asrtn
  reset <= 1'b0;
  #10; // keep low for 10 ticks
  @(posedge clk) reset <= 0'b1; //assert with clk rising edge
  
  repeat(3) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 170;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 170;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0;
  
   repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 12;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 3;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 12;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 3;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0; 
  

  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 1;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 1;
  PWRITE       <= 1;
  
   repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0; 
  

  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 1;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 1;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles---------------------------------
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0;
 
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 10;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 10;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0;
  
   repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 12;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 3;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 12;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 3;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0; 
  

  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 0;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 0;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles-----------------------------------------------9898777---
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0; 
 
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 10;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 10;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0;
  
   repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 12;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 3;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 12;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 3;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0; 
  

  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 1;
  PWDATA       <= 2;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 1;
  PSEL         <= 1;
  PWDATA       <= 2;
  PWRITE       <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PENABLE      <= 0;
  PSEL         <= 0;
  PWDATA       <= 0;
  PWRITE       <= 0; 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  #100;
  $finish(0);
end

endmodule
