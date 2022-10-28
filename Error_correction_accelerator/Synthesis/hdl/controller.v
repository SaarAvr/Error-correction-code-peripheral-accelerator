`resetall
`timescale 1ns/10ps

module controller #( 
parameter AMBA_WORD = 32,
parameter DATA_WIDTH = 32,
parameter FULL_IDLE = 2'b00,
          FULL_SETUP = 2'b01,
          FULL_ACCESS = 2'b10
)

//I/O PORT DECLARTION
(
  input  wire                        clk,
  input  wire                        reset,
  
  input  wire  [AMBA_WORD-1:0]       CTRL,
  input  wire  [AMBA_WORD-1:0]       DATA_IN,
  input  wire  [AMBA_WORD-1:0]       CODEWORD_WIDTH,
  input  wire  [AMBA_WORD-1:0]       NOISE,
  input  wire                        CTRL_ready,
  
  output reg   [DATA_WIDTH-1:0]      data_out,
  output reg                         operation_done,
  output reg   [1:0]                 num_of_errors
  );
  
  reg  [DATA_WIDTH-1:0]   data_in_enc;
  reg  [DATA_WIDTH-1:0]   data_in_enc_full;
  reg  [DATA_WIDTH-1:0]   data_in_enc_real;
  reg  [AMBA_WORD-1:0]    CodeWord_Width_enc;
  reg  [AMBA_WORD-1:0]    CodeWord_Width_enc_full;
  reg  [AMBA_WORD-1:0]    CodeWord_Width_enc_real;
  wire [DATA_WIDTH-1:0]   data_out_enc;
  wire                    ready_Encoder_enc;

  reg  [DATA_WIDTH-1:0]   data_in_dec;
  reg  [DATA_WIDTH-1:0]   data_in_dec_full;
  reg  [DATA_WIDTH-1:0]   data_in_dec_real;
  reg  [AMBA_WORD-1:0]    CodeWord_Width_dec;
  reg  [AMBA_WORD-1:0]    CodeWord_Width_dec_full;
  reg  [AMBA_WORD-1:0]    CodeWord_Width_dec_real;
  wire [DATA_WIDTH-1:0]   data_out_dec;
  wire [1:0]              num_of_error_dec;
  wire                    ready_Decoder_dec;
  
  reg  [1:0]              En_Enc_Dec_encoder;
  reg  [1:0]              En_Enc_Dec_decoder;
  reg  [1:0]              En_Enc_Dec_full;
  reg  [1:0]              En_Enc_Dec_real;
  reg                     flag_enc;
  reg                     flag_dec;
  reg                     flag_full;
  reg                     flag_real;
  
    //defining states
  reg [1:0]     current_state;
  reg [1:0]     next_state;
  
  reg [1:0]     current_state_dec;
  reg [1:0]     next_state_dec;
  
  reg [1:0]     current_state_enc;
  reg [1:0]     next_state_enc;

Encoder #(
.AMBA_WORD(AMBA_WORD), .DATA_WIDTH(DATA_WIDTH))
Encoder(
.clk               (clk),
.reset             (reset),
.data_in           (data_in_enc_real),
.CodeWord_Width    (CodeWord_Width_enc_real),
.En                (En_Enc_Dec_real[0]),
.data_out          (data_out_enc),
.ready_Encoder     (ready_Encoder_enc)
);

Decoder #(
.AMBA_WORD(AMBA_WORD), .DATA_WIDTH(DATA_WIDTH))
Decoder(
.clk               (clk),
.reset             (reset),
.data_in           (data_in_dec_real),
.CodeWord_Width    (CodeWord_Width_dec_real),
.En                (En_Enc_Dec_real[1]),
.data_out          (data_out_dec),
.num_of_error      (num_of_error_dec),
.ready_Decoder     (ready_Decoder_dec)
);

