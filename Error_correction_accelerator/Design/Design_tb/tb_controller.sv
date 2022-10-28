//
// Verilog Module my_project50_lib.tb_controller
//
// Created:
//          by - aharonlu.UNKNOWN (L330W417)
//          at - 16:46:44 11/29/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module tb_controller ;
parameter AMBA_WORD = 16;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 8;


logic                         clk = 1'b0;
logic                         reset;
logic   [AMBA_WORD-1:0]       CTRL;
logic   [AMBA_WORD-1:0]       DATA_IN;
logic   [AMBA_WORD-1:0]       CODEWORD_WIDTH;
logic   [AMBA_WORD-1:0]       NOISE;
logic                         CTRL_ready;
  
logic   [DATA_WIDTH-1:0]      data_out;
logic                         operation_done;
logic   [1:0]                 num_of_errors;


always //generate clk (what is the clock frequency & duty cycle in this simulation?)
 #1 clk <= ~clk;
 
controller #(
.AMBA_WORD(AMBA_WORD), .DATA_WIDTH(DATA_WIDTH)) controller_inst
(
.clk               (clk),
.reset             (reset),
.CTRL              (CTRL),
.DATA_IN           (DATA_IN),
.CODEWORD_WIDTH    (CODEWORD_WIDTH),
.NOISE             (NOISE),
.CTRL_ready        (CTRL_ready),
.data_out          (data_out),
.operation_done    (operation_done),
.num_of_errors     (num_of_errors)
);


initial begin
  
  #10.2ns;  //asyncrounsly de-assert asrtn
  reset <= 1'b0;
  #10; // keep low for 10 ticks
  @(posedge clk) reset <= 0'b1; //assert with clk rising edge
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  CTRL              <= 0;
  DATA_IN           <= 0;
  CODEWORD_WIDTH    <= 0;
  NOISE             <= 0;
  CTRL_ready        <= 0;
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  CTRL              <= 2;
  DATA_IN           <= 10;
  CODEWORD_WIDTH    <= 0;
  NOISE             <= 0;
  CTRL_ready        <= 1;
  
 // repeat(1) @(posedge clk); //wait 10 cycles
  
 // CTRL              <= 0;
 // DATA_IN           <= 10;
 // CODEWORD_WIDTH    <= 0;
 // NOISE             <= 0;
 // CTRL_ready        <= 1;
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  CTRL              <= 1;
  DATA_IN           <= 0;
  CODEWORD_WIDTH    <= 0;
  NOISE             <= 0;
  CTRL_ready        <= 1;
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  CTRL              <= 1;
  DATA_IN           <= 0;
  CODEWORD_WIDTH    <= 0;
  NOISE             <= 0;
  CTRL_ready        <= 1;
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  CTRL              <= 0;
  DATA_IN           <= 0;
  CODEWORD_WIDTH    <= 0;
  NOISE             <= 0;
  CTRL_ready        <= 0;
  
  
  #100;
  $finish(0);
end

endmodule
