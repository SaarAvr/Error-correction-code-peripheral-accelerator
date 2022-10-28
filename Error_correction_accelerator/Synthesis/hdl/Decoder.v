`resetall
`timescale 1ns/10ps
module Decoder#(
  parameter AMBA_WORD = 32,
  parameter DATA_WIDTH = 32
  )
    //I/O PORT DECLARTION
   (
  input wire                  clk,
  input wire                  reset,            
  input wire [DATA_WIDTH-1:0] data_in,
  input wire [AMBA_WORD-1:0]  CodeWord_Width,
  input wire                  En,
  
  output reg [DATA_WIDTH-1:0] data_out,
  output reg [1:0]            num_of_error,
  output reg                  ready_Decoder
);
   
reg [3:0]            s1;
reg [4:0]            s2;
reg [5:0]            s3;
reg [31:0] data_out_temp1 ;
reg [31:0] data_out_temp2 ;
reg [31:0] data_out_temp3 ;
reg [1:0]            num_of_error_temp1 ;
reg [1:0]            num_of_error_temp2 ;
reg [1:0]            num_of_error_temp3 ;
reg [1:0]            num_of_error_temp ;




always@(*)
begin:loopi
   if (CodeWord_Width[1:0] == 2'b00)      //if the Codeword_size = 8 bits
   begin
    		s1[3] = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    		s1[2] = data_in[2] ^ data_in[5] ^ data_in[6] ^ data_in[7];
    		s1[1] = data_in[1] ^ data_in[4] ^ data_in[6] ^ data_in[7];
    		s1[0] = data_in[0] ^ data_in[4] ^ data_in[5] ^ data_in[7];  
    		data_out_temp1[31:4] = 0;       
      if (s1[3:0] == 0)
		  begin
        num_of_error_temp1 = 2'd0;
        data_out_temp1[3:0] = {data_in[7:4]};
		  end	
		  else	
  		  begin
  		    num_of_error_temp1 = 2'd1;
      		case (s1[3:0])            //finding the error bit
        			4'b1001	: data_out_temp1[3:0] = {data_in[7:4]};
        			4'b1010	: data_out_temp1[3:0] = {data_in[7:4]};
        			4'b1100	: data_out_temp1[3:0] = {data_in[7:4]};
        			4'b1000	: data_out_temp1[3:0] = {data_in[7:4]};
        			4'b1011	: data_out_temp1[3:0] = {data_in[7:5],~data_in[4]};
        			4'b1101	: data_out_temp1[3:0] = {data_in[7:6],~data_in[5],data_in[4]};
        			4'b1110	: data_out_temp1[3:0] = {data_in[7],~data_in[6],data_in[5:4]};
        			4'b1111	: data_out_temp1[3:0] = {~data_in[7],data_in[6:4]};
        			default : 
        			begin
        			num_of_error_temp1 = 2'd2;
        			data_out_temp1[3:0] = {data_in[7:4]};
    			    end
  		    endcase
		  end
		end
		else begin
		 s1 = 0;
		 num_of_error_temp1 = 2'd0;
		 data_out_temp1 = 0;
		 end
end

always@(*)
begin:loopi1
   if (CodeWord_Width[1:0] == 2'b01)        //if the Codeword_size = 16 bits
   begin
    		s2[4] = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[11] ^ data_in[12] ^ data_in[13] ^ data_in[14] ^ data_in[15];
    		s2[3] = data_in[3] ^ data_in[9] ^ data_in[10] ^ data_in[11] ^ data_in[12] ^ data_in[13] ^ data_in[14] ^ data_in[15];    		
    		s2[2] = data_in[2] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[12] ^ data_in[13] ^ data_in[14] ^ data_in[15];
    		s2[1] = data_in[1] ^ data_in[5] ^ data_in[7] ^ data_in[8] ^ data_in[10] ^ data_in[11] ^ data_in[14] ^ data_in[15];
    		s2[0] = data_in[0] ^ data_in[5] ^ data_in[6] ^ data_in[8] ^ data_in[9] ^ data_in[11] ^ data_in[13] ^ data_in[15]; 
    		data_out_temp2[31:11] = 0;        
      if (s2[4:0] == 0)
		  begin
        num_of_error_temp2 = 2'd0;
        data_out_temp2[10:0] = {data_in[15:5]};
		  end	
		  else	
  		  begin
  		    num_of_error_temp2 = 2'd1;
      		case (s2[4:0])            //finding the error bit
        			5'b10001	: data_out_temp2[10:0] = {data_in[15:5]};
        			5'b10010	: data_out_temp2[10:0] = {data_in[15:5]};
        			5'b10100	: data_out_temp2[10:0] = {data_in[15:5]};
        			5'b11000	: data_out_temp2[10:0] = {data_in[15:5]};
        			5'b10000	: data_out_temp2[10:0] = {data_in[15:5]};
        			5'b10011	: data_out_temp2[10:0] = {data_in[15:6],~data_in[5]};
        			5'b10101	: data_out_temp2[10:0] = {data_in[15:7],~data_in[6],data_in[5]};
        			5'b10110	: data_out_temp2[10:0] = {data_in[15:8],~data_in[7],data_in[6:5]};
        			5'b10111	: data_out_temp2[10:0] = {data_in[15:9],~data_in[8],data_in[7:5]};
        			5'b11001	: data_out_temp2[10:0] = {data_in[15:10],~data_in[9],data_in[8:5]};
        			5'b11010	: data_out_temp2[10:0] = {data_in[15:11],~data_in[10],data_in[9:5]};
        			5'b11011	: data_out_temp2[10:0] = {data_in[15:12],~data_in[11],data_in[10:5]};
        			5'b11100	: data_out_temp2[10:0] = {data_in[15:13],~data_in[12],data_in[11:5]};
        			5'b11101	: data_out_temp2[10:0] = {data_in[15:14],~data_in[13],data_in[12:5]};
        			5'b11110	: data_out_temp2[10:0] = {data_in[15],~data_in[14],data_in[13:5]};
        			5'b11111	: data_out_temp2[10:0] = {~data_in[15],data_in[14:5]};
        			default : 
        			begin
        			num_of_error_temp2 = 2'd2;
        			data_out_temp2[10:0] = {data_in[15:5]};
    			    end
  		    endcase
		  end
		end
		else begin
		 s2 = 0; 
		 num_of_error_temp2 = 2'd0;
		 data_out_temp2 = 0;
		 end
end

always@(*)
begin:loopi2
   if (CodeWord_Width[1:0] == 2'b10)     //if the Codeword_size = 32 bits
   begin
    		s3[5] = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[11] ^ data_in[12] ^ data_in[13] ^ data_in[14] ^ data_in[15] ^ data_in[16] ^ data_in[17] ^ data_in[18] ^ data_in[19] ^ data_in[20] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[25] ^ data_in[26] ^ data_in[27] ^ data_in[28] ^ data_in[29] ^ data_in[30] ^ data_in[31];
    		s3[4] = data_in[4] ^ data_in[17] ^ data_in[18] ^ data_in[19] ^ data_in[20] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[25] ^ data_in[26] ^ data_in[27] ^ data_in[28] ^ data_in[29] ^ data_in[30] ^ data_in[31]; 
    		s3[3] = data_in[3] ^ data_in[10] ^ data_in[11] ^ data_in[12] ^ data_in[13] ^ data_in[14] ^ data_in[15] ^ data_in[16] ^ data_in[24] ^ data_in[25] ^ data_in[26] ^ data_in[27] ^ data_in[28] ^ data_in[29] ^ data_in[30] ^ data_in[31];    		
    		s3[2] = data_in[2] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[13] ^ data_in[14] ^ data_in[15] ^ data_in[16] ^ data_in[20] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[28] ^ data_in[29] ^ data_in[30] ^ data_in[31];
    		s3[1] = data_in[1] ^ data_in[6] ^ data_in[8] ^ data_in[9] ^ data_in[11] ^ data_in[12] ^ data_in[15] ^ data_in[16] ^ data_in[18] ^ data_in[19] ^ data_in[22] ^ data_in[23] ^ data_in[26] ^ data_in[27] ^ data_in[30] ^ data_in[31];
    		s3[0] = data_in[0] ^ data_in[6] ^ data_in[7] ^ data_in[9] ^ data_in[10] ^ data_in[12] ^ data_in[14] ^ data_in[16] ^ data_in[17] ^ data_in[19] ^ data_in[21] ^ data_in[23] ^ data_in[25] ^ data_in[27] ^ data_in[29] ^ data_in[31];         
      data_out_temp3[31:26] = 0;
      if (s3[5:0] == 0)
		  begin
        num_of_error_temp3 = 2'd0;
        data_out_temp3[25:0] = {data_in[31:6]};
		  end	
		  else	
  		  begin
  		    num_of_error_temp3 = 2'd1;
      		case (s3[5:0])                 //finding the error bit
        			6'b100001	: data_out_temp3[25:0] = {data_in[31:6]};
        			6'b100010	: data_out_temp3[25:0] = {data_in[31:6]};
        			6'b100100	: data_out_temp3[25:0] = {data_in[31:6]};
        			6'b101000	: data_out_temp3[25:0] = {data_in[31:6]};
        			6'b110000	: data_out_temp3[25:0] = {data_in[31:6]};
        			6'b100000	: data_out_temp3[25:0] = {data_in[31:6]};
        			6'b100011	: data_out_temp3[25:0] = {data_in[31:7],~data_in[6]};
        			6'b100101	: data_out_temp3[25:0] = {data_in[31:8],~data_in[7],data_in[6]};
        			6'b100110	: data_out_temp3[25:0] = {data_in[31:9],~data_in[8],data_in[7:6]};
        			6'b100111	: data_out_temp3[25:0] = {data_in[31:10],~data_in[9],data_in[8:6]};
        			6'b101001	: data_out_temp3[25:0] = {data_in[31:11],~data_in[10],data_in[9:6]};
        			6'b101010	: data_out_temp3[25:0] = {data_in[31:12],~data_in[11],data_in[10:6]};
        			6'b101011	: data_out_temp3[25:0] = {data_in[31:13],~data_in[12],data_in[11:6]};
        			6'b101100	: data_out_temp3[25:0] = {data_in[31:14],~data_in[13],data_in[12:6]};
        			6'b101101	: data_out_temp3[25:0] = {data_in[31:15],~data_in[14],data_in[13:6]};
        			6'b101110	: data_out_temp3[25:0] = {data_in[31:16],~data_in[15],data_in[14:6]};
        			6'b101111	: data_out_temp3[25:0] = {data_in[31:17],~data_in[16],data_in[15:6]};
        			6'b110001	: data_out_temp3[25:0] = {data_in[31:18],~data_in[17],data_in[16:6]};
        			6'b110010	: data_out_temp3[25:0] = {data_in[31:19],~data_in[18],data_in[17:6]};
        			6'b110011	: data_out_temp3[25:0] = {data_in[31:20],~data_in[19],data_in[18:6]};
        			6'b110100	: data_out_temp3[25:0] = {data_in[31:21],~data_in[20],data_in[19:6]};
        			6'b110101	: data_out_temp3[25:0] = {data_in[31:22],~data_in[21],data_in[20:6]};
        			6'b110110	: data_out_temp3[25:0] = {data_in[31:23],~data_in[22],data_in[21:6]};
        			6'b110111	: data_out_temp3[25:0] = {data_in[31:24],~data_in[23],data_in[22:6]};
        			6'b111000	: data_out_temp3[25:0] = {data_in[31:25],~data_in[24],data_in[23:6]};
        			6'b111001	: data_out_temp3[25:0] = {data_in[31:26],~data_in[25],data_in[24:6]};
        			6'b111010	: data_out_temp3[25:0] = {data_in[31:27],~data_in[26],data_in[25:6]};
        			6'b111011	: data_out_temp3[25:0] = {data_in[31:28],~data_in[27],data_in[26:6]};
        			6'b111100	: data_out_temp3[25:0] = {data_in[31:29],~data_in[28],data_in[27:6]};
        			6'b111101	: data_out_temp3[25:0] = {data_in[31:30],~data_in[29],data_in[28:6]};
        			6'b111110	: data_out_temp3[25:0] = {data_in[31],~data_in[30],data_in[29:6]};
        			6'b111111	: data_out_temp3[25:0] = {~data_in[31],data_in[30:6]};
        			default : 
        			begin
        			num_of_error_temp3 = 2'd2;
        			data_out_temp3[25:0] = {data_in[31:6]};
    			    end
  		    endcase
		  end
		end 
		else begin
		 s3 = 0;
		 num_of_error_temp3 = 2'd0;
		 data_out_temp3 = 0;
		 end
end




always@(posedge clk or negedge reset)
begin:loopi3
   if (!reset)
    begin
      data_out <= 0;
      num_of_error <= 2'b0;
      ready_Decoder <= 1'b0;
    end
   else
   begin
      if (En == 1)
      begin	  
		if (CodeWord_Width[1:0] == 2'b00) begin
		data_out <= data_out_temp1[DATA_WIDTH-1:0];
		num_of_error <= num_of_error_temp1;
		end
		else if (CodeWord_Width[1:0] == 2'b01)begin
		data_out <= data_out_temp2[DATA_WIDTH-1:0];
		num_of_error <= num_of_error_temp2;
		end
		else begin
		data_out <= data_out_temp3[DATA_WIDTH-1:0];
		num_of_error <= num_of_error_temp3;
		end
      ready_Decoder <= 1'b1;
      end
      else
      begin
        ready_Decoder <= 1'b0;
        data_out <= 0;
      end
    end
  end
endmodule