always@(*)
begin:loopi7 
  if (CTRL_ready == 1'b1 || flag_real == 1'b1)
  begin
    if (CTRL[1:0] == 2'b00)
    begin: FULL_FSM2
      case (current_state_enc)
        FULL_IDLE:
          begin
            data_in_enc              =  DATA_IN[DATA_WIDTH-1:0];
            CodeWord_Width_enc       =  CODEWORD_WIDTH;
            En_Enc_Dec_encoder               =  2'b01;
            next_state_enc          = FULL_ACCESS;
            flag_enc                     = 1'b1;
          end
         FULL_ACCESS:
          begin
            next_state_enc          = FULL_IDLE;
            flag_enc                     = 1'b0; 
			data_in_enc              =  DATA_IN[DATA_WIDTH-1:0];	
			CodeWord_Width_enc       =  CODEWORD_WIDTH;	
			En_Enc_Dec_encoder               =  2'b01;
          end  
      default: begin
	  next_state_enc = FULL_IDLE;
	  flag_enc                     = 1'b0;
	  data_in_enc              =  DATA_IN[DATA_WIDTH-1:0];
	  CodeWord_Width_enc       =  CODEWORD_WIDTH;
	  En_Enc_Dec_encoder               =  2'b01;
	  end
      endcase
      end
  else begin
    next_state_enc          = FULL_IDLE;
	flag_enc                     = 1'b0;
	data_in_enc              =  DATA_IN[DATA_WIDTH-1:0];
	CodeWord_Width_enc       =  CODEWORD_WIDTH;
	En_Enc_Dec_encoder               =  2'b01;
	end
  end
  else begin
  next_state_enc          = FULL_IDLE;
  flag_enc                     = 1'b0;
  data_in_enc              =  DATA_IN[DATA_WIDTH-1:0];
  CodeWord_Width_enc       =  CODEWORD_WIDTH;
  En_Enc_Dec_encoder               =  2'b01;
  end
end 

      
always@(*)
begin:loopi9 
  if (CTRL_ready == 1'b1 || flag_real == 1'b1)
  begin       
    if  (CTRL[1:0] == 2'b01)
    begin: FULL_FSM3
      case (current_state_dec)
        FULL_IDLE:
          begin
            data_in_dec              =  DATA_IN[DATA_WIDTH-1:0];
            CodeWord_Width_dec       =  CODEWORD_WIDTH;  
            En_Enc_Dec_decoder               =  2'b10;

            next_state_dec               = FULL_ACCESS;
            flag_dec                     = 1'b1;
          end
         FULL_ACCESS:
          begin
            next_state_dec          = FULL_IDLE;           
            flag_dec                     = 1'b0; 
			data_in_dec              =  DATA_IN[DATA_WIDTH-1:0];
			CodeWord_Width_dec       =  CODEWORD_WIDTH; 
			En_Enc_Dec_decoder               =  2'b10;
          end  
      default: begin
	  next_state_dec = FULL_IDLE;
	  flag_dec                     = 1'b0;
	  data_in_dec              =  DATA_IN[DATA_WIDTH-1:0];
	  CodeWord_Width_dec       =  CODEWORD_WIDTH;
	  En_Enc_Dec_decoder               =  2'b10;	  
	  end
      endcase
    end 
  else begin
   next_state_dec          = FULL_IDLE;
   flag_dec                     = 1'b0;
   data_in_dec              =  DATA_IN[DATA_WIDTH-1:0];
   CodeWord_Width_dec       =  CODEWORD_WIDTH; 
   En_Enc_Dec_decoder               =  2'b10;
   end
  end
 else begin
  next_state_dec          = FULL_IDLE;
  flag_dec                     = 1'b0;
  data_in_dec              =  DATA_IN[DATA_WIDTH-1:0];
  CodeWord_Width_dec       =  CODEWORD_WIDTH;
  En_Enc_Dec_decoder               =  2'b10;  
  end
end 
 
 
 
 
 
    
always@(*)
begin:loopi10 
  if (CTRL_ready == 1'b1 || flag_real == 1'b1)
  begin     
    if (CTRL[1:0] == 2'b10)  
    begin: FULL_FSM
      case (current_state)
        FULL_IDLE:
          begin
              data_in_enc_full         =  DATA_IN[DATA_WIDTH-1:0];
              CodeWord_Width_enc_full       =  CODEWORD_WIDTH;
              En_Enc_Dec_full               =  2'b01;
              flag_full = 1'b1;
              next_state          = FULL_SETUP;
			  data_in_dec_full              =  data_out_enc ^ NOISE[DATA_WIDTH-1:0];
			  CodeWord_Width_dec_full       =  CODEWORD_WIDTH; 
          end
        
        FULL_SETUP:
           begin
              data_in_dec_full              =  data_out_enc ^ NOISE[DATA_WIDTH-1:0];
              CodeWord_Width_dec_full       =  CODEWORD_WIDTH; 
              En_Enc_Dec_full               =  2'b11;
              flag_full = 1'b1;
              next_state          = FULL_ACCESS;  
			  data_in_enc_full         =  DATA_IN[DATA_WIDTH-1:0];
			  CodeWord_Width_enc_full       =  CODEWORD_WIDTH;
            end  
            
        FULL_ACCESS:
           begin
              flag_full = 1'b0;
              next_state          = FULL_IDLE; 
              data_in_dec_full = 0;
              CodeWord_Width_dec_full  = 0;  
			  En_Enc_Dec_full               =  2'b11;
			  data_in_enc_full         =  DATA_IN[DATA_WIDTH-1:0];
			  CodeWord_Width_enc_full       =  CODEWORD_WIDTH;
            end  
            
        default: begin
		next_state = FULL_IDLE;
		flag_full = 1'b0;
		En_Enc_Dec_full               =  2'b11;
		data_in_dec_full              =  data_out_enc ^ NOISE[DATA_WIDTH-1:0];
		CodeWord_Width_dec_full       =  CODEWORD_WIDTH; 
		data_in_enc_full         =  DATA_IN[DATA_WIDTH-1:0];
		CodeWord_Width_enc_full       =  CODEWORD_WIDTH;
		end
      endcase
    end
    else begin
    next_state          = FULL_IDLE;
	flag_full = 1'b0;
	En_Enc_Dec_full               =  2'b11;
	data_in_dec_full              =  data_out_enc ^ NOISE[DATA_WIDTH-1:0];
	CodeWord_Width_dec_full       =  CODEWORD_WIDTH; 
	data_in_enc_full         =  DATA_IN[DATA_WIDTH-1:0];
	CodeWord_Width_enc_full       =  CODEWORD_WIDTH;
	end
  end
  else begin
  next_state          = FULL_IDLE;
  flag_full = 1'b0;
  En_Enc_Dec_full               =  2'b11;
  data_in_dec_full              =  data_out_enc ^ NOISE[DATA_WIDTH-1:0];
  CodeWord_Width_dec_full       =  CODEWORD_WIDTH; 
  data_in_enc_full         =  DATA_IN[DATA_WIDTH-1:0];
  CodeWord_Width_enc_full       =  CODEWORD_WIDTH;
  end
end 
 
always@(*)
 begin:output_to_enc
 if (CTRL[1:0] == 2'b00) begin
  CodeWord_Width_enc_real = CodeWord_Width_enc;
  data_in_enc_real = data_in_enc;
  data_in_dec_real = data_in_dec;
  CodeWord_Width_dec_real = CodeWord_Width_dec;
  En_Enc_Dec_real = En_Enc_Dec_encoder;
  flag_real = flag_enc;
  end
 else if (CTRL[1:0] == 2'b10) begin
  CodeWord_Width_enc_real = CodeWord_Width_enc_full;
  data_in_enc_real = data_in_enc_full;
  data_in_dec_real = data_in_dec_full;
  CodeWord_Width_dec_real = CodeWord_Width_dec_full;
  En_Enc_Dec_real = En_Enc_Dec_full;
  flag_real = flag_full;
  end
 else begin
  data_in_enc_real = data_in_enc;
  CodeWord_Width_enc_real = CodeWord_Width_enc;
  data_in_dec_real = data_in_dec;
  CodeWord_Width_dec_real = CodeWord_Width_dec;
  En_Enc_Dec_real = En_Enc_Dec_decoder;
  flag_real = flag_dec;
end
 end
 
  
  
  
  
  
always@(posedge clk or negedge reset)
begin:loopi8
  if (!reset)
  begin
    data_out       <= 0;
    operation_done <= 0;
    num_of_errors  <= 0;
//    flag           <= 0;
    current_state  <= 0;
//    next_state     <= 0;
  
    current_state_dec <= 0;
    //next_state_dec <= 0;
  
    current_state_enc <= 0;
    //next_state_enc <= 0;
  end
  else
  begin
    if (CTRL[1:0] == 2'b00)
      begin
        current_state_enc <= next_state_enc;
        if (current_state_enc == FULL_ACCESS)
        begin
          data_out           <=  data_out_enc;
          operation_done     <=  ready_Encoder_enc;
        end
        else
        begin
          operation_done <= 1'b0;
		  data_out           <=  data_out_enc;
        end
      end
      else if (CTRL[1:0] == 2'b01)
        begin
          current_state_dec <= next_state_dec;
          if (current_state_dec == FULL_ACCESS)
          begin
            data_out           <=  data_out_dec;  
            num_of_errors      <=  num_of_error_dec;
            operation_done     <=  ready_Decoder_dec;        
          end
          else
          begin
            operation_done <= 1'b0;
			data_out           <=  data_out_dec;  
          end
      end  
      else //if (CTRL[1:0] == 2'b10)
      begin
      current_state <= next_state;
          if (current_state == FULL_ACCESS)
          begin
            data_out           <=  data_out_dec;  
            num_of_errors      <=  num_of_error_dec;
            operation_done     <=  ready_Decoder_dec;
          end
          else
          begin
            operation_done <= 1'b0;
			data_out           <=  data_out_dec;  
          end
      end        
    end
  end
endmodule
