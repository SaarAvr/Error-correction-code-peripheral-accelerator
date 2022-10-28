`resetall
`timescale 1ns/10ps
module APB_Slave #(
  parameter DATA_WIDTH = 32,
  parameter [1:0]    IDLE = 2'b00,
                     SETUP = 2'b01,
                     ACCESS_APB = 2'b10
  )
  (// Port Declarations
  input wire         clk,
  input wire         reset,            //async reset - active low
  input wire         PENABLE,
  input wire         PSEL,
  input wire         PWRITE,
  
  output reg [1:0]   REG_ENABLE
);

  //defining states
  reg [1:0]     current_state;
  reg [1:0]     next_state;
  
  always@(posedge clk or negedge reset)
  begin:loopi12
    if (!reset)
    begin
      current_state <= IDLE;
      //next_state <= 0;    
    end  
    else
      current_state <= next_state;
  end
  
  always@(current_state or PENABLE or PSEL or PWRITE)
  begin: FSM
    case (current_state)
      IDLE:
        begin
          if      (PENABLE == 1'b0 && PSEL == 1'b1)
          begin
            next_state = SETUP;
            REG_ENABLE = 2'b00;
          end
          else
          begin
            next_state = IDLE;
            REG_ENABLE = 2'b00;
          end
        end
     
      SETUP:
         begin
          if      (PENABLE == 1'b1 && PSEL == 1'b1)
            begin
            next_state = ACCESS_APB;
            if (PWRITE == 1'b1)              
              REG_ENABLE = 2'b01;
            else
              REG_ENABLE = 2'b10;
            end
          else
            begin
            next_state = SETUP;
            REG_ENABLE = 2'b00;
            end
          end

      ACCESS_APB:
         begin
          if      (PENABLE == 1'b0 && PSEL == 1'b1)
            begin
            next_state = SETUP;
            REG_ENABLE = 2'b00;
            end
          else if (PENABLE == 1'b0 && PSEL == 1'b0)
            begin
            next_state = IDLE;
            REG_ENABLE = 2'b00;
            end
          else
          begin
            next_state = ACCESS_APB;
            if (PWRITE == 1'b1)              
              REG_ENABLE = 2'b01;
            else
              REG_ENABLE = 2'b10;
          end
          end
      default: begin
	  next_state = IDLE;
	  REG_ENABLE = 2'b00;
	  end
    endcase
  end
endmodule
