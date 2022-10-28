# Error-correction-code-peripheral-accelerator
Verilog design for accelerator device capable of correcting error of received messages using matrix multiplication

This project was about designing an encoder/decoder for messegages to be sent and received. The design is capable of encoding a binary message to a corresponding codeword and decode a codeword to the original message if it happens to have 1 mistake created by noise in transmisson. For 2 mistakes, the module can identify that there has been a 2 letters mistake but not to correct it. The design is working by matrix multiplication, as described in the 'Project_SPEC' pdf in the Design directory. Furthermore, the project includes a Verification and Synthesis proccess for the design.
