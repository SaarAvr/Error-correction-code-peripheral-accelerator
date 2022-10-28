`resetall
`timescale 1ns/10ps
module tb_APB_Slave ;
  
parameter AMBA_WORD = 16;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 8;


logic                       clk = 1'b0;
logic                       reset;            //async reset - active low
logic                       PENABLE;
logic                       PSEL;
  
logic                       REG_ENABLE;

always //generate clk (what is the clock frequency & duty cycle in this simulation?)
 #1 clk <= ~clk;
 
APB_Slave #(
.DATA_WIDTH(DATA_WIDTH)) APB_Slave_inst
(
.clk               (clk),
.reset             (reset),
.PENABLE           (PENABLE),
.PSEL              (PSEL),
.REG_ENABLE        (REG_ENABLE)
);

initial begin
  
  #10.2ns;  //asyncrounsly de-assert asrtn
  reset <= 1'b0;
  #10; // keep low for 10 ticks
  @(posedge clk) reset <= 0'b1; //assert with clk rising edge
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  PENABLE  <= 1'b0;
  PSEL     <= 1'b0;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PENABLE  <= 1'b0;
  PSEL     <= 1'b1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PENABLE  <= 1'b1;
  PSEL     <= 1'b1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  PENABLE  <= 1'b0;
  PSEL     <= 1'b0;
  
  #100;
  $finish(0);
end

endmodule
