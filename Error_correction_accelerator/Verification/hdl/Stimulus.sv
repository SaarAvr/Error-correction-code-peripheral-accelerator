//
// Verilog Module my_project50_lib.Stimulus
//
// Created:
//          by - aharonlu.UNKNOWN (L330W523_NEW)
//          at - 15:20:12 12/ 7/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module Stimulus #(
  parameter AMBA_WORD = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH = 32)
( 
   // Port Declarations
   Interface.stimulus stim_bus   
);

`define NULL 0

// Data Types-------------------------need to change
integer data_file_1;
integer data_file_2;
integer data_file_3;
integer scan_file_1;
integer scan_file_2;
integer scan_file_3;
integer iteration = 1;
integer num_of_bits;
logic low;
logic high;
integer k = 0;

string  str_enc = "../files/enc_in_";
string  str_dec = "../files/enc_out_";
string  str_noise = "../files/noise_";
string  val;
string  line_enc;
string  line_dec;
string  line_noise;

//-------------------------

reg [25:0]     data_in_enc;
reg [31:0]     data_in_dec;
reg [31:0]     noise;


always begin : clock_generator_proc
    #10 stim_bus.clk = ~stim_bus.clk;
end

always @(posedge stim_bus.clk)
begin : line_reading
  if (stim_bus.paddr == 0) begin
    stim_bus.control_reg  = stim_bus.pwdata;
  end
  else if (stim_bus.paddr == 4) begin
    stim_bus.data_in_reg  = stim_bus.pwdata;
  end
  else if (stim_bus.paddr == 8) begin
    stim_bus.code_width_reg  = stim_bus.pwdata;
  end
  else begin
    stim_bus.noise_reg = 0;
    for (k=0;k<32;k=k+1) begin
      stim_bus.noise_reg = stim_bus.noise_reg + stim_bus.pwdata[k];
    end
  end
end

initial 
begin : stim_proc
  for(stim_bus.code_width=1;stim_bus.code_width<4;stim_bus.code_width=stim_bus.code_width+1) begin
    // Initilization
    stim_bus.clk = 1; // start with clock and reset at '1', while enable at '0'
    stim_bus.reset = 0;
    @(posedge stim_bus.clk); // wait til next rising edge (in other words, wait 20ns)
    stim_bus.reset = 1;
    //stim_bus.clk = 1; // start with clock and reset at '1', while enable at '0'

    //@(posedge stim_bus.clk); // wait til next rising edge (in other words, wait 20ns)
    if (stim_bus.code_width == 1) begin
      low = 3;
      high = 7;
      data_in_enc[25:4] = 0;
      data_in_dec[31:8] = 0;
      noise[31:8] = 0;
    end
    else if (stim_bus.code_width == 2) begin
      low = 10;
      high = 15;
      data_in_enc[25:11] = 0;
      data_in_dec[31:16] = 0;
      noise[31:16] = 0;
    end
    else begin
      low = 25;
      high = 31;
    end
    
    
    val.itoa(stim_bus.code_width);
    data_file_1 = $fopen($sformatf({str_enc, val, ".txt"}), "r");
    if (data_file_1 == `NULL) begin // checking if we mangaed to open it
      $display("data_file_1 handle was NULL");
      $finish;
    end
    
    val.itoa(stim_bus.code_width);
    data_file_2 = $fopen($sformatf({str_dec, val, ".txt"}) , "r");
    if (data_file_2 == `NULL) begin // checking if we mangaed to open it
      $display("data_file_2 handle was NULL");
      $finish;
    end
    
    val.itoa(stim_bus.code_width);
    data_file_3 = $fopen($sformatf({str_noise, val, ".txt"}) , "r");
    if (data_file_3 == `NULL) begin // checking if we mangaed to open it
      $display("data_file_3 handle was NULL");
      $finish;
    end
    
    if (stim_bus.code_width ==1)
      num_of_bits = 16;
    else
      num_of_bits = 1000;
//---------------------------------------------------------------------------------------------------------------------------------------    
    for (iteration =0;iteration<num_of_bits;iteration = iteration+1) begin   
      stim_bus.next_line      <= 1;
      
      if (!$feof(data_file_1)) begin
        scan_file_1 = $fscanf(data_file_1, "%s\n", line_enc); 
        data_in_enc = line_enc.atobin();
      end
      
      if (!$feof(data_file_2)) begin
        scan_file_2 = $fscanf(data_file_2, "%s\n", line_dec); 
        data_in_dec = line_dec.atobin();
      end
      
      if (!$feof(data_file_3)) begin
        scan_file_3 = $fscanf(data_file_3, "%s\n", line_noise); 
        noise = line_noise.atobin();
      end
      
      repeat(1) @(posedge stim_bus.clk); //----- data in-------encode----------------------------   
      stim_bus.paddr        <= 4;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= data_in_enc;
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk);   
      stim_bus.penable      <= 1;
      
      repeat(1) @(posedge stim_bus.clk); //-------------------------width      
      stim_bus.paddr        <= 8;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= (stim_bus.code_width-1);
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk);
      stim_bus.penable      <= 1;
      
      repeat(1) @(posedge stim_bus.clk); //-------------------------CTRL    
      stim_bus.paddr        <= 0;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= 0;
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk); 
      stim_bus.penable      <= 1;
      stim_bus.operation    <= 0;
      
      repeat(1) @(posedge stim_bus.clk); //wait cycle   
      stim_bus.paddr        <= 0;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 0;
      stim_bus.pwdata       <= 0;
      stim_bus.pwrite       <= 0; 
         
      
      repeat(1) @(posedge stim_bus.clk); //-------------------------data in---------decode--------------------------      
      stim_bus.paddr        <= 4;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= data_in_dec;
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk);   
      stim_bus.penable      <= 1;

      repeat(1) @(posedge stim_bus.clk); //-------------------------CTRL    
      stim_bus.paddr        <= 0;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= 1;
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk); 
      stim_bus.penable      <= 1;
      stim_bus.operation    <= 1;
      
      repeat(1) @(posedge stim_bus.clk); //wait cycle 
      stim_bus.paddr        <= 0;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 0;
      stim_bus.pwdata       <= 0;
      stim_bus.pwrite       <= 0;
      
      
      repeat(1) @(posedge stim_bus.clk); //-------------------------data in---------full channel----------------------------------      
      stim_bus.paddr        <= 4;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= data_in_enc;
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk);   
      stim_bus.penable      <= 1;
 
      repeat(1) @(posedge stim_bus.clk); //-------------------------noise    
      stim_bus.paddr        <= 12;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= noise;
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk);
      stim_bus.penable      <= 1;
      
      repeat(1) @(posedge stim_bus.clk); //-------------------------CTRL    
      stim_bus.paddr        <= 0;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 1;
      stim_bus.pwdata       <= 2;
      stim_bus.pwrite       <= 1;      
      repeat(1) @(posedge stim_bus.clk); 
      stim_bus.penable      <= 1;
      stim_bus.operation    <= 2;
      
      repeat(1) @(posedge stim_bus.clk); //wait cycle--------------------$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    
      stim_bus.paddr        <= 0;
      stim_bus.penable      <= 0;
      stim_bus.psel         <= 0;
      stim_bus.pwdata       <= 0;
      stim_bus.pwrite       <= 0;
      
      stim_bus.next_line    <= 0;
      repeat(3) @(posedge stim_bus.clk);
       
      
      
    end
    
end
$display("finishhhhh");
$stop;  


end

//







endmodule
