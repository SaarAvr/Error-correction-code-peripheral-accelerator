//
// Verilog Module my_project50_lib.coverage
//
// Created:
//          by - aharonlu.UNKNOWN (L330W528)
//          at - 12:40:41 12/14/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module coverage #(
  parameter AMBA_WORD = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH = 32)
( 
   Interface.checker_coverager coverage_bus
);
covergroup regular_test @(posedge coverage_bus.clk);
	
				reset : coverpoint coverage_bus.reset{
         bins low = {0};
         bins high = {1};
          }
          
        code_width_reg : coverpoint coverage_bus.code_width_reg{
         bins bits8 = {0};
         bins bits16 = {1};
         bins bits32 = {2};
          }
        
        noise_reg : coverpoint coverage_bus.noise_reg{
         bins errors0 = {0};
         bins errors1 = {1};
         bins errors2 = {2};
          }
          
        paddr : coverpoint coverage_bus.paddr{
         bins control_reg = {0};
         bins data_in_reg = {4};
         bins code_width_reg = {8};
         bins noise_reg = {12};
          }
          
        penable : coverpoint coverage_bus.penable{
         bins low = {0};
         bins high = {1};
          } 
          
        psel : coverpoint coverage_bus.psel{
         bins low = {0};
         bins high = {1};
          }  
          
        pwrite : coverpoint coverage_bus.pwrite{
         bins low = {0};
         bins high = {1};
          } 
        
				endgroup 

regular_test tst = new();






covergroup control_reg_test @(coverage_bus.control_reg);


        control_reg : coverpoint coverage_bus.control_reg{
         bins encode = {0};
         bins decode = {1};
         bins full_channel = {2};
          }
        
endgroup 

control_reg_test tst1 = new();






covergroup oper_test @(coverage_bus.operation);


        data_in_reg : coverpoint coverage_bus.data_in_reg{
         bins first = {[0:16]};
         bins second = {[17:256]};
         bins third = {[257:2048]};
         bins fourth = {[2049:65536]};
         bins fifth = {[65537:67108868]};
         bins sixth = {[67108867:4294967295]};
          }
        
endgroup 

oper_test tst2 = new();

endmodule



// , , , pwdata, , 