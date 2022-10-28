`resetall
`timescale 1ns/10ps
module Encoder #( //parameters DECLARTION
  parameter AMBA_WORD = 32,
  parameter DATA_WIDTH = 32
  )
  //I/O PORT DECLARTION
  (
  input wire                  clk,
  input wire                  reset,            //async reset - active low
  input wire [DATA_WIDTH-1:0] data_in,
  input wire [AMBA_WORD-1:0]  CodeWord_Width,
  input wire                  En,
  
  output reg [DATA_WIDTH-1:0] data_out,
  output reg                  ready_Encoder
);

reg [31:0] data_out_temp ; 

always@(*)
begin:loopi5
   if (CodeWord_Width[1:0] == 2'b00)  //if the Codeword_size = 8 bits
   begin
    		data_out_temp[0] = data_in[3] ^ data_in[1] ^ data_in[0];
    		data_out_temp[1] = data_in[0] ^ data_in[2] ^ data_in[3];
    		data_out_temp[2] = data_in[3] ^ data_in[1] ^ data_in[2];
    		data_out_temp[3] = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_out_temp[0] ^ data_out_temp[1] ^ data_out_temp[2];
    		data_out_temp[7:4] = data_in[3:0];
    		data_out_temp[31:8] = 0;
   end
   else if (CodeWord_Width[1:0] == 2'b01) //if the Codeword_size = 16 bits
   begin
    		data_out_temp[0] = data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4] ^ data_in[6] ^ data_in[8] ^ data_in[10];
    		data_out_temp[1] = data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[6] ^ data_in[9] ^ data_in[10];
    		data_out_temp[2] = data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10];
    		data_out_temp[3] = data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10];
    		data_out_temp[4] = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_out_temp[0] ^ data_out_temp[1] ^ data_out_temp[2] ^ data_out_temp[3];
    		data_out_temp[15:5] = data_in[10:0];
    		data_out_temp[31:16] = 0;
   end
   else if (CodeWord_Width[1:0] == 2'b10)  //if the Codeword_size = 32 bits
   begin
    		data_out_temp[0] = data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4] ^ data_in[6] ^ data_in[8] ^ data_in[10] ^ data_in[11] ^ data_in[13] ^ data_in[15] ^ data_in[17] ^ data_in[19] ^ data_in[21] ^ data_in[23] ^ data_in[25];
    		data_out_temp[1] = data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[6] ^ data_in[9] ^ data_in[10] ^ data_in[12] ^ data_in[13] ^ data_in[16] ^ data_in[17] ^ data_in[20] ^ data_in[21] ^ data_in[24] ^ data_in[25];
    		data_out_temp[2] = data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[14] ^ data_in[15] ^ data_in[16] ^ data_in[17] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[25];
    		data_out_temp[3] = data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[18] ^ data_in[19] ^ data_in[20] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[25];
    		data_out_temp[4] = data_in[11] ^ data_in[12] ^ data_in[13] ^ data_in[14] ^ data_in[15] ^ data_in[16] ^ data_in[17] ^ data_in[18] ^ data_in[19] ^ data_in[20] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[25];
    		data_out_temp[5] = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[11] ^ data_in[12] ^ data_in[13] ^ data_in[14] ^ data_in[15] ^ data_in[16] ^ data_in[17] ^ data_in[18] ^ data_in[19] ^ data_in[20] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[25] ^ data_out_temp[0] ^ data_out_temp[1] ^ data_out_temp[2] ^ data_out_temp[3] ^ data_out_temp[4];
    		data_out_temp[31:6] = data_in[25:0];
   end
   else
   data_out_temp = 0;
end

always@(posedge clk or negedge reset)
begin:loopi6
   if (!reset)
    begin
      data_out <= 0;
    end
   else
    begin
      if (En == 1)
      begin
        data_out <= data_out_temp[DATA_WIDTH-1:0];
        ready_Encoder <= 1'b1;
      end
      else
      begin
        ready_Encoder <= 1'b0;
        data_out <= 0;
      end
    end
end
endmodule
