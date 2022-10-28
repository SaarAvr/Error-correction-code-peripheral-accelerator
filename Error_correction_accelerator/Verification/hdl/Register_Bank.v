`resetall
`timescale 1ns/10ps
module Register_Bank #( 
parameter AMBA_WORD = 32,
parameter AMBA_ADDR_WIDTH = 20
)
   //I/O PORT DECLARTION
(
  input  wire                        clk,
  input  wire                        reset,
  input  wire  [AMBA_ADDR_WIDTH-1:0] PADDR,
  input  wire  [AMBA_WORD-1:0]       PWDATA,
  input  wire  [1:0]                 REG_ENABLE,
  
  output reg   [AMBA_WORD-1:0]       CTRL,
  output reg   [AMBA_WORD-1:0]       DATA_IN,
  output reg   [AMBA_WORD-1:0]       CODEWORD_WIDTH,
  output reg   [AMBA_WORD-1:0]       NOISE,
  
  output reg   [AMBA_WORD-1:0]       PRDATA,
  output reg                         CTRL_ready
  );
  
  always@(posedge clk or negedge reset)
  begin:loopi11
    if (!reset)
    begin
      CTRL <= 0;
      DATA_IN <= 0;
      CODEWORD_WIDTH <= 0;
      NOISE <= 0;
      CTRL_ready <= 0;
      PRDATA <= 0;
    end       
    
    else
    begin
      if      (REG_ENABLE == 2'b01)
        case (PADDR[3:0])
          4'b0000: begin
               CTRL            <= PWDATA;
               CTRL_ready      <=   1'b1;
               end
          4'b0100: begin
               DATA_IN         <= PWDATA;
               CTRL_ready      <=   1'b0;
               end 
          4'b1000: begin
               CODEWORD_WIDTH  <= PWDATA;
               CTRL_ready      <=   1'b0;
               end
          4'b1100: begin
               NOISE           <= PWDATA;
               CTRL_ready      <=   1'b0;
               end 
               default: CTRL_ready <= 1'b0; 
        endcase   
      else if (REG_ENABLE == 2'b10)
        case (PADDR[3:0])
          4'b0000: begin
               PRDATA          <= CTRL;
               CTRL_ready      <=   1'b0;
               end 
          4'b0100: begin
               PRDATA          <= DATA_IN;
               CTRL_ready      <=   1'b0;
               end  
          4'b1000: begin
               PRDATA          <= CODEWORD_WIDTH;
               CTRL_ready      <=   1'b0;
               end 
          4'b1100: begin
               PRDATA          <= NOISE;
               CTRL_ready      <=   1'b0;
               end 
           default: CTRL_ready <= 1'b0; 
        endcase
        else
          CTRL_ready      <=   1'b0;
    end
  end
endmodule

