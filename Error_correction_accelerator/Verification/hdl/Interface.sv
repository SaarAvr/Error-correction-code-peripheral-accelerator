`resetall
`timescale 1ns/10ps
interface Interface#(
  parameter AMBA_WORD = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH = 32)();

//signals declaration
logic                         clk;
logic                         reset;
logic   [AMBA_ADDR_WIDTH-1:0] paddr;
logic                         penable;
logic                         psel;
logic   [AMBA_WORD-1:0]       pwdata;
logic                         pwrite;
  
logic   [AMBA_WORD-1 :0]      prdata;
logic   [DATA_WIDTH-1 :0]     data_out;
logic                         operation_done;
logic   [1:0]                 num_of_errors;
logic   [1:0]                 operation;
logic                         next_line;
logic   [1:0]                 code_width;

logic   [AMBA_WORD-1:0]       control_reg;
logic   [AMBA_WORD-1:0]       data_in_reg;
logic   [AMBA_WORD-1:0]       code_width_reg;
logic   [AMBA_WORD-1:0]       noise_reg;

//modports declaration
modport stimulus (output clk, reset, paddr, penable, psel, pwdata, pwrite, operation, next_line, code_width, control_reg, data_in_reg, code_width_reg, noise_reg);
modport ecc_enc_dec (input clk, reset, paddr, penable, psel, pwdata, pwrite, output prdata, data_out, operation_done, num_of_errors);
modport checker_coverager (input clk, reset, paddr, penable, psel, pwdata, pwrite, control_reg, data_in_reg, code_width_reg, noise_reg, prdata, data_out, operation_done, num_of_errors,operation);
modport vsgoldenmodel (input data_out, operation_done, num_of_errors, operation, next_line, code_width);

 
endinterface