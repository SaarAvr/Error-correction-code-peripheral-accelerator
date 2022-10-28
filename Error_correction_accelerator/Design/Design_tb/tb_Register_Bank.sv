//
// Verilog Module my_project50_lib.tb_Register_Bank
//
// Created:
//          by - aharonlu.UNKNOWN (L330W417)
//          at - 14:05:21 11/29/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module tb_Register_Bank ;
  
parameter AMBA_WORD = 16;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 8;


logic                         clk = 1'b0;
logic                         reset;
logic   [AMBA_ADDR_WIDTH-1:0] PADDR;
logic   [AMBA_WORD-1:0]       PWDATA;
logic                         REG_ENABLE;
logic                         CTRL_ready;
  
logic   [AMBA_WORD-1:0]       CTRL;
logic   [AMBA_WORD-1:0]       DATA_IN;
logic   [AMBA_WORD-1:0]       CODEWORD_WIDTH;
logic   [AMBA_WORD-1:0]       NOISE;
  
logic   [AMBA_WORD-1:0]        PRDATA;

always //generate clk (what is the clock frequency & duty cycle in this simulation?)
 #1 clk <= ~clk;
 
Register_Bank #(
.AMBA_WORD(AMBA_WORD), .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH)) Register_Bank_inst
(
.clk               (clk),
.reset             (reset),
.PADDR             (PADDR),
.PWDATA            (PWDATA),
.REG_ENABLE        (REG_ENABLE),
.CTRL              (CTRL),
.DATA_IN           (DATA_IN),
.CODEWORD_WIDTH    (CODEWORD_WIDTH),
.NOISE             (NOISE),
.PRDATA            (PRDATA),
.CTRL_ready        (CTRL_ready)
);


initial begin
  
  #10.2ns;  //asyncrounsly de-assert asrtn
  reset <= 1'b0;
  #10; // keep low for 10 ticks
  @(posedge clk) reset <= 0'b1; //assert with clk rising edge
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PWDATA       <= 0;
  REG_ENABLE   <= 0;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 8;
  PWDATA       <= 8;
  REG_ENABLE   <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PWDATA       <= 10;
  PWRITE       <= 1;
  REG_ENABLE   <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 4;
  PWDATA       <= 8;
  PWRITE       <= 0;
  REG_ENABLE   <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 0;
  PWDATA       <= 3;
  PWRITE       <= 1;
  REG_ENABLE   <= 1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PADDR        <= 12;
  PWDATA       <= 12;
  PWRITE       <= 1;
  REG_ENABLE   <= 0;
  
  
  #100;
  $finish(0);
end

endmodule
