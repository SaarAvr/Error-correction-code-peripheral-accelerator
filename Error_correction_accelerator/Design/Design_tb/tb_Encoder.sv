`resetall
`timescale 1ns/10ps
module tb_Encoder ;

parameter AMBA_WORD = 32;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 32;

logic                  clk = 1'b0;
logic                  reset = 1'b0;
logic [DATA_WIDTH-1:0] data_in = 1'd0;
logic [AMBA_WORD-1:0]  CodeWord_Width = 1'd0;
logic [DATA_WIDTH-1:0] data_out;
logic                  ready_Encoder;
logic                  En;

always //generate clk (what is the clock frequency & duty cycle in this simulation?)
 #1 clk <= ~clk;

Encoder #(
.AMBA_WORD(AMBA_WORD), .DATA_WIDTH(DATA_WIDTH)) Encoder_inst
(
.clk               (clk),
.reset             (reset),
.data_in           (data_in),
.CodeWord_Width    (CodeWord_Width),
.En                (En),
.data_out		        (data_out),
.ready_Encoder		   (ready_Encoder)
);

initial begin
  
  #10.2ns;  //asyncrounsly de-assert asrtn
  reset <= 1'b0;
  #10; // keep low for 10 ticks
  @(posedge clk) reset <= 0'b1; //assert with clk rising edge
  
  repeat(10) @(posedge clk); //wait 10 cycles
  
  data_in <= 26'b10101010101010101010101010;
  CodeWord_Width[1:0] <= 2'b10;
  En <= 1'b0;
  
  repeat(1) @(posedge clk); //wait 10 cycles 
  
  data_in <= 26'b10101010101010101010101010;
  CodeWord_Width[1:0] <= 2'b10;
  En <= 1'b1;
  
  repeat(1) @(posedge clk); //wait 10 cycles
  
  data_in <= 26'b10101010101010101010101010;
  CodeWord_Width[1:0] <= 2'b10;
  En <= 1'b1;
  
  
  #100;
  $finish(0);
end

endmodule
