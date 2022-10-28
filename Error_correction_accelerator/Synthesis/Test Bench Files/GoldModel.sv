//
// Verilog Module my_project50_lib.GoldModel
//
// Created:
//          by - aharonlu.UNKNOWN (L330W523_NEW)
//          at - 18:01:12 12/ 7/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module GoldModel #(
  parameter AMBA_WORD = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH = 32)
( 
   // Port Declarations
   Interface.vsgoldenmodel gold_bus
);

`define NULL 0
// Data Types
integer data_file_1;
integer data_file_2;
integer data_file_3;
integer scan_file_1;
integer scan_file_2;
integer scan_file_3;

integer i = 1;
integer k = 0;
integer hit = 0;
integer miss = 0;
integer error = 0;
integer num_of_error = 0;
integer error_vec = 0;


string  str_enc = "../files/enc_in_";
string  str_dec = "../files/enc_out_";
string  str_noise = "../files/noise_";
string  line_enc;
string  line_dec;
string  line_noise;
string  val;
reg  [31:0]     data_out_enc;
reg  [25:0]     data_out_dec;
reg  [31:0]     noise;



initial
begin : init_proc


    //// Initilization
    hit = 0;
    miss = 0;
    error = 0;
    num_of_error = 0;
end

always @(gold_bus.code_width)
begin
    //------------------------------------------------------------------------------------------
    //// The Golden Model Result Image Pixels file
    
    if (gold_bus.code_width == 1)
      error_vec = 8;
    else if (gold_bus.code_width == 2)
      error_vec = 16;
    else 
      error_vec = 32;
      
    val.itoa(gold_bus.code_width);
    data_file_1 = $fopen($sformatf({str_enc, val, ".txt"}) , "r"); // opening file in reading format
    if (data_file_1 == `NULL) begin // checking if we mangaed to open it
      $display("data_file_1 handle was NULL");
      //$finish;
    end
    
    val.itoa(gold_bus.code_width);
    data_file_2 = $fopen($sformatf({str_dec, val, ".txt"}) , "r"); // opening file in reading format
    if (data_file_2 == `NULL) begin // checking if we mangaed to open it
      $display("data_file_2 handle was NULL");
      //$finish;
    end
    
    val.itoa(gold_bus.code_width);
    data_file_3 = $fopen($sformatf({str_noise, val, ".txt"}) , "r"); // opening file in reading format
    if (data_file_3 == `NULL) begin // checking if we mangaed to open it
      $display("data_file_3 handle was NULL");
      //$finish;
    end
end
    //------------------------------------------------------------------------------------------







always @(posedge gold_bus.next_line)
begin : line_reading
  
  if (!$feof(data_file_1)) begin
        scan_file_1 = $fscanf(data_file_1, "%s\n", line_enc); 
        data_out_dec = line_enc.atobin();
  end
  if (!$feof(data_file_2)) begin
        scan_file_2 = $fscanf(data_file_2, "%s\n", line_dec); 
        data_out_enc = line_dec.atobin();
  end
  if (!$feof(data_file_3)) begin
        scan_file_3 = $fscanf(data_file_3, "%s\n", line_noise); 
        noise = line_noise.atobin();
        num_of_error = 0;
        for (k=0;k<error_vec;k=k+1) begin
          num_of_error = num_of_error + noise[k];
        end
  end
end

always @(posedge gold_bus.operation_done)
begin : res_proc 

if (gold_bus.operation == 0) begin
  if (data_out_enc == gold_bus.data_out)
    hit = hit + 1;
  else
    miss = miss + 1;
end
else if (gold_bus.operation == 1) begin
  if (data_out_dec == gold_bus.data_out)
    hit = hit + 1;
  else
    miss = miss + 1;
end
else begin
  if (num_of_error == 2)
    if (num_of_error == gold_bus.num_of_errors)
      hit = hit + 1;
    else
      miss = miss + 1;
  else
    if (data_out_dec == gold_bus.data_out && num_of_error == gold_bus.num_of_errors)
      hit = hit + 1;
    else
      miss = miss + 1; 
end
end
  

endmodule
