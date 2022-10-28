//
// Verilog Module my_project50_lib.tb_overall
//
// Created:
//          by - saaravr.UNKNOWN (L330W523_NEW)
//          at - 14:24:36 12/11/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module tb_overall #(
  parameter AMBA_WORD = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH = 32);

Interface tb();

Stimulus gen(
    .stim_bus(tb)
    );

ecc_enc_dec dut(
    //.dut_bus(tb)
    .clk(tb.clk),
    .reset(tb.reset),
    .PADDR(tb.paddr),
    .PENABLE(tb.penable),
    .PSEL (tb.psel),
    .PWDATA(tb.pwdata),
    .PWRITE(tb.pwrite),
    .PRDATA(tb.prdata),
    .data_out(tb.data_out),
    .operation_done(tb.operation_done),
    .num_of_errors(tb.num_of_errors)
    );

coverage cov(
    .coverage_bus(tb)
    );

Checker check(
    .checker_bus(tb)
    );

GoldModel res_test(
    .gold_bus(tb)
    );


endmodule
