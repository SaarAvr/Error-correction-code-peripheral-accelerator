//
// Verilog Module my_example_lib.Checker
//
// Created:
//          by - user.UNKNOWN (DESKTOP-A337LJE)
//          at - 11:59:06 11/ 3/2020
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps
module Checker #(
    parameter AMBA_WORD = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH = 32)
( 
   // Port Declarations
   Interface.checker_coverager checker_bus
);

  
property control_reg_active;
				@(checker_bus.paddr) checker_bus.paddr == 0 |=> (checker_bus.control_reg <= 2);
				endproperty

assert property(control_reg_active)
  else $error("error with control_reg");
  cover property(control_reg_active);
  
property code_width_reg_active;
				@(checker_bus.paddr) checker_bus.paddr == 8 |=> (checker_bus.code_width_reg <= 2);
				endproperty

assert property(code_width_reg_active)
  else $error("error with code_width_reg");
  cover property(code_width_reg_active);  
  
property noise_reg_active;
				@(checker_bus.paddr) checker_bus.paddr == 12 |=> (checker_bus.noise_reg <= 2);
				endproperty

assert property(noise_reg_active)
  else $error("error with control_reg");
  cover property(noise_reg_active);     
  
//--------------------------------------------------- 4 bits check --------------------------------------  

property bits4_enc_active;                                                       //check out of encoder 4 bits
				@(checker_bus.operation_done) (checker_bus.operation == 0) |=> (checker_bus.code_width_reg == 0) |=> (checker_bus.data_out <= 255);
				endproperty

assert property(bits4_enc_active)
  else $error("error with operation_done");
  cover property(bits4_enc_active); 
  
property bits4_dec_active;                                                      //check out of decoder 4 bits
				@(checker_bus.operation_done) (checker_bus.operation == 1) |=> (checker_bus.code_width_reg == 0) |=> (checker_bus.data_out <= 15);
				endproperty

assert property(bits4_dec_active)
  else $error("error with operation_done");
  cover property(bits4_dec_active);   
  
property bits4_full_active;                                                         //check out of full channel 4 bits
				@(checker_bus.operation_done) (checker_bus.operation == 2) |=> (checker_bus.code_width_reg == 0) |=> (checker_bus.noise_reg < 2)|=> (checker_bus.data_out <= 255);
				endproperty

assert property(bits4_full_active)
  else $error("error with operation_done");
  cover property(bits4_full_active);   
   
//--------------------------------------------------- 11 bits check --------------------------------------  

property bits11_enc_active;                                                       //check out of encoder 11 bits
				@(checker_bus.operation_done) (checker_bus.operation == 0) |=> (checker_bus.code_width_reg == 1) |=> (checker_bus.data_out <= 65536);
				endproperty

assert property(bits11_enc_active)
  else $error("error with operation_done");
  cover property(bits4_enc_active); 
  
property bits11_dec_active;                                                      //check out of decoder 11 bits
				@(checker_bus.operation_done) (checker_bus.operation == 1) |=> (checker_bus.code_width_reg == 1) |=> (checker_bus.data_out <= 2048);
				endproperty

assert property(bits11_dec_active)
  else $error("error with operation_done");
  cover property(bits4_dec_active);   
  
property bits11_full_active;                                                         //check out of full channel 11 bits
				@(checker_bus.operation_done) (checker_bus.operation == 2) |=> (checker_bus.code_width_reg == 1) |=> (checker_bus.noise_reg < 2)|=> (checker_bus.data_out <= 65536);
				endproperty

assert property(bits11_full_active)
  else $error("error with operation_done");
  cover property(bits4_full_active);  
  
//--------------------------------------------------- 26 bits check --------------------------------------  

property bits26_enc_active;                                                       //check out of encoder 26 bits
				@(checker_bus.operation_done) (checker_bus.operation == 0) |=> (checker_bus.code_width_reg == 2) |=> (checker_bus.data_out <= 4294967295);
				endproperty

assert property(bits26_enc_active)
  else $error("error with operation_done");
  cover property(bits4_enc_active); 
  
property bits26_dec_active;                                                      //check out of decoder 26 bits
				@(checker_bus.operation_done) (checker_bus.operation == 1) |=> (checker_bus.code_width_reg == 2) |=> (checker_bus.data_out <= 67108864);
				endproperty

assert property(bits26_dec_active)
  else $error("error with operation_done");
  cover property(bits4_dec_active);   
  
property bits26_full_active;                                                         //check out of full channel 26 bits
				@(checker_bus.operation_done) (checker_bus.operation == 2) |=> (checker_bus.code_width_reg == 2) |=> (checker_bus.noise_reg < 2)|=> (checker_bus.data_out <= 4294967295);
				endproperty

assert property(bits26_full_active)
  else $error("error with operation_done");
  cover property(bits26_full_active);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
endmodule





//reset, paddr, penable, psel, pwdata, pwrite, control_reg, data_in_reg, code_width_reg, noise_reg
//prdata, data_out, operation_done, num_of_errors
















