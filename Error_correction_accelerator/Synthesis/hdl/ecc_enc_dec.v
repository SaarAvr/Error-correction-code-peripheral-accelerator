/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Tue Dec 28 18:34:47 2021
/////////////////////////////////////////////////////////////


module APB_Slave_DATA_WIDTH32 ( clk, reset, PENABLE, PSEL, PWRITE, REG_ENABLE
 );
  output [1:0] REG_ENABLE;
  input clk, reset, PENABLE, PSEL, PWRITE;
  wire   \next_state[0] , n6, n7, n8, n1, n2, n3, n4, n5;
  wire   [1:0] current_state;

  DFFRHQX1 \current_state_reg[0]  ( .D(\next_state[0] ), .CK(clk), .RN(reset), 
        .Q(current_state[0]) );
  DFFRHQX1 \current_state_reg[1]  ( .D(n1), .CK(clk), .RN(reset), .Q(
        current_state[1]) );
  INVX1 U3 ( .A(n7), .Y(n1) );
  NOR2X1 U4 ( .A(PWRITE), .B(n7), .Y(REG_ENABLE[1]) );
  NAND2X1 U5 ( .A(PENABLE), .B(n8), .Y(n7) );
  OAI32X1 U6 ( .A0(n2), .A1(current_state[1]), .A2(n5), .B0(current_state[0]), 
        .B1(n3), .Y(n8) );
  AND2X2 U7 ( .A(PWRITE), .B(n1), .Y(REG_ENABLE[0]) );
  INVX1 U8 ( .A(current_state[0]), .Y(n2) );
  INVX1 U9 ( .A(current_state[1]), .Y(n3) );
  INVX1 U10 ( .A(PSEL), .Y(n5) );
  OAI32X1 U11 ( .A0(n2), .A1(current_state[1]), .A2(PSEL), .B0(n5), .B1(n6), 
        .Y(\next_state[0] ) );
  OAI21XL U12 ( .A0(n2), .A1(n3), .B0(n4), .Y(n6) );
  INVX1 U13 ( .A(PENABLE), .Y(n4) );
endmodule


module Register_Bank_AMBA_WORD32_AMBA_ADDR_WIDTH20 ( clk, reset, PADDR, PWDATA, 
        REG_ENABLE, CTRL, DATA_IN, CODEWORD_WIDTH, NOISE, PRDATA, CTRL_ready
 );
  input [19:0] PADDR;
  input [31:0] PWDATA;
  input [1:0] REG_ENABLE;
  output [31:0] CTRL;
  output [31:0] DATA_IN;
  output [31:0] CODEWORD_WIDTH;
  output [31:0] NOISE;
  output [31:0] PRDATA;
  input clk, reset;
  output CTRL_ready;
  wire   n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n210, n244, n277, n310, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482;

  DFFRHQX1 \PRDATA_reg[31]  ( .D(n373), .CK(clk), .RN(n102), .Q(PRDATA[31]) );
  DFFRHQX1 \PRDATA_reg[30]  ( .D(n372), .CK(clk), .RN(n102), .Q(PRDATA[30]) );
  DFFRHQX1 \PRDATA_reg[29]  ( .D(n371), .CK(clk), .RN(n102), .Q(PRDATA[29]) );
  DFFRHQX1 \PRDATA_reg[28]  ( .D(n370), .CK(clk), .RN(n102), .Q(PRDATA[28]) );
  DFFRHQX1 \PRDATA_reg[27]  ( .D(n369), .CK(clk), .RN(n102), .Q(PRDATA[27]) );
  DFFRHQX1 \PRDATA_reg[26]  ( .D(n368), .CK(clk), .RN(n102), .Q(PRDATA[26]) );
  DFFRHQX1 \PRDATA_reg[25]  ( .D(n367), .CK(clk), .RN(n102), .Q(PRDATA[25]) );
  DFFRHQX1 \PRDATA_reg[24]  ( .D(n366), .CK(clk), .RN(n102), .Q(PRDATA[24]) );
  DFFRHQX1 \PRDATA_reg[23]  ( .D(n365), .CK(clk), .RN(n101), .Q(PRDATA[23]) );
  DFFRHQX1 \PRDATA_reg[22]  ( .D(n364), .CK(clk), .RN(n101), .Q(PRDATA[22]) );
  DFFRHQX1 \PRDATA_reg[21]  ( .D(n363), .CK(clk), .RN(n101), .Q(PRDATA[21]) );
  DFFRHQX1 \PRDATA_reg[20]  ( .D(n362), .CK(clk), .RN(n101), .Q(PRDATA[20]) );
  DFFRHQX1 \PRDATA_reg[19]  ( .D(n361), .CK(clk), .RN(n101), .Q(PRDATA[19]) );
  DFFRHQX1 \PRDATA_reg[18]  ( .D(n360), .CK(clk), .RN(n101), .Q(PRDATA[18]) );
  DFFRHQX1 \PRDATA_reg[17]  ( .D(n359), .CK(clk), .RN(n101), .Q(PRDATA[17]) );
  DFFRHQX1 \PRDATA_reg[16]  ( .D(n358), .CK(clk), .RN(n101), .Q(PRDATA[16]) );
  DFFRHQX1 \PRDATA_reg[15]  ( .D(n357), .CK(clk), .RN(n101), .Q(PRDATA[15]) );
  DFFRHQX1 \PRDATA_reg[14]  ( .D(n356), .CK(clk), .RN(n101), .Q(PRDATA[14]) );
  DFFRHQX1 \PRDATA_reg[13]  ( .D(n355), .CK(clk), .RN(n101), .Q(PRDATA[13]) );
  DFFRHQX1 \PRDATA_reg[12]  ( .D(n354), .CK(clk), .RN(n101), .Q(PRDATA[12]) );
  DFFRHQX1 \PRDATA_reg[11]  ( .D(n353), .CK(clk), .RN(n100), .Q(PRDATA[11]) );
  DFFRHQX1 \PRDATA_reg[10]  ( .D(n352), .CK(clk), .RN(n100), .Q(PRDATA[10]) );
  DFFRHQX1 \PRDATA_reg[9]  ( .D(n351), .CK(clk), .RN(n100), .Q(PRDATA[9]) );
  DFFRHQX1 \PRDATA_reg[8]  ( .D(n350), .CK(clk), .RN(n100), .Q(PRDATA[8]) );
  DFFRHQX1 \PRDATA_reg[7]  ( .D(n349), .CK(clk), .RN(n100), .Q(PRDATA[7]) );
  DFFRHQX1 \PRDATA_reg[6]  ( .D(n348), .CK(clk), .RN(n100), .Q(PRDATA[6]) );
  DFFRHQX1 \PRDATA_reg[5]  ( .D(n347), .CK(clk), .RN(n100), .Q(PRDATA[5]) );
  DFFRHQX1 \PRDATA_reg[4]  ( .D(n346), .CK(clk), .RN(n100), .Q(PRDATA[4]) );
  DFFRHQX1 \PRDATA_reg[3]  ( .D(n345), .CK(clk), .RN(n100), .Q(PRDATA[3]) );
  DFFRHQX1 \PRDATA_reg[2]  ( .D(n344), .CK(clk), .RN(n100), .Q(PRDATA[2]) );
  DFFRHQX1 \PRDATA_reg[1]  ( .D(n343), .CK(clk), .RN(n100), .Q(PRDATA[1]) );
  DFFRHQX1 \PRDATA_reg[0]  ( .D(n342), .CK(clk), .RN(n100), .Q(PRDATA[0]) );
  DFFRHQX1 \CTRL_reg[31]  ( .D(n118), .CK(clk), .RN(n113), .Q(CTRL[31]) );
  DFFRHQX1 \CTRL_reg[30]  ( .D(n119), .CK(clk), .RN(n113), .Q(CTRL[30]) );
  DFFRHQX1 \CTRL_reg[29]  ( .D(n120), .CK(clk), .RN(n113), .Q(CTRL[29]) );
  DFFRHQX1 \CTRL_reg[28]  ( .D(n121), .CK(clk), .RN(n113), .Q(CTRL[28]) );
  DFFRHQX1 \CTRL_reg[27]  ( .D(n122), .CK(clk), .RN(n113), .Q(CTRL[27]) );
  DFFRHQX1 \CTRL_reg[26]  ( .D(n123), .CK(clk), .RN(n112), .Q(CTRL[26]) );
  DFFRHQX1 \CTRL_reg[25]  ( .D(n124), .CK(clk), .RN(n112), .Q(CTRL[25]) );
  DFFRHQX1 \CTRL_reg[24]  ( .D(n125), .CK(clk), .RN(n112), .Q(CTRL[24]) );
  DFFRHQX1 \CTRL_reg[23]  ( .D(n126), .CK(clk), .RN(n112), .Q(CTRL[23]) );
  DFFRHQX1 \CTRL_reg[22]  ( .D(n127), .CK(clk), .RN(n112), .Q(CTRL[22]) );
  DFFRHQX1 \CTRL_reg[21]  ( .D(n128), .CK(clk), .RN(n112), .Q(CTRL[21]) );
  DFFRHQX1 \CTRL_reg[20]  ( .D(n129), .CK(clk), .RN(n112), .Q(CTRL[20]) );
  DFFRHQX1 \CTRL_reg[19]  ( .D(n130), .CK(clk), .RN(n112), .Q(CTRL[19]) );
  DFFRHQX1 \CTRL_reg[18]  ( .D(n131), .CK(clk), .RN(n112), .Q(CTRL[18]) );
  DFFRHQX1 \CTRL_reg[17]  ( .D(n132), .CK(clk), .RN(n112), .Q(CTRL[17]) );
  DFFRHQX1 \CTRL_reg[16]  ( .D(n133), .CK(clk), .RN(n112), .Q(CTRL[16]) );
  DFFRHQX1 \CTRL_reg[15]  ( .D(n134), .CK(clk), .RN(n112), .Q(CTRL[15]) );
  DFFRHQX1 \CTRL_reg[14]  ( .D(n210), .CK(clk), .RN(n111), .Q(CTRL[14]) );
  DFFRHQX1 \CTRL_reg[13]  ( .D(n244), .CK(clk), .RN(n111), .Q(CTRL[13]) );
  DFFRHQX1 \CTRL_reg[12]  ( .D(n277), .CK(clk), .RN(n111), .Q(CTRL[12]) );
  DFFRHQX1 \CTRL_reg[11]  ( .D(n310), .CK(clk), .RN(n111), .Q(CTRL[11]) );
  DFFRHQX1 \CTRL_reg[10]  ( .D(n374), .CK(clk), .RN(n111), .Q(CTRL[10]) );
  DFFRHQX1 \CTRL_reg[9]  ( .D(n375), .CK(clk), .RN(n111), .Q(CTRL[9]) );
  DFFRHQX1 \CTRL_reg[8]  ( .D(n376), .CK(clk), .RN(n111), .Q(CTRL[8]) );
  DFFRHQX1 \CTRL_reg[7]  ( .D(n377), .CK(clk), .RN(n111), .Q(CTRL[7]) );
  DFFRHQX1 \CTRL_reg[6]  ( .D(n378), .CK(clk), .RN(n111), .Q(CTRL[6]) );
  DFFRHQX1 \CTRL_reg[5]  ( .D(n379), .CK(clk), .RN(n111), .Q(CTRL[5]) );
  DFFRHQX1 \CTRL_reg[4]  ( .D(n380), .CK(clk), .RN(n111), .Q(CTRL[4]) );
  DFFRHQX1 \CTRL_reg[3]  ( .D(n381), .CK(clk), .RN(n111), .Q(CTRL[3]) );
  DFFRHQX1 \CTRL_reg[2]  ( .D(n382), .CK(clk), .RN(n110), .Q(CTRL[2]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[31]  ( .D(n449), .CK(clk), .RN(n105), .Q(
        CODEWORD_WIDTH[31]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[30]  ( .D(n450), .CK(clk), .RN(n105), .Q(
        CODEWORD_WIDTH[30]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[29]  ( .D(n451), .CK(clk), .RN(n105), .Q(
        CODEWORD_WIDTH[29]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[28]  ( .D(n452), .CK(clk), .RN(n105), .Q(
        CODEWORD_WIDTH[28]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[27]  ( .D(n453), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[27]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[26]  ( .D(n454), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[26]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[25]  ( .D(n455), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[25]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[24]  ( .D(n456), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[24]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[23]  ( .D(n457), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[23]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[22]  ( .D(n458), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[22]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[21]  ( .D(n459), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[21]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[20]  ( .D(n460), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[20]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[19]  ( .D(n461), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[19]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[18]  ( .D(n462), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[18]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[17]  ( .D(n463), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[17]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[16]  ( .D(n464), .CK(clk), .RN(n104), .Q(
        CODEWORD_WIDTH[16]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[15]  ( .D(n465), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[15]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[14]  ( .D(n466), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[14]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[13]  ( .D(n467), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[13]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[12]  ( .D(n468), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[12]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[11]  ( .D(n469), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[11]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[10]  ( .D(n470), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[10]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[9]  ( .D(n471), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[9]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[8]  ( .D(n472), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[8]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[7]  ( .D(n473), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[7]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[6]  ( .D(n474), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[6]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[5]  ( .D(n475), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[5]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[4]  ( .D(n476), .CK(clk), .RN(n103), .Q(
        CODEWORD_WIDTH[4]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[3]  ( .D(n477), .CK(clk), .RN(n102), .Q(
        CODEWORD_WIDTH[3]) );
  DFFRHQX1 \CODEWORD_WIDTH_reg[2]  ( .D(n478), .CK(clk), .RN(n102), .Q(
        CODEWORD_WIDTH[2]) );
  DFFRHQX1 \NOISE_reg[5]  ( .D(n443), .CK(clk), .RN(n105), .Q(NOISE[5]) );
  DFFRHQX1 \NOISE_reg[0]  ( .D(n448), .CK(clk), .RN(n105), .Q(NOISE[0]) );
  DFFRHQX1 \NOISE_reg[24]  ( .D(n424), .CK(clk), .RN(n107), .Q(NOISE[24]) );
  DFFRHQX1 \NOISE_reg[17]  ( .D(n431), .CK(clk), .RN(n106), .Q(NOISE[17]) );
  DFFRHQX1 \NOISE_reg[4]  ( .D(n444), .CK(clk), .RN(n105), .Q(NOISE[4]) );
  DFFRHQX1 \DATA_IN_reg[29]  ( .D(n387), .CK(clk), .RN(n110), .Q(DATA_IN[29])
         );
  DFFRHQX1 \DATA_IN_reg[27]  ( .D(n389), .CK(clk), .RN(n110), .Q(DATA_IN[27])
         );
  DFFRHQX1 \DATA_IN_reg[26]  ( .D(n390), .CK(clk), .RN(n110), .Q(DATA_IN[26])
         );
  DFFRHQX1 \NOISE_reg[25]  ( .D(n423), .CK(clk), .RN(n107), .Q(NOISE[25]) );
  DFFRHQX1 \NOISE_reg[21]  ( .D(n427), .CK(clk), .RN(n107), .Q(NOISE[21]) );
  DFFRHQX1 \NOISE_reg[19]  ( .D(n429), .CK(clk), .RN(n107), .Q(NOISE[19]) );
  DFFRHQX1 \NOISE_reg[18]  ( .D(n430), .CK(clk), .RN(n106), .Q(NOISE[18]) );
  DFFRHQX1 \NOISE_reg[7]  ( .D(n441), .CK(clk), .RN(n106), .Q(NOISE[7]) );
  DFFRHQX1 \NOISE_reg[3]  ( .D(n445), .CK(clk), .RN(n105), .Q(NOISE[3]) );
  DFFRHQX1 \NOISE_reg[2]  ( .D(n446), .CK(clk), .RN(n105), .Q(NOISE[2]) );
  DFFRHQX1 \NOISE_reg[1]  ( .D(n447), .CK(clk), .RN(n105), .Q(NOISE[1]) );
  DFFRHQX1 \DATA_IN_reg[31]  ( .D(n385), .CK(clk), .RN(n110), .Q(DATA_IN[31])
         );
  DFFRHQX1 \DATA_IN_reg[30]  ( .D(n386), .CK(clk), .RN(n110), .Q(DATA_IN[30])
         );
  DFFRHQX1 \DATA_IN_reg[28]  ( .D(n388), .CK(clk), .RN(n110), .Q(DATA_IN[28])
         );
  DFFRHQX1 \NOISE_reg[31]  ( .D(n417), .CK(clk), .RN(n108), .Q(NOISE[31]) );
  DFFRHQX1 \NOISE_reg[29]  ( .D(n419), .CK(clk), .RN(n107), .Q(NOISE[29]) );
  DFFRHQX1 \NOISE_reg[28]  ( .D(n420), .CK(clk), .RN(n107), .Q(NOISE[28]) );
  DFFRHQX1 \NOISE_reg[27]  ( .D(n421), .CK(clk), .RN(n107), .Q(NOISE[27]) );
  DFFRHQX1 \NOISE_reg[26]  ( .D(n422), .CK(clk), .RN(n107), .Q(NOISE[26]) );
  DFFRHQX1 \NOISE_reg[23]  ( .D(n425), .CK(clk), .RN(n107), .Q(NOISE[23]) );
  DFFRHQX1 \NOISE_reg[22]  ( .D(n426), .CK(clk), .RN(n107), .Q(NOISE[22]) );
  DFFRHQX1 \NOISE_reg[20]  ( .D(n428), .CK(clk), .RN(n107), .Q(NOISE[20]) );
  DFFRHQX1 \NOISE_reg[16]  ( .D(n432), .CK(clk), .RN(n106), .Q(NOISE[16]) );
  DFFRHQX1 \NOISE_reg[11]  ( .D(n437), .CK(clk), .RN(n106), .Q(NOISE[11]) );
  DFFRHQX1 \NOISE_reg[6]  ( .D(n442), .CK(clk), .RN(n105), .Q(NOISE[6]) );
  DFFRHQX1 \NOISE_reg[30]  ( .D(n418), .CK(clk), .RN(n107), .Q(NOISE[30]) );
  DFFRHQX1 \NOISE_reg[15]  ( .D(n433), .CK(clk), .RN(n106), .Q(NOISE[15]) );
  DFFRHQX1 \NOISE_reg[14]  ( .D(n434), .CK(clk), .RN(n106), .Q(NOISE[14]) );
  DFFRHQX1 \NOISE_reg[13]  ( .D(n435), .CK(clk), .RN(n106), .Q(NOISE[13]) );
  DFFRHQX1 \NOISE_reg[12]  ( .D(n436), .CK(clk), .RN(n106), .Q(NOISE[12]) );
  DFFRHQX1 \NOISE_reg[10]  ( .D(n438), .CK(clk), .RN(n106), .Q(NOISE[10]) );
  DFFRHQX1 \NOISE_reg[9]  ( .D(n439), .CK(clk), .RN(n106), .Q(NOISE[9]) );
  DFFRHQX1 \NOISE_reg[8]  ( .D(n440), .CK(clk), .RN(n106), .Q(NOISE[8]) );
  DFFRHQX1 CTRL_ready_reg ( .D(n9), .CK(clk), .RN(n105), .Q(CTRL_ready) );
  DFFRHQX1 \DATA_IN_reg[1]  ( .D(n415), .CK(clk), .RN(n108), .Q(DATA_IN[1]) );
  DFFRHQX1 \DATA_IN_reg[20]  ( .D(n396), .CK(clk), .RN(n109), .Q(DATA_IN[20])
         );
  DFFRHQX1 \DATA_IN_reg[10]  ( .D(n406), .CK(clk), .RN(n108), .Q(DATA_IN[10])
         );
  DFFRHQX1 \CTRL_reg[0]  ( .D(n384), .CK(clk), .RN(n110), .Q(CTRL[0]) );
  DFFRHQX2 \DATA_IN_reg[2]  ( .D(n414), .CK(clk), .RN(n108), .Q(DATA_IN[2]) );
  DFFRHQX2 \DATA_IN_reg[0]  ( .D(n416), .CK(clk), .RN(n108), .Q(DATA_IN[0]) );
  DFFRHQX2 \DATA_IN_reg[23]  ( .D(n393), .CK(clk), .RN(n110), .Q(DATA_IN[23])
         );
  DFFRHQX2 \DATA_IN_reg[8]  ( .D(n408), .CK(clk), .RN(n108), .Q(DATA_IN[8]) );
  DFFRHQX2 \DATA_IN_reg[12]  ( .D(n404), .CK(clk), .RN(n109), .Q(DATA_IN[12])
         );
  DFFRHQX2 \DATA_IN_reg[6]  ( .D(n410), .CK(clk), .RN(n108), .Q(DATA_IN[6]) );
  DFFRHQX2 \DATA_IN_reg[14]  ( .D(n402), .CK(clk), .RN(n109), .Q(DATA_IN[14])
         );
  DFFRHQX2 \DATA_IN_reg[15]  ( .D(n401), .CK(clk), .RN(n109), .Q(DATA_IN[15])
         );
  DFFRHQX2 \DATA_IN_reg[25]  ( .D(n391), .CK(clk), .RN(n110), .Q(DATA_IN[25])
         );
  DFFRHQX2 \DATA_IN_reg[24]  ( .D(n392), .CK(clk), .RN(n110), .Q(DATA_IN[24])
         );
  DFFRHQX2 \DATA_IN_reg[17]  ( .D(n399), .CK(clk), .RN(n109), .Q(DATA_IN[17])
         );
  DFFRHQX2 \DATA_IN_reg[22]  ( .D(n394), .CK(clk), .RN(n109), .Q(DATA_IN[22])
         );
  DFFRHQX2 \DATA_IN_reg[18]  ( .D(n398), .CK(clk), .RN(n109), .Q(DATA_IN[18])
         );
  DFFRHQX2 \DATA_IN_reg[19]  ( .D(n397), .CK(clk), .RN(n109), .Q(DATA_IN[19])
         );
  DFFRHQX2 \DATA_IN_reg[21]  ( .D(n395), .CK(clk), .RN(n109), .Q(DATA_IN[21])
         );
  DFFRHQX2 \DATA_IN_reg[9]  ( .D(n407), .CK(clk), .RN(n108), .Q(DATA_IN[9]) );
  DFFRHQX2 \DATA_IN_reg[11]  ( .D(n405), .CK(clk), .RN(n109), .Q(DATA_IN[11])
         );
  DFFRHQX2 \DATA_IN_reg[7]  ( .D(n409), .CK(clk), .RN(n108), .Q(DATA_IN[7]) );
  DFFRHQX2 \DATA_IN_reg[5]  ( .D(n411), .CK(clk), .RN(n108), .Q(DATA_IN[5]) );
  DFFRHQX2 \DATA_IN_reg[3]  ( .D(n413), .CK(clk), .RN(n108), .Q(DATA_IN[3]) );
  DFFRHQX2 \DATA_IN_reg[13]  ( .D(n403), .CK(clk), .RN(n109), .Q(DATA_IN[13])
         );
  DFFRHQX2 \DATA_IN_reg[4]  ( .D(n412), .CK(clk), .RN(n108), .Q(DATA_IN[4]) );
  DFFRHQX2 \CTRL_reg[1]  ( .D(n383), .CK(clk), .RN(n110), .Q(CTRL[1]) );
  DFFRHQX2 \DATA_IN_reg[16]  ( .D(n400), .CK(clk), .RN(n109), .Q(DATA_IN[16])
         );
  DFFRHQX2 \CODEWORD_WIDTH_reg[1]  ( .D(n479), .CK(clk), .RN(n102), .Q(
        CODEWORD_WIDTH[1]) );
  DFFRHQX2 \CODEWORD_WIDTH_reg[0]  ( .D(n480), .CK(clk), .RN(n102), .Q(
        CODEWORD_WIDTH[0]) );
  AOI222X1 U3 ( .A0(DATA_IN[0]), .A1(n98), .B0(NOISE[0]), .B1(n95), .C0(
        CODEWORD_WIDTH[0]), .C1(n92), .Y(n136) );
  CLKINVX3 U4 ( .A(n59), .Y(n48) );
  CLKINVX3 U5 ( .A(n59), .Y(n47) );
  CLKINVX3 U6 ( .A(n38), .Y(n28) );
  CLKINVX3 U7 ( .A(n38), .Y(n27) );
  CLKINVX3 U8 ( .A(n19), .Y(n7) );
  CLKINVX3 U9 ( .A(n19), .Y(n8) );
  CLKINVX3 U10 ( .A(n78), .Y(n68) );
  CLKINVX3 U11 ( .A(n78), .Y(n67) );
  CLKINVX3 U12 ( .A(n20), .Y(n9) );
  INVX1 U13 ( .A(n21), .Y(n20) );
  CLKINVX3 U14 ( .A(n60), .Y(n49) );
  INVX1 U15 ( .A(n61), .Y(n60) );
  CLKINVX3 U16 ( .A(n39), .Y(n29) );
  INVX1 U17 ( .A(n40), .Y(n39) );
  CLKINVX3 U18 ( .A(n79), .Y(n69) );
  INVX1 U19 ( .A(n80), .Y(n79) );
  INVX1 U20 ( .A(n84), .Y(n70) );
  INVX1 U21 ( .A(n84), .Y(n71) );
  INVX1 U22 ( .A(n83), .Y(n72) );
  INVX1 U23 ( .A(n83), .Y(n73) );
  INVX1 U24 ( .A(n82), .Y(n74) );
  INVX1 U25 ( .A(n82), .Y(n75) );
  INVX1 U26 ( .A(n81), .Y(n76) );
  INVX1 U27 ( .A(n81), .Y(n77) );
  INVX1 U28 ( .A(n64), .Y(n50) );
  INVX1 U29 ( .A(n64), .Y(n51) );
  INVX1 U30 ( .A(n63), .Y(n52) );
  INVX1 U31 ( .A(n63), .Y(n53) );
  INVX1 U32 ( .A(n62), .Y(n54) );
  INVX1 U33 ( .A(n62), .Y(n55) );
  INVX1 U34 ( .A(n62), .Y(n56) );
  INVX1 U35 ( .A(n63), .Y(n57) );
  INVX1 U36 ( .A(n64), .Y(n58) );
  INVX1 U37 ( .A(n44), .Y(n30) );
  INVX1 U38 ( .A(n44), .Y(n31) );
  INVX1 U39 ( .A(n43), .Y(n32) );
  INVX1 U40 ( .A(n43), .Y(n33) );
  INVX1 U41 ( .A(n42), .Y(n34) );
  INVX1 U42 ( .A(n42), .Y(n35) );
  INVX1 U43 ( .A(n41), .Y(n36) );
  INVX1 U44 ( .A(n41), .Y(n37) );
  INVX1 U45 ( .A(n24), .Y(n10) );
  INVX1 U46 ( .A(n24), .Y(n11) );
  INVX1 U47 ( .A(n24), .Y(n12) );
  INVX1 U48 ( .A(n23), .Y(n13) );
  INVX1 U49 ( .A(n23), .Y(n14) );
  INVX1 U50 ( .A(n22), .Y(n15) );
  INVX1 U51 ( .A(n22), .Y(n16) );
  INVX1 U52 ( .A(n22), .Y(n17) );
  INVX1 U53 ( .A(n23), .Y(n18) );
  INVX1 U54 ( .A(n80), .Y(n78) );
  INVX1 U55 ( .A(n61), .Y(n59) );
  INVX1 U56 ( .A(n40), .Y(n38) );
  INVX1 U57 ( .A(n21), .Y(n19) );
  CLKINVX3 U58 ( .A(n116), .Y(n100) );
  CLKINVX3 U59 ( .A(n116), .Y(n101) );
  CLKINVX3 U60 ( .A(n115), .Y(n102) );
  CLKINVX3 U61 ( .A(n114), .Y(n103) );
  CLKINVX3 U62 ( .A(n117), .Y(n104) );
  CLKINVX3 U63 ( .A(n116), .Y(n105) );
  CLKINVX3 U64 ( .A(n117), .Y(n106) );
  CLKINVX3 U65 ( .A(n117), .Y(n107) );
  CLKINVX3 U66 ( .A(n115), .Y(n108) );
  CLKINVX3 U67 ( .A(n115), .Y(n109) );
  CLKINVX3 U68 ( .A(n114), .Y(n110) );
  CLKINVX3 U69 ( .A(n114), .Y(n111) );
  CLKINVX3 U70 ( .A(n90), .Y(n89) );
  CLKINVX3 U71 ( .A(n87), .Y(n86) );
  CLKINVX3 U72 ( .A(n93), .Y(n91) );
  CLKINVX3 U73 ( .A(n96), .Y(n95) );
  CLKINVX3 U74 ( .A(n99), .Y(n98) );
  CLKINVX3 U75 ( .A(n93), .Y(n92) );
  INVX1 U76 ( .A(n65), .Y(n80) );
  INVX1 U77 ( .A(n45), .Y(n61) );
  INVX1 U78 ( .A(n25), .Y(n40) );
  INVX1 U79 ( .A(n5), .Y(n21) );
  INVX1 U80 ( .A(n66), .Y(n84) );
  INVX1 U81 ( .A(n66), .Y(n83) );
  INVX1 U82 ( .A(n66), .Y(n82) );
  INVX1 U83 ( .A(n66), .Y(n81) );
  INVX1 U84 ( .A(n46), .Y(n64) );
  INVX1 U85 ( .A(n46), .Y(n63) );
  INVX1 U86 ( .A(n46), .Y(n62) );
  INVX1 U87 ( .A(n26), .Y(n44) );
  INVX1 U88 ( .A(n26), .Y(n43) );
  INVX1 U89 ( .A(n26), .Y(n42) );
  INVX1 U90 ( .A(n26), .Y(n41) );
  INVX1 U91 ( .A(n6), .Y(n24) );
  INVX1 U92 ( .A(n6), .Y(n23) );
  INVX1 U93 ( .A(n6), .Y(n22) );
  CLKINVX3 U94 ( .A(n87), .Y(n85) );
  CLKINVX3 U95 ( .A(n117), .Y(n112) );
  INVX1 U96 ( .A(n117), .Y(n113) );
  INVX1 U97 ( .A(n104), .Y(n116) );
  INVX1 U98 ( .A(n106), .Y(n115) );
  INVX1 U99 ( .A(n107), .Y(n114) );
  CLKINVX3 U100 ( .A(n90), .Y(n88) );
  INVX1 U101 ( .A(n140), .Y(n90) );
  CLKINVX3 U102 ( .A(n99), .Y(n97) );
  INVX1 U103 ( .A(n137), .Y(n99) );
  INVX1 U104 ( .A(n139), .Y(n93) );
  CLKINVX3 U105 ( .A(n96), .Y(n94) );
  INVX1 U106 ( .A(n138), .Y(n96) );
  INVX1 U107 ( .A(n141), .Y(n87) );
  INVX1 U108 ( .A(n1), .Y(n65) );
  INVX1 U109 ( .A(n2), .Y(n45) );
  INVX1 U110 ( .A(n3), .Y(n25) );
  INVX1 U111 ( .A(n4), .Y(n5) );
  INVX1 U112 ( .A(n1), .Y(n66) );
  INVX1 U113 ( .A(n2), .Y(n46) );
  INVX1 U114 ( .A(n3), .Y(n26) );
  INVX1 U115 ( .A(n4), .Y(n6) );
  AND3X2 U116 ( .A(n481), .B(n208), .C(REG_ENABLE[0]), .Y(n242) );
  INVX1 U117 ( .A(REG_ENABLE[1]), .Y(n481) );
  NOR2BX1 U118 ( .AN(n204), .B(n86), .Y(n139) );
  NOR2BX1 U119 ( .AN(n205), .B(n86), .Y(n138) );
  NOR2BX1 U120 ( .AN(n206), .B(n86), .Y(n137) );
  NOR2BX1 U121 ( .AN(n207), .B(n86), .Y(n140) );
  NAND3BX1 U122 ( .AN(REG_ENABLE[0]), .B(n208), .C(REG_ENABLE[1]), .Y(n141) );
  AND2X2 U123 ( .A(n242), .B(n204), .Y(n1) );
  AND2X2 U124 ( .A(n242), .B(n205), .Y(n2) );
  AND2X2 U125 ( .A(n242), .B(n206), .Y(n3) );
  AND2X2 U126 ( .A(n242), .B(n207), .Y(n4) );
  INVX1 U127 ( .A(reset), .Y(n117) );
  INVX1 U128 ( .A(n279), .Y(n414) );
  AOI22X1 U129 ( .A0(PWDATA[2]), .A1(n29), .B0(n31), .B1(DATA_IN[2]), .Y(n279)
         );
  INVX1 U130 ( .A(n276), .Y(n416) );
  AOI22X1 U131 ( .A0(PWDATA[0]), .A1(n29), .B0(n30), .B1(DATA_IN[0]), .Y(n276)
         );
  INVX1 U132 ( .A(n292), .Y(n401) );
  AOI22X1 U133 ( .A0(PWDATA[15]), .A1(n28), .B0(n35), .B1(DATA_IN[15]), .Y(
        n292) );
  INVX1 U134 ( .A(n281), .Y(n412) );
  AOI22X1 U135 ( .A0(PWDATA[4]), .A1(n29), .B0(n35), .B1(DATA_IN[4]), .Y(n281)
         );
  INVX1 U136 ( .A(n209), .Y(n480) );
  AOI22X1 U137 ( .A0(n69), .A1(PWDATA[0]), .B0(n70), .B1(CODEWORD_WIDTH[0]), 
        .Y(n209) );
  INVX1 U138 ( .A(n278), .Y(n415) );
  AOI22X1 U139 ( .A0(PWDATA[1]), .A1(n29), .B0(n30), .B1(DATA_IN[1]), .Y(n278)
         );
  INVX1 U140 ( .A(n243), .Y(n448) );
  AOI22X1 U141 ( .A0(PWDATA[0]), .A1(n49), .B0(n50), .B1(NOISE[0]), .Y(n243)
         );
  INVX1 U142 ( .A(n245), .Y(n447) );
  AOI22X1 U143 ( .A0(PWDATA[1]), .A1(n49), .B0(n50), .B1(NOISE[1]), .Y(n245)
         );
  INVX1 U144 ( .A(n246), .Y(n446) );
  AOI22X1 U145 ( .A0(PWDATA[2]), .A1(n49), .B0(n51), .B1(NOISE[2]), .Y(n246)
         );
  INVX1 U146 ( .A(n247), .Y(n445) );
  AOI22X1 U147 ( .A0(PWDATA[3]), .A1(n49), .B0(n51), .B1(NOISE[3]), .Y(n247)
         );
  INVX1 U148 ( .A(n248), .Y(n444) );
  AOI22X1 U149 ( .A0(PWDATA[4]), .A1(n49), .B0(n50), .B1(NOISE[4]), .Y(n248)
         );
  INVX1 U150 ( .A(n249), .Y(n443) );
  AOI22X1 U151 ( .A0(PWDATA[5]), .A1(n49), .B0(n51), .B1(NOISE[5]), .Y(n249)
         );
  INVX1 U152 ( .A(n250), .Y(n442) );
  AOI22X1 U153 ( .A0(PWDATA[6]), .A1(n49), .B0(n52), .B1(NOISE[6]), .Y(n250)
         );
  INVX1 U154 ( .A(n251), .Y(n441) );
  AOI22X1 U155 ( .A0(PWDATA[7]), .A1(n49), .B0(n52), .B1(NOISE[7]), .Y(n251)
         );
  INVX1 U156 ( .A(n212), .Y(n478) );
  AOI22X1 U157 ( .A0(n69), .A1(PWDATA[2]), .B0(n70), .B1(CODEWORD_WIDTH[2]), 
        .Y(n212) );
  INVX1 U158 ( .A(n213), .Y(n477) );
  AOI22X1 U159 ( .A0(n69), .A1(PWDATA[3]), .B0(n70), .B1(CODEWORD_WIDTH[3]), 
        .Y(n213) );
  INVX1 U160 ( .A(n214), .Y(n476) );
  AOI22X1 U161 ( .A0(n69), .A1(PWDATA[4]), .B0(n71), .B1(CODEWORD_WIDTH[4]), 
        .Y(n214) );
  INVX1 U162 ( .A(n215), .Y(n475) );
  AOI22X1 U163 ( .A0(n69), .A1(PWDATA[5]), .B0(n71), .B1(CODEWORD_WIDTH[5]), 
        .Y(n215) );
  INVX1 U164 ( .A(n216), .Y(n474) );
  AOI22X1 U165 ( .A0(n69), .A1(PWDATA[6]), .B0(n74), .B1(CODEWORD_WIDTH[6]), 
        .Y(n216) );
  INVX1 U166 ( .A(n217), .Y(n473) );
  AOI22X1 U167 ( .A0(n69), .A1(PWDATA[7]), .B0(n76), .B1(CODEWORD_WIDTH[7]), 
        .Y(n217) );
  INVX1 U168 ( .A(n218), .Y(n472) );
  AOI22X1 U169 ( .A0(n68), .A1(PWDATA[8]), .B0(n72), .B1(CODEWORD_WIDTH[8]), 
        .Y(n218) );
  INVX1 U170 ( .A(n219), .Y(n471) );
  AOI22X1 U171 ( .A0(n68), .A1(PWDATA[9]), .B0(n72), .B1(CODEWORD_WIDTH[9]), 
        .Y(n219) );
  INVX1 U172 ( .A(n220), .Y(n470) );
  AOI22X1 U173 ( .A0(n68), .A1(PWDATA[10]), .B0(n73), .B1(CODEWORD_WIDTH[10]), 
        .Y(n220) );
  INVX1 U174 ( .A(n221), .Y(n469) );
  AOI22X1 U175 ( .A0(n68), .A1(PWDATA[11]), .B0(n73), .B1(CODEWORD_WIDTH[11]), 
        .Y(n221) );
  INVX1 U176 ( .A(n222), .Y(n468) );
  AOI22X1 U177 ( .A0(n68), .A1(PWDATA[12]), .B0(n74), .B1(CODEWORD_WIDTH[12]), 
        .Y(n222) );
  INVX1 U178 ( .A(n223), .Y(n467) );
  AOI22X1 U179 ( .A0(n68), .A1(PWDATA[13]), .B0(n74), .B1(CODEWORD_WIDTH[13]), 
        .Y(n223) );
  INVX1 U180 ( .A(n224), .Y(n466) );
  AOI22X1 U181 ( .A0(n68), .A1(PWDATA[14]), .B0(n75), .B1(CODEWORD_WIDTH[14]), 
        .Y(n224) );
  INVX1 U182 ( .A(n225), .Y(n465) );
  AOI22X1 U183 ( .A0(n68), .A1(PWDATA[15]), .B0(n75), .B1(CODEWORD_WIDTH[15]), 
        .Y(n225) );
  INVX1 U184 ( .A(n226), .Y(n464) );
  AOI22X1 U185 ( .A0(n68), .A1(PWDATA[16]), .B0(n75), .B1(CODEWORD_WIDTH[16]), 
        .Y(n226) );
  INVX1 U186 ( .A(n227), .Y(n463) );
  AOI22X1 U187 ( .A0(n68), .A1(PWDATA[17]), .B0(n75), .B1(CODEWORD_WIDTH[17]), 
        .Y(n227) );
  INVX1 U188 ( .A(n228), .Y(n462) );
  AOI22X1 U189 ( .A0(n68), .A1(PWDATA[18]), .B0(n76), .B1(CODEWORD_WIDTH[18]), 
        .Y(n228) );
  INVX1 U190 ( .A(n229), .Y(n461) );
  AOI22X1 U191 ( .A0(n68), .A1(PWDATA[19]), .B0(n76), .B1(CODEWORD_WIDTH[19]), 
        .Y(n229) );
  INVX1 U192 ( .A(n230), .Y(n460) );
  AOI22X1 U193 ( .A0(n67), .A1(PWDATA[20]), .B0(n77), .B1(CODEWORD_WIDTH[20]), 
        .Y(n230) );
  INVX1 U194 ( .A(n231), .Y(n459) );
  AOI22X1 U195 ( .A0(n67), .A1(PWDATA[21]), .B0(n77), .B1(CODEWORD_WIDTH[21]), 
        .Y(n231) );
  INVX1 U196 ( .A(n232), .Y(n458) );
  AOI22X1 U197 ( .A0(n67), .A1(PWDATA[22]), .B0(n76), .B1(CODEWORD_WIDTH[22]), 
        .Y(n232) );
  INVX1 U198 ( .A(n233), .Y(n457) );
  AOI22X1 U199 ( .A0(n67), .A1(PWDATA[23]), .B0(n77), .B1(CODEWORD_WIDTH[23]), 
        .Y(n233) );
  INVX1 U200 ( .A(n234), .Y(n456) );
  AOI22X1 U201 ( .A0(n67), .A1(PWDATA[24]), .B0(n73), .B1(CODEWORD_WIDTH[24]), 
        .Y(n234) );
  INVX1 U202 ( .A(n235), .Y(n455) );
  AOI22X1 U203 ( .A0(n67), .A1(PWDATA[25]), .B0(n74), .B1(CODEWORD_WIDTH[25]), 
        .Y(n235) );
  INVX1 U204 ( .A(n236), .Y(n454) );
  AOI22X1 U205 ( .A0(n67), .A1(PWDATA[26]), .B0(n79), .B1(CODEWORD_WIDTH[26]), 
        .Y(n236) );
  INVX1 U206 ( .A(n237), .Y(n453) );
  AOI22X1 U207 ( .A0(n67), .A1(PWDATA[27]), .B0(n66), .B1(CODEWORD_WIDTH[27]), 
        .Y(n237) );
  INVX1 U208 ( .A(n238), .Y(n452) );
  AOI22X1 U209 ( .A0(n67), .A1(PWDATA[28]), .B0(n65), .B1(CODEWORD_WIDTH[28]), 
        .Y(n238) );
  INVX1 U210 ( .A(n239), .Y(n451) );
  AOI22X1 U211 ( .A0(n67), .A1(PWDATA[29]), .B0(n79), .B1(CODEWORD_WIDTH[29]), 
        .Y(n239) );
  INVX1 U212 ( .A(n240), .Y(n450) );
  AOI22X1 U213 ( .A0(n67), .A1(PWDATA[30]), .B0(n72), .B1(CODEWORD_WIDTH[30]), 
        .Y(n240) );
  INVX1 U214 ( .A(n241), .Y(n449) );
  AOI22X1 U215 ( .A0(n67), .A1(PWDATA[31]), .B0(n79), .B1(CODEWORD_WIDTH[31]), 
        .Y(n241) );
  NAND2X1 U216 ( .A(n142), .B(n143), .Y(n343) );
  AOI22X1 U217 ( .A0(CTRL[1]), .A1(n88), .B0(PRDATA[1]), .B1(n86), .Y(n142) );
  AOI222X1 U218 ( .A0(DATA_IN[1]), .A1(n98), .B0(NOISE[1]), .B1(n94), .C0(
        CODEWORD_WIDTH[1]), .C1(n92), .Y(n143) );
  NAND2X1 U219 ( .A(n135), .B(n136), .Y(n342) );
  AOI22X1 U220 ( .A0(CTRL[0]), .A1(n89), .B0(PRDATA[0]), .B1(n85), .Y(n135) );
  NAND2X1 U221 ( .A(n144), .B(n145), .Y(n344) );
  AOI22X1 U222 ( .A0(CTRL[2]), .A1(n89), .B0(PRDATA[2]), .B1(n86), .Y(n144) );
  AOI222X1 U223 ( .A0(DATA_IN[2]), .A1(n98), .B0(NOISE[2]), .B1(n95), .C0(
        CODEWORD_WIDTH[2]), .C1(n92), .Y(n145) );
  NAND2X1 U224 ( .A(n186), .B(n187), .Y(n365) );
  AOI22X1 U225 ( .A0(CTRL[23]), .A1(n88), .B0(PRDATA[23]), .B1(n85), .Y(n186)
         );
  AOI222X1 U226 ( .A0(DATA_IN[23]), .A1(n97), .B0(NOISE[23]), .B1(n94), .C0(
        CODEWORD_WIDTH[23]), .C1(n92), .Y(n187) );
  NAND2X1 U227 ( .A(n156), .B(n157), .Y(n350) );
  AOI22X1 U228 ( .A0(CTRL[8]), .A1(n89), .B0(PRDATA[8]), .B1(n85), .Y(n156) );
  AOI222X1 U229 ( .A0(DATA_IN[8]), .A1(n98), .B0(NOISE[8]), .B1(n95), .C0(
        CODEWORD_WIDTH[8]), .C1(n91), .Y(n157) );
  NAND2X1 U230 ( .A(n152), .B(n153), .Y(n348) );
  AOI22X1 U231 ( .A0(CTRL[6]), .A1(n89), .B0(PRDATA[6]), .B1(n141), .Y(n152)
         );
  AOI222X1 U232 ( .A0(DATA_IN[6]), .A1(n98), .B0(NOISE[6]), .B1(n95), .C0(
        CODEWORD_WIDTH[6]), .C1(n92), .Y(n153) );
  NAND2X1 U233 ( .A(n164), .B(n165), .Y(n354) );
  AOI22X1 U234 ( .A0(CTRL[12]), .A1(n89), .B0(PRDATA[12]), .B1(n85), .Y(n164)
         );
  AOI222X1 U235 ( .A0(DATA_IN[12]), .A1(n98), .B0(NOISE[12]), .B1(n95), .C0(
        CODEWORD_WIDTH[12]), .C1(n91), .Y(n165) );
  NAND2X1 U236 ( .A(n170), .B(n171), .Y(n357) );
  AOI22X1 U237 ( .A0(CTRL[15]), .A1(n89), .B0(PRDATA[15]), .B1(n85), .Y(n170)
         );
  AOI222X1 U238 ( .A0(DATA_IN[15]), .A1(n98), .B0(NOISE[15]), .B1(n95), .C0(
        CODEWORD_WIDTH[15]), .C1(n91), .Y(n171) );
  NAND2X1 U239 ( .A(n176), .B(n177), .Y(n360) );
  AOI22X1 U240 ( .A0(CTRL[18]), .A1(n89), .B0(PRDATA[18]), .B1(n85), .Y(n176)
         );
  AOI222X1 U241 ( .A0(DATA_IN[18]), .A1(n98), .B0(NOISE[18]), .B1(n95), .C0(
        CODEWORD_WIDTH[18]), .C1(n91), .Y(n177) );
  NAND2X1 U242 ( .A(n182), .B(n183), .Y(n363) );
  AOI22X1 U243 ( .A0(CTRL[21]), .A1(n88), .B0(PRDATA[21]), .B1(n85), .Y(n182)
         );
  AOI222X1 U244 ( .A0(DATA_IN[21]), .A1(n97), .B0(NOISE[21]), .B1(n94), .C0(
        CODEWORD_WIDTH[21]), .C1(n92), .Y(n183) );
  NAND2X1 U245 ( .A(n184), .B(n185), .Y(n364) );
  AOI22X1 U246 ( .A0(CTRL[22]), .A1(n88), .B0(PRDATA[22]), .B1(n85), .Y(n184)
         );
  AOI222X1 U247 ( .A0(DATA_IN[22]), .A1(n97), .B0(NOISE[22]), .B1(n94), .C0(
        CODEWORD_WIDTH[22]), .C1(n92), .Y(n185) );
  NAND2X1 U248 ( .A(n168), .B(n169), .Y(n356) );
  AOI22X1 U249 ( .A0(CTRL[14]), .A1(n89), .B0(PRDATA[14]), .B1(n85), .Y(n168)
         );
  AOI222X1 U250 ( .A0(DATA_IN[14]), .A1(n97), .B0(NOISE[14]), .B1(n95), .C0(
        CODEWORD_WIDTH[14]), .C1(n91), .Y(n169) );
  NAND2X1 U251 ( .A(n174), .B(n175), .Y(n359) );
  AOI22X1 U252 ( .A0(CTRL[17]), .A1(n89), .B0(PRDATA[17]), .B1(n85), .Y(n174)
         );
  AOI222X1 U253 ( .A0(DATA_IN[17]), .A1(n98), .B0(NOISE[17]), .B1(n95), .C0(
        CODEWORD_WIDTH[17]), .C1(n91), .Y(n175) );
  NAND2X1 U254 ( .A(n178), .B(n179), .Y(n361) );
  AOI22X1 U255 ( .A0(CTRL[19]), .A1(n89), .B0(PRDATA[19]), .B1(n85), .Y(n178)
         );
  AOI222X1 U256 ( .A0(DATA_IN[19]), .A1(n97), .B0(NOISE[19]), .B1(n95), .C0(
        CODEWORD_WIDTH[19]), .C1(n91), .Y(n179) );
  NAND2X1 U257 ( .A(n188), .B(n189), .Y(n366) );
  AOI22X1 U258 ( .A0(CTRL[24]), .A1(n88), .B0(PRDATA[24]), .B1(n86), .Y(n188)
         );
  AOI222X1 U259 ( .A0(DATA_IN[24]), .A1(n97), .B0(NOISE[24]), .B1(n94), .C0(
        CODEWORD_WIDTH[24]), .C1(n91), .Y(n189) );
  NAND2X1 U260 ( .A(n190), .B(n191), .Y(n367) );
  AOI22X1 U261 ( .A0(CTRL[25]), .A1(n88), .B0(PRDATA[25]), .B1(n86), .Y(n190)
         );
  AOI222X1 U262 ( .A0(DATA_IN[25]), .A1(n97), .B0(NOISE[25]), .B1(n94), .C0(
        CODEWORD_WIDTH[25]), .C1(n92), .Y(n191) );
  NAND2X1 U263 ( .A(n146), .B(n147), .Y(n345) );
  AOI22X1 U264 ( .A0(CTRL[3]), .A1(n88), .B0(PRDATA[3]), .B1(n141), .Y(n146)
         );
  AOI222X1 U265 ( .A0(DATA_IN[3]), .A1(n98), .B0(NOISE[3]), .B1(n94), .C0(
        CODEWORD_WIDTH[3]), .C1(n92), .Y(n147) );
  NAND2X1 U266 ( .A(n148), .B(n149), .Y(n346) );
  AOI22X1 U267 ( .A0(CTRL[4]), .A1(n140), .B0(PRDATA[4]), .B1(n141), .Y(n148)
         );
  AOI222X1 U268 ( .A0(DATA_IN[4]), .A1(n98), .B0(NOISE[4]), .B1(n138), .C0(
        CODEWORD_WIDTH[4]), .C1(n92), .Y(n149) );
  NAND2X1 U269 ( .A(n150), .B(n151), .Y(n347) );
  AOI22X1 U270 ( .A0(CTRL[5]), .A1(n140), .B0(PRDATA[5]), .B1(n141), .Y(n150)
         );
  AOI222X1 U271 ( .A0(DATA_IN[5]), .A1(n98), .B0(NOISE[5]), .B1(n138), .C0(
        CODEWORD_WIDTH[5]), .C1(n92), .Y(n151) );
  NAND2X1 U272 ( .A(n154), .B(n155), .Y(n349) );
  AOI22X1 U273 ( .A0(CTRL[7]), .A1(n88), .B0(PRDATA[7]), .B1(n86), .Y(n154) );
  AOI222X1 U274 ( .A0(DATA_IN[7]), .A1(n98), .B0(NOISE[7]), .B1(n94), .C0(
        CODEWORD_WIDTH[7]), .C1(n92), .Y(n155) );
  NAND2X1 U275 ( .A(n158), .B(n159), .Y(n351) );
  AOI22X1 U276 ( .A0(CTRL[9]), .A1(n89), .B0(PRDATA[9]), .B1(n85), .Y(n158) );
  AOI222X1 U277 ( .A0(DATA_IN[9]), .A1(n98), .B0(NOISE[9]), .B1(n95), .C0(
        CODEWORD_WIDTH[9]), .C1(n91), .Y(n159) );
  NAND2X1 U278 ( .A(n162), .B(n163), .Y(n353) );
  AOI22X1 U279 ( .A0(CTRL[11]), .A1(n89), .B0(PRDATA[11]), .B1(n85), .Y(n162)
         );
  AOI222X1 U280 ( .A0(DATA_IN[11]), .A1(n97), .B0(NOISE[11]), .B1(n95), .C0(
        CODEWORD_WIDTH[11]), .C1(n91), .Y(n163) );
  NAND2X1 U281 ( .A(n166), .B(n167), .Y(n355) );
  AOI22X1 U282 ( .A0(CTRL[13]), .A1(n89), .B0(PRDATA[13]), .B1(n85), .Y(n166)
         );
  AOI222X1 U283 ( .A0(DATA_IN[13]), .A1(n98), .B0(NOISE[13]), .B1(n95), .C0(
        CODEWORD_WIDTH[13]), .C1(n91), .Y(n167) );
  NAND2X1 U284 ( .A(n172), .B(n173), .Y(n358) );
  AOI22X1 U285 ( .A0(CTRL[16]), .A1(n89), .B0(PRDATA[16]), .B1(n85), .Y(n172)
         );
  AOI222X1 U286 ( .A0(DATA_IN[16]), .A1(n137), .B0(NOISE[16]), .B1(n95), .C0(
        CODEWORD_WIDTH[16]), .C1(n91), .Y(n173) );
  NAND2X1 U287 ( .A(n160), .B(n161), .Y(n352) );
  AOI22X1 U288 ( .A0(CTRL[10]), .A1(n89), .B0(PRDATA[10]), .B1(n85), .Y(n160)
         );
  AOI222X1 U289 ( .A0(DATA_IN[10]), .A1(n137), .B0(NOISE[10]), .B1(n95), .C0(
        CODEWORD_WIDTH[10]), .C1(n91), .Y(n161) );
  NAND2X1 U290 ( .A(n180), .B(n181), .Y(n362) );
  AOI22X1 U291 ( .A0(CTRL[20]), .A1(n88), .B0(PRDATA[20]), .B1(n85), .Y(n180)
         );
  AOI222X1 U292 ( .A0(DATA_IN[20]), .A1(n97), .B0(NOISE[20]), .B1(n94), .C0(
        CODEWORD_WIDTH[20]), .C1(n92), .Y(n181) );
  NAND2X1 U293 ( .A(n192), .B(n193), .Y(n368) );
  AOI22X1 U294 ( .A0(CTRL[26]), .A1(n88), .B0(PRDATA[26]), .B1(n86), .Y(n192)
         );
  AOI222X1 U295 ( .A0(DATA_IN[26]), .A1(n97), .B0(NOISE[26]), .B1(n94), .C0(
        CODEWORD_WIDTH[26]), .C1(n91), .Y(n193) );
  NAND2X1 U296 ( .A(n194), .B(n195), .Y(n369) );
  AOI22X1 U297 ( .A0(CTRL[27]), .A1(n88), .B0(PRDATA[27]), .B1(n86), .Y(n194)
         );
  AOI222X1 U298 ( .A0(DATA_IN[27]), .A1(n97), .B0(NOISE[27]), .B1(n94), .C0(
        CODEWORD_WIDTH[27]), .C1(n92), .Y(n195) );
  NAND2X1 U299 ( .A(n196), .B(n197), .Y(n370) );
  AOI22X1 U300 ( .A0(CTRL[28]), .A1(n88), .B0(PRDATA[28]), .B1(n86), .Y(n196)
         );
  AOI222X1 U301 ( .A0(DATA_IN[28]), .A1(n97), .B0(NOISE[28]), .B1(n94), .C0(
        CODEWORD_WIDTH[28]), .C1(n91), .Y(n197) );
  NAND2X1 U302 ( .A(n198), .B(n199), .Y(n371) );
  AOI22X1 U303 ( .A0(CTRL[29]), .A1(n88), .B0(PRDATA[29]), .B1(n86), .Y(n198)
         );
  AOI222X1 U304 ( .A0(DATA_IN[29]), .A1(n97), .B0(NOISE[29]), .B1(n94), .C0(
        CODEWORD_WIDTH[29]), .C1(n92), .Y(n199) );
  NAND2X1 U305 ( .A(n200), .B(n201), .Y(n372) );
  AOI22X1 U306 ( .A0(CTRL[30]), .A1(n88), .B0(PRDATA[30]), .B1(n86), .Y(n200)
         );
  AOI222X1 U307 ( .A0(DATA_IN[30]), .A1(n97), .B0(NOISE[30]), .B1(n94), .C0(
        CODEWORD_WIDTH[30]), .C1(n139), .Y(n201) );
  NAND2X1 U308 ( .A(n202), .B(n203), .Y(n373) );
  AOI22X1 U309 ( .A0(CTRL[31]), .A1(n88), .B0(PRDATA[31]), .B1(n86), .Y(n202)
         );
  AOI222X1 U310 ( .A0(DATA_IN[31]), .A1(n97), .B0(NOISE[31]), .B1(n94), .C0(
        CODEWORD_WIDTH[31]), .C1(n139), .Y(n203) );
  INVX1 U311 ( .A(n300), .Y(n393) );
  AOI22X1 U312 ( .A0(PWDATA[23]), .A1(n27), .B0(n37), .B1(DATA_IN[23]), .Y(
        n300) );
  INVX1 U313 ( .A(n285), .Y(n408) );
  AOI22X1 U314 ( .A0(PWDATA[8]), .A1(n28), .B0(n33), .B1(DATA_IN[8]), .Y(n285)
         );
  INVX1 U315 ( .A(n289), .Y(n404) );
  AOI22X1 U316 ( .A0(PWDATA[12]), .A1(n28), .B0(n34), .B1(DATA_IN[12]), .Y(
        n289) );
  INVX1 U317 ( .A(n295), .Y(n398) );
  AOI22X1 U318 ( .A0(PWDATA[18]), .A1(n28), .B0(n36), .B1(DATA_IN[18]), .Y(
        n295) );
  INVX1 U319 ( .A(n298), .Y(n395) );
  AOI22X1 U320 ( .A0(PWDATA[21]), .A1(n27), .B0(n36), .B1(DATA_IN[21]), .Y(
        n298) );
  INVX1 U321 ( .A(n299), .Y(n394) );
  AOI22X1 U322 ( .A0(PWDATA[22]), .A1(n27), .B0(n37), .B1(DATA_IN[22]), .Y(
        n299) );
  INVX1 U323 ( .A(n283), .Y(n410) );
  AOI22X1 U324 ( .A0(PWDATA[6]), .A1(n29), .B0(n32), .B1(DATA_IN[6]), .Y(n283)
         );
  INVX1 U325 ( .A(n296), .Y(n397) );
  AOI22X1 U326 ( .A0(PWDATA[19]), .A1(n28), .B0(n36), .B1(DATA_IN[19]), .Y(
        n296) );
  INVX1 U327 ( .A(n302), .Y(n391) );
  AOI22X1 U328 ( .A0(PWDATA[25]), .A1(n27), .B0(n25), .B1(DATA_IN[25]), .Y(
        n302) );
  INVX1 U329 ( .A(n291), .Y(n402) );
  AOI22X1 U330 ( .A0(PWDATA[14]), .A1(n28), .B0(n35), .B1(DATA_IN[14]), .Y(
        n291) );
  INVX1 U331 ( .A(n294), .Y(n399) );
  AOI22X1 U332 ( .A0(PWDATA[17]), .A1(n28), .B0(n35), .B1(DATA_IN[17]), .Y(
        n294) );
  INVX1 U333 ( .A(n301), .Y(n392) );
  AOI22X1 U334 ( .A0(PWDATA[24]), .A1(n27), .B0(n39), .B1(DATA_IN[24]), .Y(
        n301) );
  INVX1 U335 ( .A(n311), .Y(n383) );
  AOI22X1 U336 ( .A0(PWDATA[1]), .A1(n7), .B0(n10), .B1(CTRL[1]), .Y(n311) );
  INVX1 U337 ( .A(n280), .Y(n413) );
  AOI22X1 U338 ( .A0(PWDATA[3]), .A1(n29), .B0(n31), .B1(DATA_IN[3]), .Y(n280)
         );
  INVX1 U339 ( .A(n282), .Y(n411) );
  AOI22X1 U340 ( .A0(PWDATA[5]), .A1(n29), .B0(n32), .B1(DATA_IN[5]), .Y(n282)
         );
  INVX1 U341 ( .A(n284), .Y(n409) );
  AOI22X1 U342 ( .A0(PWDATA[7]), .A1(n29), .B0(n32), .B1(DATA_IN[7]), .Y(n284)
         );
  INVX1 U343 ( .A(n286), .Y(n407) );
  AOI22X1 U344 ( .A0(PWDATA[9]), .A1(n28), .B0(n33), .B1(DATA_IN[9]), .Y(n286)
         );
  INVX1 U345 ( .A(n211), .Y(n479) );
  AOI22X1 U346 ( .A0(n69), .A1(PWDATA[1]), .B0(n71), .B1(CODEWORD_WIDTH[1]), 
        .Y(n211) );
  INVX1 U347 ( .A(n288), .Y(n405) );
  AOI22X1 U348 ( .A0(PWDATA[11]), .A1(n28), .B0(n32), .B1(DATA_IN[11]), .Y(
        n288) );
  INVX1 U349 ( .A(n290), .Y(n403) );
  AOI22X1 U350 ( .A0(PWDATA[13]), .A1(n28), .B0(n34), .B1(DATA_IN[13]), .Y(
        n290) );
  INVX1 U351 ( .A(n293), .Y(n400) );
  AOI22X1 U352 ( .A0(PWDATA[16]), .A1(n28), .B0(n34), .B1(DATA_IN[16]), .Y(
        n293) );
  INVX1 U353 ( .A(n309), .Y(n384) );
  AOI22X1 U354 ( .A0(PWDATA[0]), .A1(n7), .B0(n10), .B1(CTRL[0]), .Y(n309) );
  INVX1 U355 ( .A(n287), .Y(n406) );
  AOI22X1 U356 ( .A0(PWDATA[10]), .A1(n28), .B0(n33), .B1(DATA_IN[10]), .Y(
        n287) );
  INVX1 U357 ( .A(n297), .Y(n396) );
  AOI22X1 U358 ( .A0(PWDATA[20]), .A1(n27), .B0(n36), .B1(DATA_IN[20]), .Y(
        n297) );
  INVX1 U359 ( .A(n252), .Y(n440) );
  AOI22X1 U360 ( .A0(PWDATA[8]), .A1(n48), .B0(n53), .B1(NOISE[8]), .Y(n252)
         );
  INVX1 U361 ( .A(n253), .Y(n439) );
  AOI22X1 U362 ( .A0(PWDATA[9]), .A1(n48), .B0(n53), .B1(NOISE[9]), .Y(n253)
         );
  INVX1 U363 ( .A(n254), .Y(n438) );
  AOI22X1 U364 ( .A0(PWDATA[10]), .A1(n48), .B0(n52), .B1(NOISE[10]), .Y(n254)
         );
  INVX1 U365 ( .A(n255), .Y(n437) );
  AOI22X1 U366 ( .A0(PWDATA[11]), .A1(n48), .B0(n53), .B1(NOISE[11]), .Y(n255)
         );
  INVX1 U367 ( .A(n256), .Y(n436) );
  AOI22X1 U368 ( .A0(PWDATA[12]), .A1(n48), .B0(n54), .B1(NOISE[12]), .Y(n256)
         );
  INVX1 U369 ( .A(n257), .Y(n435) );
  AOI22X1 U370 ( .A0(PWDATA[13]), .A1(n48), .B0(n54), .B1(NOISE[13]), .Y(n257)
         );
  INVX1 U371 ( .A(n258), .Y(n434) );
  AOI22X1 U372 ( .A0(PWDATA[14]), .A1(n48), .B0(n55), .B1(NOISE[14]), .Y(n258)
         );
  INVX1 U373 ( .A(n259), .Y(n433) );
  AOI22X1 U374 ( .A0(PWDATA[15]), .A1(n48), .B0(n55), .B1(NOISE[15]), .Y(n259)
         );
  INVX1 U375 ( .A(n260), .Y(n432) );
  AOI22X1 U376 ( .A0(PWDATA[16]), .A1(n48), .B0(n56), .B1(NOISE[16]), .Y(n260)
         );
  INVX1 U377 ( .A(n261), .Y(n431) );
  AOI22X1 U378 ( .A0(PWDATA[17]), .A1(n48), .B0(n56), .B1(NOISE[17]), .Y(n261)
         );
  INVX1 U379 ( .A(n262), .Y(n430) );
  AOI22X1 U380 ( .A0(PWDATA[18]), .A1(n48), .B0(n57), .B1(NOISE[18]), .Y(n262)
         );
  INVX1 U381 ( .A(n263), .Y(n429) );
  AOI22X1 U382 ( .A0(PWDATA[19]), .A1(n48), .B0(n57), .B1(NOISE[19]), .Y(n263)
         );
  INVX1 U383 ( .A(n264), .Y(n428) );
  AOI22X1 U384 ( .A0(PWDATA[20]), .A1(n47), .B0(n58), .B1(NOISE[20]), .Y(n264)
         );
  INVX1 U385 ( .A(n265), .Y(n427) );
  AOI22X1 U386 ( .A0(PWDATA[21]), .A1(n47), .B0(n58), .B1(NOISE[21]), .Y(n265)
         );
  INVX1 U387 ( .A(n266), .Y(n426) );
  AOI22X1 U388 ( .A0(PWDATA[22]), .A1(n47), .B0(n57), .B1(NOISE[22]), .Y(n266)
         );
  INVX1 U389 ( .A(n267), .Y(n425) );
  AOI22X1 U390 ( .A0(PWDATA[23]), .A1(n47), .B0(n58), .B1(NOISE[23]), .Y(n267)
         );
  INVX1 U391 ( .A(n268), .Y(n424) );
  AOI22X1 U392 ( .A0(PWDATA[24]), .A1(n47), .B0(n55), .B1(NOISE[24]), .Y(n268)
         );
  INVX1 U393 ( .A(n269), .Y(n423) );
  AOI22X1 U394 ( .A0(PWDATA[25]), .A1(n47), .B0(n56), .B1(NOISE[25]), .Y(n269)
         );
  INVX1 U395 ( .A(n270), .Y(n422) );
  AOI22X1 U396 ( .A0(PWDATA[26]), .A1(n47), .B0(n60), .B1(NOISE[26]), .Y(n270)
         );
  INVX1 U397 ( .A(n271), .Y(n421) );
  AOI22X1 U398 ( .A0(PWDATA[27]), .A1(n47), .B0(n46), .B1(NOISE[27]), .Y(n271)
         );
  INVX1 U399 ( .A(n272), .Y(n420) );
  AOI22X1 U400 ( .A0(PWDATA[28]), .A1(n47), .B0(n45), .B1(NOISE[28]), .Y(n272)
         );
  INVX1 U401 ( .A(n273), .Y(n419) );
  AOI22X1 U402 ( .A0(PWDATA[29]), .A1(n47), .B0(n60), .B1(NOISE[29]), .Y(n273)
         );
  INVX1 U403 ( .A(n274), .Y(n418) );
  AOI22X1 U404 ( .A0(PWDATA[30]), .A1(n47), .B0(n54), .B1(NOISE[30]), .Y(n274)
         );
  INVX1 U405 ( .A(n275), .Y(n417) );
  AOI22X1 U406 ( .A0(PWDATA[31]), .A1(n47), .B0(n60), .B1(NOISE[31]), .Y(n275)
         );
  INVX1 U407 ( .A(n303), .Y(n390) );
  AOI22X1 U408 ( .A0(PWDATA[26]), .A1(n27), .B0(n37), .B1(DATA_IN[26]), .Y(
        n303) );
  INVX1 U409 ( .A(n304), .Y(n389) );
  AOI22X1 U410 ( .A0(PWDATA[27]), .A1(n27), .B0(n30), .B1(DATA_IN[27]), .Y(
        n304) );
  INVX1 U411 ( .A(n305), .Y(n388) );
  AOI22X1 U412 ( .A0(PWDATA[28]), .A1(n27), .B0(n39), .B1(DATA_IN[28]), .Y(
        n305) );
  INVX1 U413 ( .A(n306), .Y(n387) );
  AOI22X1 U414 ( .A0(PWDATA[29]), .A1(n27), .B0(n26), .B1(DATA_IN[29]), .Y(
        n306) );
  INVX1 U415 ( .A(n307), .Y(n386) );
  AOI22X1 U416 ( .A0(PWDATA[30]), .A1(n27), .B0(n31), .B1(DATA_IN[30]), .Y(
        n307) );
  INVX1 U417 ( .A(n308), .Y(n385) );
  AOI22X1 U418 ( .A0(PWDATA[31]), .A1(n27), .B0(n39), .B1(DATA_IN[31]), .Y(
        n308) );
  INVX1 U419 ( .A(n312), .Y(n382) );
  AOI22X1 U420 ( .A0(PWDATA[2]), .A1(n7), .B0(n11), .B1(CTRL[2]), .Y(n312) );
  INVX1 U421 ( .A(n313), .Y(n381) );
  AOI22X1 U422 ( .A0(PWDATA[3]), .A1(n7), .B0(n11), .B1(CTRL[3]), .Y(n313) );
  INVX1 U423 ( .A(n314), .Y(n380) );
  AOI22X1 U424 ( .A0(PWDATA[4]), .A1(n7), .B0(n12), .B1(CTRL[4]), .Y(n314) );
  INVX1 U425 ( .A(n315), .Y(n379) );
  AOI22X1 U426 ( .A0(PWDATA[5]), .A1(n7), .B0(n12), .B1(CTRL[5]), .Y(n315) );
  INVX1 U427 ( .A(n316), .Y(n378) );
  AOI22X1 U428 ( .A0(PWDATA[6]), .A1(n7), .B0(n13), .B1(CTRL[6]), .Y(n316) );
  INVX1 U429 ( .A(n317), .Y(n377) );
  AOI22X1 U430 ( .A0(PWDATA[7]), .A1(n7), .B0(n13), .B1(CTRL[7]), .Y(n317) );
  INVX1 U431 ( .A(n318), .Y(n376) );
  AOI22X1 U432 ( .A0(PWDATA[8]), .A1(n7), .B0(n14), .B1(CTRL[8]), .Y(n318) );
  INVX1 U433 ( .A(n319), .Y(n375) );
  AOI22X1 U434 ( .A0(PWDATA[9]), .A1(n7), .B0(n14), .B1(CTRL[9]), .Y(n319) );
  INVX1 U435 ( .A(n320), .Y(n374) );
  AOI22X1 U436 ( .A0(PWDATA[10]), .A1(n7), .B0(n13), .B1(CTRL[10]), .Y(n320)
         );
  INVX1 U437 ( .A(n321), .Y(n310) );
  AOI22X1 U438 ( .A0(PWDATA[11]), .A1(n7), .B0(n14), .B1(CTRL[11]), .Y(n321)
         );
  INVX1 U439 ( .A(n322), .Y(n277) );
  AOI22X1 U440 ( .A0(PWDATA[12]), .A1(n8), .B0(n15), .B1(CTRL[12]), .Y(n322)
         );
  INVX1 U441 ( .A(n323), .Y(n244) );
  AOI22X1 U442 ( .A0(PWDATA[13]), .A1(n8), .B0(n15), .B1(CTRL[13]), .Y(n323)
         );
  INVX1 U443 ( .A(n324), .Y(n210) );
  AOI22X1 U444 ( .A0(PWDATA[14]), .A1(n8), .B0(n16), .B1(CTRL[14]), .Y(n324)
         );
  INVX1 U445 ( .A(n325), .Y(n134) );
  AOI22X1 U446 ( .A0(PWDATA[15]), .A1(n8), .B0(n16), .B1(CTRL[15]), .Y(n325)
         );
  INVX1 U447 ( .A(n326), .Y(n133) );
  AOI22X1 U448 ( .A0(PWDATA[16]), .A1(n8), .B0(n11), .B1(CTRL[16]), .Y(n326)
         );
  INVX1 U449 ( .A(n327), .Y(n132) );
  AOI22X1 U450 ( .A0(PWDATA[17]), .A1(n8), .B0(n12), .B1(CTRL[17]), .Y(n327)
         );
  INVX1 U451 ( .A(n328), .Y(n131) );
  AOI22X1 U452 ( .A0(PWDATA[18]), .A1(n8), .B0(n17), .B1(CTRL[18]), .Y(n328)
         );
  INVX1 U453 ( .A(n329), .Y(n130) );
  AOI22X1 U454 ( .A0(PWDATA[19]), .A1(n8), .B0(n17), .B1(CTRL[19]), .Y(n329)
         );
  INVX1 U455 ( .A(n330), .Y(n129) );
  AOI22X1 U456 ( .A0(PWDATA[20]), .A1(n8), .B0(n18), .B1(CTRL[20]), .Y(n330)
         );
  INVX1 U457 ( .A(n331), .Y(n128) );
  AOI22X1 U458 ( .A0(PWDATA[21]), .A1(n8), .B0(n18), .B1(CTRL[21]), .Y(n331)
         );
  INVX1 U459 ( .A(n332), .Y(n127) );
  AOI22X1 U460 ( .A0(PWDATA[22]), .A1(n8), .B0(n17), .B1(CTRL[22]), .Y(n332)
         );
  INVX1 U461 ( .A(n333), .Y(n126) );
  AOI22X1 U462 ( .A0(PWDATA[23]), .A1(n8), .B0(n18), .B1(CTRL[23]), .Y(n333)
         );
  INVX1 U463 ( .A(n334), .Y(n125) );
  AOI22X1 U464 ( .A0(PWDATA[24]), .A1(n9), .B0(n15), .B1(CTRL[24]), .Y(n334)
         );
  INVX1 U465 ( .A(n335), .Y(n124) );
  AOI22X1 U466 ( .A0(PWDATA[25]), .A1(n9), .B0(n16), .B1(CTRL[25]), .Y(n335)
         );
  INVX1 U467 ( .A(n336), .Y(n123) );
  AOI22X1 U468 ( .A0(PWDATA[26]), .A1(n9), .B0(n20), .B1(CTRL[26]), .Y(n336)
         );
  INVX1 U469 ( .A(n337), .Y(n122) );
  AOI22X1 U470 ( .A0(PWDATA[27]), .A1(n9), .B0(n6), .B1(CTRL[27]), .Y(n337) );
  INVX1 U471 ( .A(n338), .Y(n121) );
  AOI22X1 U472 ( .A0(PWDATA[28]), .A1(n9), .B0(n5), .B1(CTRL[28]), .Y(n338) );
  INVX1 U473 ( .A(n339), .Y(n120) );
  AOI22X1 U474 ( .A0(PWDATA[29]), .A1(n9), .B0(n20), .B1(CTRL[29]), .Y(n339)
         );
  INVX1 U475 ( .A(n340), .Y(n119) );
  AOI22X1 U476 ( .A0(PWDATA[30]), .A1(n9), .B0(n10), .B1(CTRL[30]), .Y(n340)
         );
  INVX1 U477 ( .A(n341), .Y(n118) );
  AOI22X1 U478 ( .A0(PWDATA[31]), .A1(n9), .B0(n20), .B1(CTRL[31]), .Y(n341)
         );
  NOR2BX1 U479 ( .AN(PADDR[3]), .B(n482), .Y(n205) );
  NOR2X1 U480 ( .A(n482), .B(PADDR[3]), .Y(n206) );
  NOR2BX1 U481 ( .AN(PADDR[3]), .B(PADDR[2]), .Y(n204) );
  NOR2X1 U482 ( .A(PADDR[1]), .B(PADDR[0]), .Y(n208) );
  INVX1 U483 ( .A(PADDR[2]), .Y(n482) );
  NOR2X1 U484 ( .A(PADDR[2]), .B(PADDR[3]), .Y(n207) );
endmodule


module Encoder_AMBA_WORD32_DATA_WIDTH32 ( clk, reset, data_in, CodeWord_Width, 
        En, data_out, ready_Encoder );
  input [31:0] data_in;
  input [31:0] CodeWord_Width;
  output [31:0] data_out;
  input clk, reset, En;
  output ready_Encoder;
  wire   N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42,
         N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56,
         N57, N58, N59, N60, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n83, n84, n85, n86, n87, n88, n89;

  EDFFX1 ready_Encoder_reg ( .D(En), .E(n7), .CK(clk), .Q(ready_Encoder) );
  DFFRHQX1 \data_out_reg[0]  ( .D(N29), .CK(clk), .RN(reset), .Q(data_out[0])
         );
  DFFRHQX1 \data_out_reg[5]  ( .D(N34), .CK(clk), .RN(reset), .Q(data_out[5])
         );
  DFFRHQX1 \data_out_reg[24]  ( .D(N53), .CK(clk), .RN(n7), .Q(data_out[24])
         );
  DFFRHQX1 \data_out_reg[17]  ( .D(N46), .CK(clk), .RN(n6), .Q(data_out[17])
         );
  DFFRHQX1 \data_out_reg[4]  ( .D(N33), .CK(clk), .RN(reset), .Q(data_out[4])
         );
  DFFRHQX1 \data_out_reg[2]  ( .D(N31), .CK(clk), .RN(reset), .Q(data_out[2])
         );
  DFFRHQX1 \data_out_reg[29]  ( .D(N58), .CK(clk), .RN(n7), .Q(data_out[29])
         );
  DFFRHQX1 \data_out_reg[27]  ( .D(N56), .CK(clk), .RN(n7), .Q(data_out[27])
         );
  DFFRHQX1 \data_out_reg[26]  ( .D(N55), .CK(clk), .RN(n7), .Q(data_out[26])
         );
  DFFRHQX1 \data_out_reg[25]  ( .D(N54), .CK(clk), .RN(n7), .Q(data_out[25])
         );
  DFFRHQX1 \data_out_reg[23]  ( .D(N52), .CK(clk), .RN(n6), .Q(data_out[23])
         );
  DFFRHQX1 \data_out_reg[21]  ( .D(N50), .CK(clk), .RN(n6), .Q(data_out[21])
         );
  DFFRHQX1 \data_out_reg[19]  ( .D(N48), .CK(clk), .RN(n6), .Q(data_out[19])
         );
  DFFRHQX1 \data_out_reg[18]  ( .D(N47), .CK(clk), .RN(n6), .Q(data_out[18])
         );
  DFFRHQX1 \data_out_reg[7]  ( .D(N36), .CK(clk), .RN(reset), .Q(data_out[7])
         );
  DFFRHQX1 \data_out_reg[3]  ( .D(N32), .CK(clk), .RN(reset), .Q(data_out[3])
         );
  DFFRHQX1 \data_out_reg[1]  ( .D(N30), .CK(clk), .RN(n4), .Q(data_out[1]) );
  DFFRHQX1 \data_out_reg[31]  ( .D(N60), .CK(clk), .RN(n7), .Q(data_out[31])
         );
  DFFRHQX1 \data_out_reg[30]  ( .D(N59), .CK(clk), .RN(n7), .Q(data_out[30])
         );
  DFFRHQX1 \data_out_reg[28]  ( .D(N57), .CK(clk), .RN(n7), .Q(data_out[28])
         );
  DFFRHQX1 \data_out_reg[22]  ( .D(N51), .CK(clk), .RN(n6), .Q(data_out[22])
         );
  DFFRHQX1 \data_out_reg[20]  ( .D(N49), .CK(clk), .RN(n6), .Q(data_out[20])
         );
  DFFRHQX1 \data_out_reg[16]  ( .D(N45), .CK(clk), .RN(n6), .Q(data_out[16])
         );
  DFFRHQX1 \data_out_reg[11]  ( .D(N40), .CK(clk), .RN(n7), .Q(data_out[11])
         );
  DFFRHQX1 \data_out_reg[10]  ( .D(N39), .CK(clk), .RN(n6), .Q(data_out[10])
         );
  DFFRHQX1 \data_out_reg[6]  ( .D(N35), .CK(clk), .RN(n7), .Q(data_out[6]) );
  DFFRHQX1 \data_out_reg[15]  ( .D(N44), .CK(clk), .RN(n6), .Q(data_out[15])
         );
  DFFRHQX1 \data_out_reg[14]  ( .D(N43), .CK(clk), .RN(n6), .Q(data_out[14])
         );
  DFFRHQX1 \data_out_reg[13]  ( .D(N42), .CK(clk), .RN(n6), .Q(data_out[13])
         );
  DFFRHQX1 \data_out_reg[12]  ( .D(N41), .CK(clk), .RN(n6), .Q(data_out[12])
         );
  DFFRHQX1 \data_out_reg[9]  ( .D(N38), .CK(clk), .RN(n6), .Q(data_out[9]) );
  DFFRHQX1 \data_out_reg[8]  ( .D(N37), .CK(clk), .RN(n6), .Q(data_out[8]) );
  XOR2XL U3 ( .A(data_in[17]), .B(data_in[21]), .Y(n29) );
  XNOR2XL U4 ( .A(data_in[15]), .B(data_in[19]), .Y(n81) );
  XOR2XL U5 ( .A(data_in[14]), .B(data_in[18]), .Y(n24) );
  XOR2XL U6 ( .A(data_in[23]), .B(data_in[22]), .Y(n60) );
  XOR2XL U7 ( .A(data_in[23]), .B(data_in[21]), .Y(n46) );
  BUFX4 U8 ( .A(n18), .Y(n3) );
  BUFX3 U9 ( .A(n19), .Y(n2) );
  CLKINVX3 U10 ( .A(n5), .Y(n7) );
  CLKINVX3 U11 ( .A(n5), .Y(n6) );
  INVX1 U12 ( .A(n5), .Y(n4) );
  INVX1 U13 ( .A(reset), .Y(n5) );
  INVX1 U14 ( .A(n20), .Y(n8) );
  NAND3X2 U15 ( .A(n89), .B(n88), .C(En), .Y(n20) );
  OAI222XL U16 ( .A0(n28), .A1(n2), .B0(n20), .B1(n87), .C0(n30), .C1(n3), .Y(
        N33) );
  XOR2X1 U17 ( .A(n31), .B(n32), .Y(n30) );
  XOR2X1 U18 ( .A(n24), .B(n33), .Y(n32) );
  XNOR2X1 U19 ( .A(n34), .B(n35), .Y(n31) );
  OAI222XL U20 ( .A0(n2), .A1(n87), .B0(n20), .B1(n86), .C0(n21), .C1(n3), .Y(
        N34) );
  XOR2X1 U21 ( .A(n22), .B(n23), .Y(n21) );
  XOR2X1 U22 ( .A(n24), .B(n25), .Y(n23) );
  XOR2X1 U23 ( .A(n26), .B(n27), .Y(n22) );
  OAI222XL U24 ( .A0(n55), .A1(n2), .B0(n56), .B1(n20), .C0(n57), .C1(n3), .Y(
        N31) );
  XOR2X1 U25 ( .A(n58), .B(n59), .Y(n57) );
  XOR2X1 U26 ( .A(n60), .B(n61), .Y(n59) );
  XOR2X1 U27 ( .A(n55), .B(n62), .Y(n58) );
  OAI221XL U28 ( .A0(n67), .A1(n10), .B0(n68), .B1(n2), .C0(n69), .Y(N30) );
  INVX1 U29 ( .A(N55), .Y(n10) );
  AOI32X1 U30 ( .A0(n67), .A1(n11), .A2(n1), .B0(n8), .B1(n70), .Y(n69) );
  XNOR2X1 U31 ( .A(n87), .B(n71), .Y(n70) );
  XOR2X1 U32 ( .A(n74), .B(n71), .Y(n68) );
  XOR2X1 U33 ( .A(n75), .B(n54), .Y(n74) );
  XNOR2X1 U34 ( .A(n68), .B(n34), .Y(n67) );
  BUFX3 U35 ( .A(n9), .Y(n1) );
  INVX1 U36 ( .A(n3), .Y(n9) );
  XOR2X1 U37 ( .A(n28), .B(n29), .Y(n26) );
  OAI222XL U38 ( .A0(n2), .A1(n86), .B0(n85), .B1(n20), .C0(n3), .C1(n87), .Y(
        N35) );
  OAI222XL U39 ( .A0(n2), .A1(n85), .B0(n84), .B1(n20), .C0(n3), .C1(n86), .Y(
        N36) );
  NOR2X1 U40 ( .A(n11), .B(n3), .Y(N55) );
  OAI22X1 U41 ( .A0(n3), .A1(n85), .B0(n2), .B1(n84), .Y(N37) );
  OAI22X1 U42 ( .A0(n3), .A1(n13), .B0(n12), .B1(n2), .Y(N44) );
  OAI22X1 U43 ( .A0(n3), .A1(n83), .B0(n2), .B1(n17), .Y(N39) );
  OAI22X1 U44 ( .A0(n3), .A1(n16), .B0(n2), .B1(n15), .Y(N41) );
  OAI22X1 U45 ( .A0(n3), .A1(n14), .B0(n2), .B1(n13), .Y(N43) );
  OAI22X1 U46 ( .A0(n3), .A1(n84), .B0(n2), .B1(n83), .Y(N38) );
  OAI22X1 U47 ( .A0(n3), .A1(n15), .B0(n2), .B1(n14), .Y(N42) );
  OAI22X1 U48 ( .A0(n3), .A1(n17), .B0(n2), .B1(n16), .Y(N40) );
  XOR2X1 U49 ( .A(n75), .B(n82), .Y(n76) );
  XOR2X1 U50 ( .A(n52), .B(n66), .Y(n82) );
  NOR2X1 U51 ( .A(n3), .B(n12), .Y(N45) );
  XOR2X1 U52 ( .A(n76), .B(n35), .Y(n79) );
  XOR2X1 U53 ( .A(n41), .B(n48), .Y(n44) );
  XOR2X1 U54 ( .A(n33), .B(n49), .Y(n48) );
  XNOR2X1 U55 ( .A(n86), .B(data_in[3]), .Y(n66) );
  INVX1 U56 ( .A(data_in[1]), .Y(n86) );
  INVX1 U57 ( .A(data_in[10]), .Y(n12) );
  NAND3X1 U58 ( .A(CodeWord_Width[1]), .B(n89), .C(En), .Y(n18) );
  XNOR2X1 U59 ( .A(n86), .B(data_in[2]), .Y(n39) );
  XNOR2X1 U60 ( .A(n12), .B(data_in[0]), .Y(n38) );
  XOR2X1 U61 ( .A(data_in[13]), .B(n29), .Y(n73) );
  XNOR2X1 U62 ( .A(n72), .B(n63), .Y(n34) );
  XNOR2X1 U63 ( .A(n73), .B(data_in[12]), .Y(n72) );
  XNOR2X1 U64 ( .A(data_in[6]), .B(n38), .Y(n75) );
  XNOR2X1 U65 ( .A(data_in[2]), .B(n66), .Y(n56) );
  XOR2X1 U66 ( .A(n36), .B(n37), .Y(n28) );
  XNOR2X1 U67 ( .A(data_in[4]), .B(n40), .Y(n36) );
  XOR2X1 U68 ( .A(n38), .B(n39), .Y(n37) );
  XNOR2X1 U69 ( .A(n15), .B(data_in[5]), .Y(n40) );
  XOR2X1 U70 ( .A(n64), .B(n65), .Y(n55) );
  XNOR2X1 U71 ( .A(n13), .B(data_in[8]), .Y(n65) );
  XOR2X1 U72 ( .A(n56), .B(n53), .Y(n64) );
  OAI222XL U73 ( .A0(n76), .A1(n2), .B0(n77), .B1(n20), .C0(n78), .C1(n3), .Y(
        N29) );
  XNOR2X1 U74 ( .A(data_in[0]), .B(n66), .Y(n77) );
  XOR2X1 U75 ( .A(n79), .B(n80), .Y(n78) );
  XOR2X1 U76 ( .A(data_in[25]), .B(n73), .Y(n80) );
  OAI222XL U77 ( .A0(n41), .A1(n2), .B0(n42), .B1(n20), .C0(n43), .C1(n3), .Y(
        N32) );
  XNOR2X1 U78 ( .A(data_in[0]), .B(n39), .Y(n42) );
  XOR2X1 U79 ( .A(n44), .B(n45), .Y(n43) );
  XOR2X1 U80 ( .A(n46), .B(n47), .Y(n45) );
  INVX1 U81 ( .A(data_in[3]), .Y(n84) );
  INVX1 U82 ( .A(data_in[7]), .Y(n15) );
  INVX1 U83 ( .A(data_in[5]), .Y(n17) );
  INVX1 U84 ( .A(data_in[9]), .Y(n13) );
  INVX1 U85 ( .A(data_in[4]), .Y(n83) );
  XOR2X1 U86 ( .A(data_in[24]), .B(data_in[25]), .Y(n49) );
  XNOR2X1 U87 ( .A(n84), .B(data_in[2]), .Y(n71) );
  XOR2X1 U88 ( .A(data_in[16]), .B(n49), .Y(n63) );
  XOR2X1 U89 ( .A(data_in[11]), .B(data_in[23]), .Y(n27) );
  XNOR2X1 U90 ( .A(n12), .B(data_in[7]), .Y(n53) );
  XNOR2X1 U91 ( .A(n17), .B(data_in[9]), .Y(n54) );
  XNOR2X1 U92 ( .A(n81), .B(n27), .Y(n35) );
  XNOR2X1 U93 ( .A(n83), .B(data_in[8]), .Y(n52) );
  XOR2X1 U94 ( .A(n50), .B(n51), .Y(n41) );
  XOR2X1 U95 ( .A(n52), .B(n53), .Y(n51) );
  XNOR2X1 U96 ( .A(data_in[6]), .B(n54), .Y(n50) );
  INVX1 U97 ( .A(CodeWord_Width[0]), .Y(n89) );
  INVX1 U98 ( .A(CodeWord_Width[1]), .Y(n88) );
  NAND3X1 U99 ( .A(En), .B(n88), .C(CodeWord_Width[0]), .Y(n19) );
  NOR2BX1 U100 ( .AN(data_in[13]), .B(n3), .Y(N48) );
  NOR2BX1 U101 ( .AN(data_in[15]), .B(n3), .Y(N50) );
  XOR2X1 U102 ( .A(data_in[14]), .B(n63), .Y(n62) );
  AND2X2 U103 ( .A(data_in[23]), .B(n1), .Y(N58) );
  AND2X2 U104 ( .A(data_in[12]), .B(n1), .Y(N47) );
  AND2X2 U105 ( .A(data_in[18]), .B(n1), .Y(N53) );
  AND2X2 U106 ( .A(data_in[21]), .B(n1), .Y(N56) );
  AND2X2 U107 ( .A(data_in[22]), .B(n1), .Y(N57) );
  AND2X2 U108 ( .A(data_in[19]), .B(n1), .Y(N54) );
  AND2X2 U109 ( .A(data_in[25]), .B(n1), .Y(N60) );
  AND2X2 U110 ( .A(data_in[14]), .B(n1), .Y(N49) );
  AND2X2 U111 ( .A(data_in[17]), .B(n1), .Y(N52) );
  AND2X2 U112 ( .A(data_in[24]), .B(n1), .Y(N59) );
  AND2X2 U113 ( .A(data_in[11]), .B(n1), .Y(N46) );
  AND2X2 U114 ( .A(data_in[16]), .B(n1), .Y(N51) );
  INVX1 U115 ( .A(data_in[0]), .Y(n87) );
  INVX1 U116 ( .A(data_in[2]), .Y(n85) );
  XNOR2X1 U117 ( .A(n11), .B(data_in[22]), .Y(n33) );
  INVX1 U118 ( .A(data_in[20]), .Y(n11) );
  XOR2X1 U119 ( .A(data_in[19]), .B(data_in[18]), .Y(n47) );
  XOR2X1 U120 ( .A(data_in[17]), .B(data_in[15]), .Y(n61) );
  XOR2X1 U121 ( .A(data_in[24]), .B(data_in[12]), .Y(n25) );
  INVX1 U122 ( .A(data_in[8]), .Y(n14) );
  INVX1 U123 ( .A(data_in[6]), .Y(n16) );
endmodule


module Decoder_AMBA_WORD32_DATA_WIDTH32 ( clk, reset, data_in, CodeWord_Width, 
        En, data_out, num_of_error, ready_Decoder );
  input [31:0] data_in;
  input [31:0] CodeWord_Width;
  output [31:0] data_out;
  output [1:0] num_of_error;
  input clk, reset, En;
  output ready_Decoder;
  wire   N123, N124, N125, N126, N182, N183, N184, N185, N186, N187, N188,
         N189, N190, N191, N192, N218, N219, N220, N337, N338, N339, N340,
         N341, N342, N343, N344, N345, N346, N347, N348, N349, N350, N351,
         N352, N353, N354, N355, N356, N357, N358, N359, N360, N361, N362,
         N449, N450, N451, N452, N453, N454, N455, N456, N457, N458, N459, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17,
         n18, n19, n20, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n120, n121, n122, n123, n124, n125,
         n126, n127, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n16, n21, n22, n119, n128, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240;
  assign data_out[31] = 1'b0;
  assign data_out[30] = 1'b0;
  assign data_out[29] = 1'b0;
  assign data_out[28] = 1'b0;
  assign data_out[27] = 1'b0;
  assign data_out[26] = 1'b0;

  DFFRHQX1 ready_Decoder_reg ( .D(En), .CK(clk), .RN(n239), .Q(ready_Decoder)
         );
  DFFRHQX1 \data_out_reg[25]  ( .D(n159), .CK(clk), .RN(n238), .Q(data_out[25]) );
  DFFRHQX1 \data_out_reg[24]  ( .D(n166), .CK(clk), .RN(n239), .Q(data_out[24]) );
  DFFRHQX1 \data_out_reg[23]  ( .D(n165), .CK(clk), .RN(n239), .Q(data_out[23]) );
  DFFRHQX1 \data_out_reg[22]  ( .D(n162), .CK(clk), .RN(n239), .Q(data_out[22]) );
  DFFRHQX1 \data_out_reg[21]  ( .D(n164), .CK(clk), .RN(n239), .Q(data_out[21]) );
  DFFRHQX1 \data_out_reg[20]  ( .D(n161), .CK(clk), .RN(n239), .Q(data_out[20]) );
  DFFRHQX1 \data_out_reg[19]  ( .D(n163), .CK(clk), .RN(n239), .Q(data_out[19]) );
  DFFRHQX1 \data_out_reg[18]  ( .D(n160), .CK(clk), .RN(n239), .Q(data_out[18]) );
  DFFRHQX1 \data_out_reg[17]  ( .D(n173), .CK(clk), .RN(n239), .Q(data_out[17]) );
  DFFRHQX1 \data_out_reg[16]  ( .D(n172), .CK(clk), .RN(n239), .Q(data_out[16]) );
  DFFRHQX1 \data_out_reg[15]  ( .D(n171), .CK(clk), .RN(n239), .Q(data_out[15]) );
  DFFRHQX1 \data_out_reg[14]  ( .D(n170), .CK(clk), .RN(n239), .Q(data_out[14]) );
  DFFRHQX1 \data_out_reg[13]  ( .D(n169), .CK(clk), .RN(n239), .Q(data_out[13]) );
  DFFRHQX1 \data_out_reg[12]  ( .D(n168), .CK(clk), .RN(n239), .Q(data_out[12]) );
  DFFRHQX1 \data_out_reg[11]  ( .D(n167), .CK(clk), .RN(n238), .Q(data_out[11]) );
  DFFRHQX1 \data_out_reg[10]  ( .D(N459), .CK(clk), .RN(n238), .Q(data_out[10]) );
  DFFRHQX1 \data_out_reg[9]  ( .D(N458), .CK(clk), .RN(n238), .Q(data_out[9])
         );
  DFFRHQX1 \data_out_reg[8]  ( .D(N457), .CK(clk), .RN(n238), .Q(data_out[8])
         );
  DFFRHQX1 \data_out_reg[7]  ( .D(N456), .CK(clk), .RN(n238), .Q(data_out[7])
         );
  DFFRHQX1 \data_out_reg[6]  ( .D(N455), .CK(clk), .RN(n238), .Q(data_out[6])
         );
  DFFRHQX1 \data_out_reg[5]  ( .D(N454), .CK(clk), .RN(n238), .Q(data_out[5])
         );
  DFFRHQX1 \data_out_reg[4]  ( .D(N453), .CK(clk), .RN(n238), .Q(data_out[4])
         );
  DFFRHQX1 \data_out_reg[3]  ( .D(N452), .CK(clk), .RN(n238), .Q(data_out[3])
         );
  DFFRHQX1 \data_out_reg[2]  ( .D(N451), .CK(clk), .RN(n238), .Q(data_out[2])
         );
  DFFRHQX1 \data_out_reg[1]  ( .D(N450), .CK(clk), .RN(n238), .Q(data_out[1])
         );
  DFFRHQX1 \data_out_reg[0]  ( .D(N449), .CK(clk), .RN(n238), .Q(data_out[0])
         );
  DFFRHQX1 \num_of_error_reg[1]  ( .D(n158), .CK(clk), .RN(n238), .Q(
        num_of_error[1]) );
  DFFRHQX1 \num_of_error_reg[0]  ( .D(n157), .CK(clk), .RN(n239), .Q(
        num_of_error[0]) );
  NAND2X2 U3 ( .A(N219), .B(N218), .Y(n207) );
  NAND2X2 U4 ( .A(N219), .B(n210), .Y(n183) );
  NAND2X2 U5 ( .A(N218), .B(n213), .Y(n191) );
  NOR2XL U6 ( .A(n205), .B(n183), .Y(n181) );
  NOR2XL U7 ( .A(n198), .B(n183), .Y(n178) );
  NOR2XL U8 ( .A(n208), .B(n183), .Y(n184) );
  NOR2XL U9 ( .A(n203), .B(n183), .Y(n180) );
  NOR3XL U10 ( .A(n183), .B(n214), .C(n196), .Y(n177) );
  NOR3XL U11 ( .A(n183), .B(n214), .C(n201), .Y(n179) );
  NOR2XL U12 ( .A(n194), .B(n183), .Y(n176) );
  INVX1 U13 ( .A(data_in[5]), .Y(n88) );
  NOR3X1 U14 ( .A(CodeWord_Width[0]), .B(CodeWord_Width[1]), .C(n111), .Y(n9)
         );
  CLKINVX3 U15 ( .A(n240), .Y(n239) );
  CLKINVX3 U16 ( .A(n19), .Y(n237) );
  CLKINVX3 U17 ( .A(n2), .Y(n235) );
  CLKINVX3 U18 ( .A(n240), .Y(n238) );
  INVX1 U19 ( .A(reset), .Y(n240) );
  INVX1 U20 ( .A(n5), .Y(n91) );
  CLKINVX3 U21 ( .A(n19), .Y(n236) );
  INVX1 U22 ( .A(n81), .Y(n73) );
  INVX1 U23 ( .A(n75), .Y(n80) );
  CLKINVX3 U24 ( .A(n2), .Y(n234) );
  NOR2X1 U25 ( .A(n93), .B(n13), .Y(n89) );
  INVX1 U26 ( .A(n93), .Y(n14) );
  INVX1 U27 ( .A(n72), .Y(n13) );
  NOR2X1 U28 ( .A(n72), .B(n14), .Y(n109) );
  XNOR2X1 U29 ( .A(n147), .B(n155), .Y(n118) );
  XOR2X1 U30 ( .A(n129), .B(n118), .Y(n102) );
  INVX1 U31 ( .A(N220), .Y(n212) );
  XOR2X1 U32 ( .A(n104), .B(n102), .Y(n126) );
  XNOR2X1 U33 ( .A(n104), .B(n105), .Y(n46) );
  INVX1 U34 ( .A(n174), .Y(n211) );
  XOR2X1 U35 ( .A(n136), .B(n137), .Y(n134) );
  XNOR2X1 U36 ( .A(n45), .B(n46), .Y(n43) );
  INVX1 U37 ( .A(N218), .Y(n210) );
  INVX1 U38 ( .A(N219), .Y(n213) );
  XOR2X1 U39 ( .A(n41), .B(n42), .Y(n40) );
  XOR2X1 U40 ( .A(n103), .B(n46), .Y(n51) );
  BUFX3 U41 ( .A(n175), .Y(n214) );
  NOR2X1 U42 ( .A(n83), .B(n4), .Y(n5) );
  XNOR2X1 U43 ( .A(n136), .B(n105), .Y(N123) );
  NOR2X1 U44 ( .A(n91), .B(n12), .Y(n81) );
  NAND2X1 U45 ( .A(n5), .B(n12), .Y(n75) );
  XNOR2X1 U46 ( .A(n117), .B(n105), .Y(n98) );
  XOR2X1 U47 ( .A(n106), .B(n118), .Y(n117) );
  XOR2X1 U48 ( .A(n116), .B(n120), .Y(n106) );
  XOR2X1 U49 ( .A(n121), .B(n114), .Y(n116) );
  XOR2X1 U50 ( .A(n113), .B(n112), .Y(n121) );
  XNOR2X1 U51 ( .A(n100), .B(n101), .Y(n96) );
  XNOR2X1 U52 ( .A(n102), .B(n51), .Y(n101) );
  XOR2X1 U53 ( .A(n106), .B(n107), .Y(n100) );
  OAI21XL U54 ( .A0(n74), .A1(n4), .B0(n73), .Y(n78) );
  CLKINVX3 U55 ( .A(n1), .Y(n55) );
  AOI2BB1X1 U56 ( .A0N(n82), .A1N(n83), .B0(n9), .Y(n74) );
  NOR2X1 U57 ( .A(n14), .B(n13), .Y(n82) );
  AOI31X1 U58 ( .A0(n211), .A1(n17), .A2(n18), .B0(n19), .Y(n15) );
  INVX1 U59 ( .A(n175), .Y(n17) );
  NOR3X1 U60 ( .A(N220), .B(N218), .C(N219), .Y(n18) );
  INVX1 U61 ( .A(n232), .Y(n85) );
  XOR2X1 U62 ( .A(n113), .B(n88), .Y(n72) );
  XOR2X1 U63 ( .A(n112), .B(n52), .Y(n93) );
  OR4X2 U64 ( .A(N126), .B(N125), .C(N124), .D(N123), .Y(n11) );
  XNOR2X1 U65 ( .A(n122), .B(n123), .Y(N220) );
  XOR2X1 U66 ( .A(n124), .B(n125), .Y(n123) );
  XOR2X1 U67 ( .A(n126), .B(n127), .Y(n122) );
  XOR2X1 U68 ( .A(data_in[2]), .B(data_in[29]), .Y(n125) );
  XNOR2X1 U69 ( .A(data_in[8]), .B(data_in[15]), .Y(n147) );
  XOR2X1 U70 ( .A(data_in[13]), .B(data_in[14]), .Y(n155) );
  NAND2X1 U71 ( .A(n76), .B(n77), .Y(N451) );
  AOI221X1 U72 ( .A0(n232), .A1(n233), .B0(data_in[6]), .B1(n78), .C0(n79), 
        .Y(n77) );
  AOI222X1 U73 ( .A0(N339), .A1(n235), .B0(N184), .B1(n55), .C0(n237), .C1(
        data_in[8]), .Y(n76) );
  NOR4BX1 U74 ( .AN(n80), .B(n13), .C(n14), .D(data_in[6]), .Y(n79) );
  XNOR2X1 U75 ( .A(n130), .B(n131), .Y(N219) );
  XOR2X1 U76 ( .A(n132), .B(n133), .Y(n131) );
  XOR2X1 U77 ( .A(n134), .B(n135), .Y(n130) );
  XOR2X1 U78 ( .A(data_in[30]), .B(data_in[28]), .Y(n132) );
  XNOR2X1 U79 ( .A(n37), .B(n38), .Y(n174) );
  XOR2X1 U80 ( .A(n39), .B(n40), .Y(n38) );
  XOR2X1 U81 ( .A(n43), .B(n44), .Y(n37) );
  XOR2X1 U82 ( .A(data_in[27]), .B(data_in[1]), .Y(n39) );
  XOR2X1 U83 ( .A(data_in[12]), .B(data_in[9]), .Y(n105) );
  XNOR2X1 U84 ( .A(data_in[16]), .B(data_in[31]), .Y(n104) );
  INVX1 U85 ( .A(data_in[6]), .Y(n84) );
  XOR2X1 U86 ( .A(data_in[10]), .B(data_in[11]), .Y(n153) );
  XOR2X1 U87 ( .A(data_in[22]), .B(data_in[30]), .Y(n42) );
  XNOR2X1 U88 ( .A(n147), .B(n148), .Y(n44) );
  XNOR2X1 U89 ( .A(n84), .B(data_in[11]), .Y(n148) );
  XNOR2X1 U90 ( .A(n141), .B(n42), .Y(n129) );
  XNOR2X1 U91 ( .A(data_in[20]), .B(data_in[28]), .Y(n141) );
  INVX1 U92 ( .A(n35), .Y(n172) );
  AOI22X1 U93 ( .A0(data_in[22]), .A1(n237), .B0(N353), .B1(n235), .Y(n35) );
  INVX1 U94 ( .A(n25), .Y(n162) );
  AOI22X1 U95 ( .A0(data_in[28]), .A1(n236), .B0(N359), .B1(n234), .Y(n25) );
  INVX1 U96 ( .A(n29), .Y(n166) );
  AOI22X1 U97 ( .A0(data_in[30]), .A1(n236), .B0(N361), .B1(n234), .Y(n29) );
  INVX1 U98 ( .A(n20), .Y(n159) );
  AOI22X1 U99 ( .A0(data_in[31]), .A1(n236), .B0(N362), .B1(n234), .Y(n20) );
  XOR2X1 U100 ( .A(data_in[3]), .B(n153), .Y(n120) );
  XOR2X1 U101 ( .A(n156), .B(n155), .Y(n136) );
  XNOR2X1 U102 ( .A(n120), .B(data_in[15]), .Y(n156) );
  NAND2X1 U103 ( .A(n56), .B(n57), .Y(N458) );
  AOI22X1 U104 ( .A0(n232), .A1(data_in[14]), .B0(N191), .B1(n55), .Y(n57) );
  AOI22X1 U105 ( .A0(n237), .A1(data_in[15]), .B0(N346), .B1(n235), .Y(n56) );
  NAND2X1 U106 ( .A(n62), .B(n63), .Y(N455) );
  AOI22X1 U107 ( .A0(n232), .A1(data_in[11]), .B0(N188), .B1(n55), .Y(n63) );
  AOI22X1 U108 ( .A0(n237), .A1(data_in[12]), .B0(N343), .B1(n235), .Y(n62) );
  NAND2X1 U109 ( .A(n53), .B(n54), .Y(N459) );
  AOI22X1 U110 ( .A0(n232), .A1(data_in[15]), .B0(N192), .B1(n55), .Y(n54) );
  AOI22X1 U111 ( .A0(n237), .A1(data_in[16]), .B0(N347), .B1(n235), .Y(n53) );
  INVX1 U112 ( .A(n36), .Y(n173) );
  AOI22X1 U113 ( .A0(data_in[23]), .A1(n237), .B0(N354), .B1(n235), .Y(n36) );
  INVX1 U114 ( .A(n23), .Y(n160) );
  AOI22X1 U115 ( .A0(data_in[24]), .A1(n236), .B0(N355), .B1(n234), .Y(n23) );
  INVX1 U116 ( .A(n24), .Y(n161) );
  AOI22X1 U117 ( .A0(data_in[26]), .A1(n236), .B0(N357), .B1(n234), .Y(n24) );
  XNOR2X1 U118 ( .A(n138), .B(n139), .Y(N218) );
  XOR2X1 U119 ( .A(n107), .B(n140), .Y(n139) );
  XOR2X1 U120 ( .A(n103), .B(n129), .Y(n138) );
  XNOR2X1 U121 ( .A(n108), .B(data_in[31]), .Y(n140) );
  OAI211X1 U122 ( .A0(n88), .A1(n85), .B0(n94), .C0(n95), .Y(N449) );
  AOI32X1 U123 ( .A0(n81), .A1(n108), .A2(n109), .B0(data_in[4]), .B1(n110), 
        .Y(n94) );
  AOI222X1 U124 ( .A0(N337), .A1(n234), .B0(N182), .B1(n55), .C0(n237), .C1(
        data_in[6]), .Y(n95) );
  OAI21XL U125 ( .A0(n109), .A1(n91), .B0(n92), .Y(n110) );
  XOR2X1 U126 ( .A(data_in[18]), .B(data_in[26]), .Y(n41) );
  XOR2X1 U127 ( .A(data_in[25]), .B(n144), .Y(n137) );
  XOR2X1 U128 ( .A(data_in[29]), .B(data_in[27]), .Y(n144) );
  XOR2X1 U129 ( .A(data_in[19]), .B(data_in[23]), .Y(n45) );
  INVX1 U130 ( .A(n26), .Y(n163) );
  AOI22X1 U131 ( .A0(data_in[25]), .A1(n236), .B0(N356), .B1(n234), .Y(n26) );
  XOR2X1 U132 ( .A(n142), .B(n143), .Y(n103) );
  XOR2X1 U133 ( .A(data_in[21]), .B(data_in[17]), .Y(n143) );
  XNOR2X1 U134 ( .A(n137), .B(n45), .Y(n142) );
  XOR2X1 U135 ( .A(data_in[23]), .B(data_in[21]), .Y(n127) );
  NAND2X1 U136 ( .A(n60), .B(n61), .Y(N456) );
  AOI22X1 U137 ( .A0(n232), .A1(data_in[12]), .B0(N189), .B1(n55), .Y(n61) );
  AOI22X1 U138 ( .A0(n237), .A1(data_in[13]), .B0(N344), .B1(n235), .Y(n60) );
  NAND2X1 U139 ( .A(n66), .B(n67), .Y(N453) );
  AOI22X1 U140 ( .A0(n232), .A1(data_in[9]), .B0(N186), .B1(n55), .Y(n67) );
  AOI22X1 U141 ( .A0(n237), .A1(data_in[10]), .B0(N341), .B1(n235), .Y(n66) );
  NAND2X1 U142 ( .A(n64), .B(n65), .Y(N454) );
  AOI22X1 U143 ( .A0(n232), .A1(data_in[10]), .B0(N187), .B1(n55), .Y(n65) );
  AOI22X1 U144 ( .A0(n237), .A1(data_in[11]), .B0(N342), .B1(n235), .Y(n64) );
  NAND2X1 U145 ( .A(n58), .B(n59), .Y(N457) );
  AOI22X1 U146 ( .A0(n232), .A1(data_in[13]), .B0(N190), .B1(n55), .Y(n59) );
  AOI22X1 U147 ( .A0(n237), .A1(data_in[14]), .B0(N345), .B1(n235), .Y(n58) );
  XOR2X1 U148 ( .A(data_in[9]), .B(n233), .Y(n124) );
  INVX1 U149 ( .A(n34), .Y(n171) );
  AOI22X1 U150 ( .A0(data_in[21]), .A1(n237), .B0(N352), .B1(n235), .Y(n34) );
  INVX1 U151 ( .A(n30), .Y(n167) );
  AOI22X1 U152 ( .A0(data_in[17]), .A1(n236), .B0(N348), .B1(n234), .Y(n30) );
  INVX1 U153 ( .A(n31), .Y(n168) );
  AOI22X1 U154 ( .A0(data_in[18]), .A1(n236), .B0(N349), .B1(n234), .Y(n31) );
  INVX1 U155 ( .A(n32), .Y(n169) );
  AOI22X1 U156 ( .A0(data_in[19]), .A1(n236), .B0(N350), .B1(n234), .Y(n32) );
  INVX1 U157 ( .A(n33), .Y(n170) );
  AOI22X1 U158 ( .A0(data_in[20]), .A1(n236), .B0(N351), .B1(n234), .Y(n33) );
  INVX1 U159 ( .A(n27), .Y(n164) );
  AOI22X1 U160 ( .A0(data_in[27]), .A1(n236), .B0(N358), .B1(n234), .Y(n27) );
  INVX1 U161 ( .A(n28), .Y(n165) );
  AOI22X1 U162 ( .A0(data_in[29]), .A1(n236), .B0(N360), .B1(n234), .Y(n28) );
  OAI211X1 U163 ( .A0(n84), .A1(n85), .B0(n86), .C0(n87), .Y(N450) );
  AOI32X1 U164 ( .A0(n81), .A1(n88), .A2(n89), .B0(data_in[5]), .B1(n90), .Y(
        n86) );
  AOI222X1 U165 ( .A0(N338), .A1(n235), .B0(N183), .B1(n55), .C0(n237), .C1(
        n233), .Y(n87) );
  OAI21XL U166 ( .A0(n89), .A1(n91), .B0(n92), .Y(n90) );
  XNOR2X1 U167 ( .A(n47), .B(n48), .Y(n175) );
  XOR2X1 U168 ( .A(data_in[0]), .B(n49), .Y(n48) );
  XOR2X1 U169 ( .A(n51), .B(n52), .Y(n47) );
  XNOR2X1 U170 ( .A(n50), .B(data_in[10]), .Y(n49) );
  XOR2X1 U171 ( .A(data_in[24]), .B(n41), .Y(n107) );
  INVX1 U172 ( .A(data_in[4]), .Y(n108) );
  XNOR2X1 U173 ( .A(data_in[12]), .B(n104), .Y(n135) );
  XOR2X1 U174 ( .A(data_in[26]), .B(data_in[24]), .Y(n133) );
  NAND2X1 U175 ( .A(n68), .B(n69), .Y(N452) );
  AOI221X1 U176 ( .A0(n232), .A1(data_in[8]), .B0(n233), .B1(n70), .C0(n71), 
        .Y(n69) );
  AOI222X1 U177 ( .A0(N340), .A1(n235), .B0(N185), .B1(n55), .C0(n237), .C1(
        data_in[9]), .Y(n68) );
  OAI21XL U178 ( .A0(n74), .A1(n4), .B0(n75), .Y(n70) );
  XNOR2X1 U179 ( .A(n154), .B(n118), .Y(N124) );
  XOR2X1 U180 ( .A(n113), .B(data_in[12]), .Y(n154) );
  XNOR2X1 U181 ( .A(n145), .B(n146), .Y(N126) );
  XOR2X1 U182 ( .A(data_in[9]), .B(data_in[13]), .Y(n146) );
  XNOR2X1 U183 ( .A(n114), .B(n44), .Y(n145) );
  XNOR2X1 U184 ( .A(n149), .B(n150), .Y(N125) );
  XOR2X1 U185 ( .A(data_in[1]), .B(n151), .Y(n150) );
  XNOR2X1 U186 ( .A(n152), .B(n147), .Y(n149) );
  XNOR2X1 U187 ( .A(n233), .B(n88), .Y(n151) );
  XNOR2X1 U188 ( .A(n84), .B(n233), .Y(n52) );
  AOI21X1 U189 ( .A0(En), .A1(n9), .B0(n80), .Y(n92) );
  XNOR2X1 U190 ( .A(data_in[0]), .B(n88), .Y(n114) );
  XNOR2X1 U191 ( .A(data_in[2]), .B(n52), .Y(n113) );
  NAND3X1 U192 ( .A(n97), .B(n96), .C(En), .Y(n2) );
  NAND4X1 U193 ( .A(CodeWord_Width[0]), .B(En), .C(n98), .D(n99), .Y(n1) );
  NAND3BX1 U194 ( .AN(n96), .B(En), .C(n97), .Y(n19) );
  NOR4BX1 U195 ( .AN(n72), .B(n14), .C(n73), .D(n233), .Y(n71) );
  NAND3BX1 U196 ( .AN(CodeWord_Width[0]), .B(n99), .C(n111), .Y(n83) );
  XNOR2X1 U197 ( .A(n116), .B(data_in[3]), .Y(n111) );
  XNOR2X1 U204 ( .A(data_in[14]), .B(n153), .Y(n152) );
  BUFX3 U205 ( .A(n10), .Y(n232) );
  NOR4BX1 U206 ( .AN(CodeWord_Width[0]), .B(n98), .C(n4), .D(CodeWord_Width[1]), .Y(n10) );
  XNOR2X1 U207 ( .A(data_in[1]), .B(n108), .Y(n112) );
  INVX1 U208 ( .A(data_in[14]), .Y(n50) );
  NOR2X1 U209 ( .A(n99), .B(CodeWord_Width[0]), .Y(n97) );
  INVX1 U210 ( .A(CodeWord_Width[1]), .Y(n99) );
  XNOR2X1 U211 ( .A(n114), .B(n115), .Y(n12) );
  XNOR2X1 U212 ( .A(n233), .B(n108), .Y(n115) );
  CLKINVX3 U213 ( .A(En), .Y(n4) );
  BUFX3 U214 ( .A(data_in[7]), .Y(n233) );
  NAND2X1 U215 ( .A(n6), .B(n7), .Y(n158) );
  AOI22X1 U216 ( .A0(n8), .A1(n9), .B0(n232), .B1(n11), .Y(n7) );
  AOI21X1 U217 ( .A0(num_of_error[1]), .A1(n4), .B0(n15), .Y(n6) );
  AOI31X1 U218 ( .A0(n12), .A1(n13), .A2(n14), .B0(n4), .Y(n8) );
  NAND3X1 U219 ( .A(n1), .B(n2), .C(n3), .Y(n157) );
  AOI21X1 U220 ( .A0(num_of_error[0]), .A1(n4), .B0(n5), .Y(n3) );
  NAND2X1 U221 ( .A(n174), .B(n212), .Y(n196) );
  NAND3X1 U222 ( .A(n210), .B(n213), .C(n214), .Y(n119) );
  NOR2X1 U223 ( .A(n196), .B(n119), .Y(n16) );
  XOR2X1 U224 ( .A(data_in[6]), .B(n16), .Y(N337) );
  NAND2X1 U225 ( .A(N220), .B(n211), .Y(n201) );
  NOR2X1 U226 ( .A(n201), .B(n119), .Y(n21) );
  XOR2X1 U227 ( .A(n233), .B(n21), .Y(N338) );
  NOR2X1 U228 ( .A(n211), .B(n212), .Y(n182) );
  NAND2X1 U229 ( .A(n182), .B(n17), .Y(n205) );
  NOR3X1 U230 ( .A(n205), .B(N219), .C(N218), .Y(n22) );
  XOR2X1 U231 ( .A(data_in[8]), .B(n22), .Y(N339) );
  NOR2BX1 U232 ( .AN(n182), .B(n119), .Y(n128) );
  XOR2X1 U233 ( .A(data_in[9]), .B(n128), .Y(N340) );
  NAND3X1 U234 ( .A(n212), .B(n211), .C(n214), .Y(n194) );
  XOR2X1 U235 ( .A(data_in[10]), .B(n176), .Y(N341) );
  XOR2X1 U236 ( .A(data_in[11]), .B(n177), .Y(N342) );
  NAND2BX1 U237 ( .AN(n196), .B(n214), .Y(n198) );
  XOR2X1 U238 ( .A(data_in[12]), .B(n178), .Y(N343) );
  XOR2X1 U239 ( .A(data_in[13]), .B(n179), .Y(N344) );
  NAND2BX1 U240 ( .AN(n201), .B(n214), .Y(n203) );
  XOR2X1 U241 ( .A(data_in[14]), .B(n180), .Y(N345) );
  XOR2X1 U242 ( .A(data_in[15]), .B(n181), .Y(N346) );
  NAND2X1 U243 ( .A(n214), .B(n182), .Y(n208) );
  XOR2X1 U244 ( .A(data_in[16]), .B(n184), .Y(N347) );
  NOR2X1 U245 ( .A(n194), .B(n191), .Y(n185) );
  XOR2X1 U246 ( .A(data_in[17]), .B(n185), .Y(N348) );
  NOR3X1 U247 ( .A(n191), .B(n214), .C(n196), .Y(n186) );
  XOR2X1 U248 ( .A(data_in[18]), .B(n186), .Y(N349) );
  NOR2X1 U249 ( .A(n198), .B(n191), .Y(n187) );
  XOR2X1 U250 ( .A(data_in[19]), .B(n187), .Y(N350) );
  NOR3X1 U251 ( .A(n191), .B(n214), .C(n201), .Y(n188) );
  XOR2X1 U252 ( .A(data_in[20]), .B(n188), .Y(N351) );
  NOR2X1 U253 ( .A(n203), .B(n191), .Y(n189) );
  XOR2X1 U254 ( .A(data_in[21]), .B(n189), .Y(N352) );
  NOR2X1 U255 ( .A(n205), .B(n191), .Y(n190) );
  XOR2X1 U256 ( .A(data_in[22]), .B(n190), .Y(N353) );
  NOR2X1 U257 ( .A(n208), .B(n191), .Y(n192) );
  XOR2X1 U258 ( .A(data_in[23]), .B(n192), .Y(N354) );
  NAND2BX1 U259 ( .AN(n207), .B(n17), .Y(n200) );
  NOR3X1 U260 ( .A(n200), .B(n174), .C(N220), .Y(n193) );
  XOR2X1 U261 ( .A(data_in[24]), .B(n193), .Y(N355) );
  NOR2X1 U262 ( .A(n207), .B(n194), .Y(n195) );
  XOR2X1 U263 ( .A(data_in[25]), .B(n195), .Y(N356) );
  NOR2X1 U264 ( .A(n200), .B(n196), .Y(n197) );
  XOR2X1 U265 ( .A(data_in[26]), .B(n197), .Y(N357) );
  NOR2X1 U266 ( .A(n207), .B(n198), .Y(n199) );
  XOR2X1 U267 ( .A(data_in[27]), .B(n199), .Y(N358) );
  NOR2X1 U268 ( .A(n201), .B(n200), .Y(n202) );
  XOR2X1 U269 ( .A(data_in[28]), .B(n202), .Y(N359) );
  NOR2X1 U270 ( .A(n207), .B(n203), .Y(n204) );
  XOR2X1 U271 ( .A(data_in[29]), .B(n204), .Y(N360) );
  NOR2X1 U272 ( .A(n207), .B(n205), .Y(n206) );
  XOR2X1 U273 ( .A(data_in[30]), .B(n206), .Y(N361) );
  NOR2X1 U274 ( .A(n208), .B(n207), .Y(n209) );
  XOR2X1 U275 ( .A(data_in[31]), .B(n209), .Y(N362) );
  NAND2X1 U276 ( .A(N126), .B(N125), .Y(n229) );
  NOR3X1 U277 ( .A(N124), .B(N123), .C(n229), .Y(n215) );
  XOR2X1 U278 ( .A(data_in[5]), .B(n215), .Y(N182) );
  NAND2BX1 U279 ( .AN(N123), .B(N124), .Y(n218) );
  NAND2BX1 U280 ( .AN(N125), .B(N126), .Y(n225) );
  NOR2X1 U281 ( .A(n218), .B(n225), .Y(n216) );
  XOR2X1 U282 ( .A(data_in[6]), .B(n216), .Y(N183) );
  NAND2BX1 U283 ( .AN(N126), .B(N125), .Y(n227) );
  NOR2X1 U284 ( .A(n218), .B(n227), .Y(n217) );
  XOR2X1 U285 ( .A(n233), .B(n217), .Y(N184) );
  NOR2X1 U286 ( .A(n218), .B(n229), .Y(n219) );
  XOR2X1 U287 ( .A(data_in[8]), .B(n219), .Y(N185) );
  NAND2BX1 U288 ( .AN(N124), .B(N123), .Y(n222) );
  NOR2X1 U289 ( .A(n222), .B(n225), .Y(n220) );
  XOR2X1 U290 ( .A(data_in[9]), .B(n220), .Y(N186) );
  NOR2X1 U291 ( .A(n222), .B(n227), .Y(n221) );
  XOR2X1 U292 ( .A(data_in[10]), .B(n221), .Y(N187) );
  NOR2X1 U293 ( .A(n222), .B(n229), .Y(n223) );
  XOR2X1 U294 ( .A(data_in[11]), .B(n223), .Y(N188) );
  NAND2X1 U295 ( .A(N124), .B(N123), .Y(n230) );
  NOR3X1 U296 ( .A(N126), .B(N125), .C(n230), .Y(n224) );
  XOR2X1 U297 ( .A(data_in[12]), .B(n224), .Y(N189) );
  NOR2X1 U298 ( .A(n225), .B(n230), .Y(n226) );
  XOR2X1 U299 ( .A(data_in[13]), .B(n226), .Y(N190) );
  NOR2X1 U300 ( .A(n227), .B(n230), .Y(n228) );
  XOR2X1 U301 ( .A(data_in[14]), .B(n228), .Y(N191) );
  NOR2X1 U302 ( .A(n230), .B(n229), .Y(n231) );
  XOR2X1 U303 ( .A(data_in[15]), .B(n231), .Y(N192) );
endmodule


module controller_AMBA_WORD32_DATA_WIDTH32 ( clk, reset, CTRL, DATA_IN, 
        CODEWORD_WIDTH, NOISE, CTRL_ready, data_out, operation_done, 
        num_of_errors );
  input [31:0] CTRL;
  input [31:0] DATA_IN;
  input [31:0] CODEWORD_WIDTH;
  input [31:0] NOISE;
  output [31:0] data_out;
  output [1:0] num_of_errors;
  input clk, reset, CTRL_ready;
  output operation_done;
  wire   ready_Encoder_enc, ready_Decoder_dec, \current_state_enc[1] ,
         \current_state_dec[1] , N233, N266, n47, n48, n49, n50, n51, n53, n54,
         n55, n56, n57, n58, n60, n61, n62, n63, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n52, n59, n64, n96, n97, n98, n99, n100, n101, n102, n137, n138,
         n139;
  wire   [1:0] En_Enc_Dec_real;
  wire   [31:0] data_out_enc;
  wire   [31:0] data_in_dec_real;
  wire   [31:0] CodeWord_Width_dec_real;
  wire   [31:0] data_out_dec;
  wire   [1:0] num_of_error_dec;
  wire   [1:0] current_state;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5;

  NAND2X4 U5 ( .A(n48), .B(n49), .Y(n47) );
  OAI32X4 U117 ( .A0(n101), .A1(current_state[0]), .A2(n61), .B0(n138), .B1(
        n98), .Y(n56) );
  Encoder_AMBA_WORD32_DATA_WIDTH32 Encoder ( .clk(clk), .reset(reset), 
        .data_in(DATA_IN), .CodeWord_Width(CODEWORD_WIDTH), .En(
        En_Enc_Dec_real[0]), .data_out(data_out_enc), .ready_Encoder(
        ready_Encoder_enc) );
  Decoder_AMBA_WORD32_DATA_WIDTH32 Decoder ( .clk(clk), .reset(reset), 
        .data_in(data_in_dec_real), .CodeWord_Width(CodeWord_Width_dec_real), 
        .En(En_Enc_Dec_real[1]), .data_out({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, data_out_dec[25:0]}), .num_of_error(
        num_of_error_dec), .ready_Decoder(ready_Decoder_dec) );
  DFFRHQX1 \num_of_errors_reg[1]  ( .D(n22), .CK(clk), .RN(reset), .Q(
        num_of_errors[1]) );
  DFFRHQX1 \num_of_errors_reg[0]  ( .D(n23), .CK(clk), .RN(reset), .Q(
        num_of_errors[0]) );
  DFFRHQX1 \current_state_dec_reg[1]  ( .D(n133), .CK(clk), .RN(reset), .Q(
        \current_state_dec[1] ) );
  DFFRHQX1 \current_state_reg[1]  ( .D(n135), .CK(clk), .RN(reset), .Q(
        current_state[1]) );
  DFFRHQX1 \current_state_reg[0]  ( .D(n136), .CK(clk), .RN(reset), .Q(
        current_state[0]) );
  DFFRHQX1 \data_out_reg[0]  ( .D(n64), .CK(clk), .RN(reset), .Q(data_out[0])
         );
  DFFRHQX1 \data_out_reg[1]  ( .D(n59), .CK(clk), .RN(reset), .Q(data_out[1])
         );
  DFFRHQX1 \data_out_reg[2]  ( .D(n52), .CK(clk), .RN(reset), .Q(data_out[2])
         );
  DFFRHQX1 \data_out_reg[3]  ( .D(n46), .CK(clk), .RN(reset), .Q(data_out[3])
         );
  DFFRHQX1 \data_out_reg[4]  ( .D(n45), .CK(clk), .RN(reset), .Q(data_out[4])
         );
  DFFRHQX1 \data_out_reg[5]  ( .D(n44), .CK(clk), .RN(reset), .Q(data_out[5])
         );
  DFFRHQX1 \data_out_reg[6]  ( .D(n43), .CK(clk), .RN(reset), .Q(data_out[6])
         );
  DFFRHQX1 \data_out_reg[7]  ( .D(n42), .CK(clk), .RN(reset), .Q(data_out[7])
         );
  DFFRHQX1 \data_out_reg[8]  ( .D(n41), .CK(clk), .RN(reset), .Q(data_out[8])
         );
  DFFRHQX1 \data_out_reg[9]  ( .D(n40), .CK(clk), .RN(reset), .Q(data_out[9])
         );
  DFFRHQX1 \data_out_reg[10]  ( .D(n39), .CK(clk), .RN(reset), .Q(data_out[10]) );
  DFFRHQX1 \data_out_reg[11]  ( .D(n38), .CK(clk), .RN(reset), .Q(data_out[11]) );
  DFFRHQX1 \data_out_reg[12]  ( .D(n37), .CK(clk), .RN(reset), .Q(data_out[12]) );
  DFFRHQX1 \data_out_reg[13]  ( .D(n36), .CK(clk), .RN(reset), .Q(data_out[13]) );
  DFFRHQX1 \data_out_reg[14]  ( .D(n35), .CK(clk), .RN(reset), .Q(data_out[14]) );
  DFFRHQX1 \data_out_reg[15]  ( .D(n34), .CK(clk), .RN(reset), .Q(data_out[15]) );
  DFFRHQX1 \data_out_reg[16]  ( .D(n33), .CK(clk), .RN(reset), .Q(data_out[16]) );
  DFFRHQX1 \data_out_reg[17]  ( .D(n32), .CK(clk), .RN(reset), .Q(data_out[17]) );
  DFFRHQX1 \data_out_reg[18]  ( .D(n31), .CK(clk), .RN(reset), .Q(data_out[18]) );
  DFFRHQX1 \data_out_reg[19]  ( .D(n30), .CK(clk), .RN(reset), .Q(data_out[19]) );
  DFFRHQX1 \data_out_reg[20]  ( .D(n29), .CK(clk), .RN(reset), .Q(data_out[20]) );
  DFFRHQX1 \data_out_reg[21]  ( .D(n28), .CK(clk), .RN(reset), .Q(data_out[21]) );
  DFFRHQX1 \data_out_reg[22]  ( .D(n27), .CK(clk), .RN(reset), .Q(data_out[22]) );
  DFFRHQX1 \data_out_reg[23]  ( .D(n26), .CK(clk), .RN(reset), .Q(data_out[23]) );
  DFFRHQX1 \data_out_reg[24]  ( .D(n25), .CK(clk), .RN(reset), .Q(data_out[24]) );
  DFFRHQX1 \data_out_reg[25]  ( .D(n24), .CK(clk), .RN(reset), .Q(data_out[25]) );
  DFFRHQX1 \data_out_reg[26]  ( .D(n9), .CK(clk), .RN(reset), .Q(data_out[26])
         );
  DFFRHQX1 \data_out_reg[27]  ( .D(n8), .CK(clk), .RN(reset), .Q(data_out[27])
         );
  DFFRHQX1 \data_out_reg[28]  ( .D(n7), .CK(clk), .RN(reset), .Q(data_out[28])
         );
  DFFRHQX1 \data_out_reg[29]  ( .D(n6), .CK(clk), .RN(reset), .Q(data_out[29])
         );
  DFFRHQX1 \data_out_reg[30]  ( .D(n5), .CK(clk), .RN(reset), .Q(data_out[30])
         );
  DFFRHQX1 \data_out_reg[31]  ( .D(n4), .CK(clk), .RN(reset), .Q(data_out[31])
         );
  DFFRHQX1 operation_done_reg ( .D(N233), .CK(clk), .RN(reset), .Q(
        operation_done) );
  DFFRHQX1 \current_state_enc_reg[1]  ( .D(n134), .CK(clk), .RN(reset), .Q(
        \current_state_enc[1] ) );
  AND2X2 U3 ( .A(n138), .B(n61), .Y(n1) );
  AND2X2 U4 ( .A(n3), .B(En_Enc_Dec_real[0]), .Y(n2) );
  OAI2BB2X1 U6 ( .B0(n72), .B1(n17), .A0N(DATA_IN[30]), .A1N(n16), .Y(
        data_in_dec_real[30]) );
  OAI2BB2X1 U7 ( .B0(n71), .B1(n17), .A0N(DATA_IN[31]), .A1N(n16), .Y(
        data_in_dec_real[31]) );
  OAI2BB2X1 U8 ( .B0(n75), .B1(n17), .A0N(DATA_IN[28]), .A1N(n16), .Y(
        data_in_dec_real[28]) );
  OAI2BB2X1 U9 ( .B0(n76), .B1(n18), .A0N(DATA_IN[27]), .A1N(n16), .Y(
        data_in_dec_real[27]) );
  OAI2BB2X1 U10 ( .B0(n74), .B1(n17), .A0N(DATA_IN[29]), .A1N(n16), .Y(
        data_in_dec_real[29]) );
  OAI2BB2X1 U11 ( .B0(n80), .B1(n18), .A0N(DATA_IN[23]), .A1N(n16), .Y(
        data_in_dec_real[23]) );
  OAI2BB2X1 U12 ( .B0(n77), .B1(n18), .A0N(DATA_IN[26]), .A1N(n16), .Y(
        data_in_dec_real[26]) );
  OAI2BB2X1 U13 ( .B0(n82), .B1(n17), .A0N(DATA_IN[21]), .A1N(n16), .Y(
        data_in_dec_real[21]) );
  OAI2BB2X1 U14 ( .B0(n79), .B1(n63), .A0N(DATA_IN[24]), .A1N(n16), .Y(
        data_in_dec_real[24]) );
  NOR2BX1 U15 ( .AN(CODEWORD_WIDTH[20]), .B(n11), .Y(
        CodeWord_Width_dec_real[20]) );
  NOR2BX1 U16 ( .AN(CODEWORD_WIDTH[21]), .B(n11), .Y(
        CodeWord_Width_dec_real[21]) );
  NOR2BX1 U17 ( .AN(CODEWORD_WIDTH[22]), .B(n11), .Y(
        CodeWord_Width_dec_real[22]) );
  NOR2BX1 U18 ( .AN(CODEWORD_WIDTH[23]), .B(n11), .Y(
        CodeWord_Width_dec_real[23]) );
  NOR2BX1 U19 ( .AN(CODEWORD_WIDTH[24]), .B(n11), .Y(
        CodeWord_Width_dec_real[24]) );
  NOR2BX1 U20 ( .AN(CODEWORD_WIDTH[25]), .B(n11), .Y(
        CodeWord_Width_dec_real[25]) );
  NOR2BX1 U21 ( .AN(CODEWORD_WIDTH[26]), .B(n11), .Y(
        CodeWord_Width_dec_real[26]) );
  NOR2BX1 U22 ( .AN(CODEWORD_WIDTH[27]), .B(n11), .Y(
        CodeWord_Width_dec_real[27]) );
  NOR2BX1 U23 ( .AN(CODEWORD_WIDTH[28]), .B(n11), .Y(
        CodeWord_Width_dec_real[28]) );
  NOR2BX1 U24 ( .AN(CODEWORD_WIDTH[29]), .B(n11), .Y(
        CodeWord_Width_dec_real[29]) );
  NOR2BX1 U25 ( .AN(CODEWORD_WIDTH[2]), .B(n11), .Y(CodeWord_Width_dec_real[2]) );
  NOR2BX1 U26 ( .AN(CODEWORD_WIDTH[30]), .B(n11), .Y(
        CodeWord_Width_dec_real[30]) );
  NOR2BX1 U27 ( .AN(CODEWORD_WIDTH[31]), .B(n11), .Y(
        CodeWord_Width_dec_real[31]) );
  NOR2BX1 U28 ( .AN(CODEWORD_WIDTH[3]), .B(n11), .Y(CodeWord_Width_dec_real[3]) );
  NOR2BX1 U29 ( .AN(CODEWORD_WIDTH[4]), .B(n11), .Y(CodeWord_Width_dec_real[4]) );
  NOR2BX1 U30 ( .AN(CODEWORD_WIDTH[5]), .B(n11), .Y(CodeWord_Width_dec_real[5]) );
  NOR2BX1 U31 ( .AN(CODEWORD_WIDTH[6]), .B(n11), .Y(CodeWord_Width_dec_real[6]) );
  NOR2BX1 U32 ( .AN(CODEWORD_WIDTH[7]), .B(n10), .Y(CodeWord_Width_dec_real[7]) );
  NOR2BX1 U33 ( .AN(CODEWORD_WIDTH[8]), .B(n10), .Y(CodeWord_Width_dec_real[8]) );
  NOR2BX1 U34 ( .AN(CODEWORD_WIDTH[9]), .B(n10), .Y(CodeWord_Width_dec_real[9]) );
  CLKINVX3 U35 ( .A(n12), .Y(n11) );
  NOR2BX1 U36 ( .AN(CODEWORD_WIDTH[10]), .B(n10), .Y(
        CodeWord_Width_dec_real[10]) );
  NOR2BX1 U37 ( .AN(CODEWORD_WIDTH[11]), .B(n10), .Y(
        CodeWord_Width_dec_real[11]) );
  NOR2BX1 U38 ( .AN(CODEWORD_WIDTH[12]), .B(n10), .Y(
        CodeWord_Width_dec_real[12]) );
  NOR2BX1 U39 ( .AN(CODEWORD_WIDTH[13]), .B(n10), .Y(
        CodeWord_Width_dec_real[13]) );
  NOR2BX1 U40 ( .AN(CODEWORD_WIDTH[14]), .B(n10), .Y(
        CodeWord_Width_dec_real[14]) );
  NOR2BX1 U41 ( .AN(CODEWORD_WIDTH[15]), .B(n10), .Y(
        CodeWord_Width_dec_real[15]) );
  NOR2BX1 U42 ( .AN(CODEWORD_WIDTH[16]), .B(n10), .Y(
        CodeWord_Width_dec_real[16]) );
  NOR2BX1 U43 ( .AN(CODEWORD_WIDTH[17]), .B(n10), .Y(
        CodeWord_Width_dec_real[17]) );
  NOR2BX1 U44 ( .AN(CODEWORD_WIDTH[18]), .B(n10), .Y(
        CodeWord_Width_dec_real[18]) );
  NOR2BX1 U45 ( .AN(CODEWORD_WIDTH[19]), .B(n10), .Y(
        CodeWord_Width_dec_real[19]) );
  CLKINVX3 U46 ( .A(n12), .Y(n10) );
  INVX1 U47 ( .A(n132), .Y(n12) );
  CLKINVX3 U48 ( .A(n19), .Y(n18) );
  CLKINVX3 U49 ( .A(n2), .Y(n16) );
  NOR2BX1 U50 ( .AN(n18), .B(n15), .Y(n132) );
  CLKINVX3 U51 ( .A(n1), .Y(n14) );
  CLKINVX3 U52 ( .A(n19), .Y(n17) );
  INVX1 U53 ( .A(n63), .Y(n19) );
  CLKINVX3 U54 ( .A(n2), .Y(n15) );
  CLKINVX3 U55 ( .A(n1), .Y(n13) );
  CLKINVX3 U56 ( .A(n3), .Y(n20) );
  CLKINVX3 U57 ( .A(n3), .Y(n21) );
  INVX1 U58 ( .A(n61), .Y(n137) );
  OAI21XL U59 ( .A0(n99), .A1(n131), .B0(n102), .Y(n63) );
  INVX1 U60 ( .A(n54), .Y(n99) );
  NAND2X1 U61 ( .A(n138), .B(n3), .Y(n61) );
  NAND2X1 U62 ( .A(n48), .B(n100), .Y(n131) );
  INVX1 U63 ( .A(N266), .Y(n138) );
  NAND2X2 U64 ( .A(n3), .B(n51), .Y(En_Enc_Dec_real[0]) );
  NAND2X1 U65 ( .A(n100), .B(n101), .Y(n54) );
  INVX1 U66 ( .A(n51), .Y(n102) );
  NAND2X1 U67 ( .A(n102), .B(n48), .Y(n60) );
  OAI22X1 U68 ( .A0(n137), .A1(n101), .B0(n53), .B1(n60), .Y(n135) );
  OAI22X1 U69 ( .A0(n137), .A1(n100), .B0(n60), .B1(n54), .Y(n136) );
  INVX1 U70 ( .A(n56), .Y(n97) );
  INVX1 U71 ( .A(n48), .Y(n58) );
  OAI2BB2X2 U72 ( .B0(n90), .B1(n18), .A0N(DATA_IN[14]), .A1N(n15), .Y(
        data_in_dec_real[14]) );
  XNOR2X1 U73 ( .A(data_out_enc[14]), .B(NOISE[14]), .Y(n90) );
  OAI2BB2X2 U74 ( .B0(n89), .B1(n18), .A0N(DATA_IN[15]), .A1N(n15), .Y(
        data_in_dec_real[15]) );
  XNOR2X1 U75 ( .A(data_out_enc[15]), .B(NOISE[15]), .Y(n89) );
  OAI2BB2X2 U76 ( .B0(n91), .B1(n18), .A0N(DATA_IN[13]), .A1N(n15), .Y(
        data_in_dec_real[13]) );
  XNOR2X1 U77 ( .A(data_out_enc[13]), .B(NOISE[13]), .Y(n91) );
  OAI2BB2X2 U78 ( .B0(n65), .B1(n17), .A0N(DATA_IN[8]), .A1N(n15), .Y(
        data_in_dec_real[8]) );
  XNOR2X1 U79 ( .A(data_out_enc[8]), .B(NOISE[8]), .Y(n65) );
  OAI222XL U80 ( .A0(n50), .A1(n51), .B0(\current_state_dec[1] ), .B1(n138), 
        .C0(\current_state_enc[1] ), .C1(n3), .Y(n49) );
  AND2X2 U81 ( .A(n53), .B(n54), .Y(n50) );
  NAND2BX1 U82 ( .AN(CTRL_ready), .B(n47), .Y(n48) );
  NOR2X1 U83 ( .A(n139), .B(CTRL[1]), .Y(N266) );
  INVX1 U84 ( .A(CTRL[0]), .Y(n139) );
  OR2X2 U85 ( .A(CTRL[1]), .B(CTRL[0]), .Y(n3) );
  OAI2BB2X2 U86 ( .B0(n92), .B1(n18), .A0N(DATA_IN[12]), .A1N(n15), .Y(
        data_in_dec_real[12]) );
  XNOR2X1 U87 ( .A(data_out_enc[12]), .B(NOISE[12]), .Y(n92) );
  OAI2BB2X2 U88 ( .B0(n62), .B1(n17), .A0N(DATA_IN[9]), .A1N(n16), .Y(
        data_in_dec_real[9]) );
  XNOR2X1 U89 ( .A(data_out_enc[9]), .B(NOISE[9]), .Y(n62) );
  OAI2BB2X2 U90 ( .B0(n93), .B1(n18), .A0N(DATA_IN[11]), .A1N(n15), .Y(
        data_in_dec_real[11]) );
  XNOR2X1 U91 ( .A(data_out_enc[11]), .B(NOISE[11]), .Y(n93) );
  OAI2BB2X2 U92 ( .B0(n94), .B1(n18), .A0N(DATA_IN[10]), .A1N(n15), .Y(
        data_in_dec_real[10]) );
  XNOR2X1 U93 ( .A(data_out_enc[10]), .B(NOISE[10]), .Y(n94) );
  OAI2BB2X2 U94 ( .B0(n67), .B1(n17), .A0N(DATA_IN[6]), .A1N(n16), .Y(
        data_in_dec_real[6]) );
  XNOR2X1 U95 ( .A(data_out_enc[6]), .B(NOISE[6]), .Y(n67) );
  XNOR2X1 U96 ( .A(data_out_enc[28]), .B(NOISE[28]), .Y(n75) );
  XNOR2X1 U97 ( .A(data_out_enc[31]), .B(NOISE[31]), .Y(n71) );
  XNOR2X1 U98 ( .A(data_out_enc[30]), .B(NOISE[30]), .Y(n72) );
  OAI2BB2X1 U99 ( .B0(n81), .B1(n18), .A0N(DATA_IN[22]), .A1N(n16), .Y(
        data_in_dec_real[22]) );
  XNOR2X1 U100 ( .A(data_out_enc[22]), .B(NOISE[22]), .Y(n81) );
  OAI2BB2X1 U101 ( .B0(n88), .B1(n18), .A0N(DATA_IN[16]), .A1N(n15), .Y(
        data_in_dec_real[16]) );
  XNOR2X1 U102 ( .A(data_out_enc[16]), .B(NOISE[16]), .Y(n88) );
  OAI2BB2X1 U103 ( .B0(n83), .B1(n18), .A0N(DATA_IN[20]), .A1N(n15), .Y(
        data_in_dec_real[20]) );
  XNOR2X1 U104 ( .A(data_out_enc[20]), .B(NOISE[20]), .Y(n83) );
  NAND2X1 U105 ( .A(CTRL[1]), .B(n139), .Y(n51) );
  NAND2X1 U106 ( .A(current_state[0]), .B(n101), .Y(n53) );
  INVX1 U107 ( .A(current_state[1]), .Y(n101) );
  INVX1 U108 ( .A(current_state[0]), .Y(n100) );
  XNOR2X1 U109 ( .A(data_out_enc[23]), .B(NOISE[23]), .Y(n80) );
  XNOR2X1 U110 ( .A(data_out_enc[21]), .B(NOISE[21]), .Y(n82) );
  XNOR2X1 U111 ( .A(data_out_enc[26]), .B(NOISE[26]), .Y(n77) );
  XNOR2X1 U112 ( .A(data_out_enc[27]), .B(NOISE[27]), .Y(n76) );
  XNOR2X1 U113 ( .A(data_out_enc[29]), .B(NOISE[29]), .Y(n74) );
  OAI2BB2X1 U114 ( .B0(n85), .B1(n18), .A0N(DATA_IN[19]), .A1N(n15), .Y(
        data_in_dec_real[19]) );
  XNOR2X1 U115 ( .A(data_out_enc[19]), .B(NOISE[19]), .Y(n85) );
  OAI2BB2X1 U116 ( .B0(n86), .B1(n17), .A0N(DATA_IN[18]), .A1N(n15), .Y(
        data_in_dec_real[18]) );
  XNOR2X1 U118 ( .A(data_out_enc[18]), .B(NOISE[18]), .Y(n86) );
  OAI2BB2X1 U119 ( .B0(n78), .B1(n17), .A0N(DATA_IN[25]), .A1N(n16), .Y(
        data_in_dec_real[25]) );
  XNOR2X1 U120 ( .A(data_out_enc[25]), .B(NOISE[25]), .Y(n78) );
  OAI2BB2X1 U121 ( .B0(n70), .B1(n17), .A0N(DATA_IN[3]), .A1N(n16), .Y(
        data_in_dec_real[3]) );
  XNOR2X1 U122 ( .A(data_out_enc[3]), .B(NOISE[3]), .Y(n70) );
  OAI2BB2X1 U123 ( .B0(n66), .B1(n17), .A0N(DATA_IN[7]), .A1N(n15), .Y(
        data_in_dec_real[7]) );
  XNOR2X1 U124 ( .A(data_out_enc[7]), .B(NOISE[7]), .Y(n66) );
  XNOR2X1 U125 ( .A(data_out_enc[24]), .B(NOISE[24]), .Y(n79) );
  OAI2BB2X1 U126 ( .B0(n84), .B1(n18), .A0N(DATA_IN[1]), .A1N(n15), .Y(
        data_in_dec_real[1]) );
  XNOR2X1 U127 ( .A(data_out_enc[1]), .B(NOISE[1]), .Y(n84) );
  OAI2BB2X1 U128 ( .B0(n87), .B1(n17), .A0N(DATA_IN[17]), .A1N(n15), .Y(
        data_in_dec_real[17]) );
  XNOR2X1 U129 ( .A(data_out_enc[17]), .B(NOISE[17]), .Y(n87) );
  OAI2BB2X1 U130 ( .B0(n73), .B1(n17), .A0N(DATA_IN[2]), .A1N(n16), .Y(
        data_in_dec_real[2]) );
  XNOR2X1 U131 ( .A(data_out_enc[2]), .B(NOISE[2]), .Y(n73) );
  OAI2BB2X1 U132 ( .B0(n69), .B1(n17), .A0N(DATA_IN[4]), .A1N(n16), .Y(
        data_in_dec_real[4]) );
  XNOR2X1 U133 ( .A(data_out_enc[4]), .B(NOISE[4]), .Y(n69) );
  OAI2BB2X1 U134 ( .B0(n68), .B1(n17), .A0N(DATA_IN[5]), .A1N(n15), .Y(
        data_in_dec_real[5]) );
  XNOR2X1 U135 ( .A(data_out_enc[5]), .B(NOISE[5]), .Y(n68) );
  OAI2BB2X1 U136 ( .B0(n95), .B1(n18), .A0N(DATA_IN[0]), .A1N(n15), .Y(
        data_in_dec_real[0]) );
  XNOR2X1 U137 ( .A(data_out_enc[0]), .B(NOISE[0]), .Y(n95) );
  NOR2BX2 U138 ( .AN(CODEWORD_WIDTH[0]), .B(n10), .Y(
        CodeWord_Width_dec_real[0]) );
  NOR2BX1 U139 ( .AN(CODEWORD_WIDTH[1]), .B(n10), .Y(
        CodeWord_Width_dec_real[1]) );
  NAND2X2 U140 ( .A(En_Enc_Dec_real[0]), .B(n130), .Y(En_Enc_Dec_real[1]) );
  OAI21XL U141 ( .A0(current_state[1]), .A1(n131), .B0(n102), .Y(n130) );
  INVX1 U142 ( .A(n55), .Y(n23) );
  AOI22X1 U143 ( .A0(num_of_errors[0]), .A1(n97), .B0(num_of_error_dec[0]), 
        .B1(n56), .Y(n55) );
  INVX1 U144 ( .A(n57), .Y(n22) );
  AOI22X1 U145 ( .A0(num_of_errors[1]), .A1(n97), .B0(num_of_error_dec[1]), 
        .B1(n56), .Y(n57) );
  INVX1 U146 ( .A(n105), .Y(n26) );
  AOI22X1 U147 ( .A0(n20), .A1(data_out_enc[23]), .B0(data_out_dec[23]), .B1(
        n14), .Y(n105) );
  INVX1 U148 ( .A(n106), .Y(n27) );
  AOI22X1 U149 ( .A0(n20), .A1(data_out_enc[22]), .B0(data_out_dec[22]), .B1(
        n14), .Y(n106) );
  INVX1 U150 ( .A(n107), .Y(n28) );
  AOI22X1 U151 ( .A0(n20), .A1(data_out_enc[21]), .B0(data_out_dec[21]), .B1(
        n14), .Y(n107) );
  INVX1 U152 ( .A(n108), .Y(n29) );
  AOI22X1 U153 ( .A0(n20), .A1(data_out_enc[20]), .B0(data_out_dec[20]), .B1(
        n14), .Y(n108) );
  INVX1 U154 ( .A(n109), .Y(n30) );
  AOI22X1 U155 ( .A0(n20), .A1(data_out_enc[19]), .B0(data_out_dec[19]), .B1(
        n14), .Y(n109) );
  INVX1 U156 ( .A(n110), .Y(n31) );
  AOI22X1 U157 ( .A0(n20), .A1(data_out_enc[18]), .B0(data_out_dec[18]), .B1(
        n14), .Y(n110) );
  INVX1 U158 ( .A(n111), .Y(n32) );
  AOI22X1 U159 ( .A0(n20), .A1(data_out_enc[17]), .B0(data_out_dec[17]), .B1(
        n14), .Y(n111) );
  INVX1 U160 ( .A(n112), .Y(n33) );
  AOI22X1 U161 ( .A0(n20), .A1(data_out_enc[16]), .B0(data_out_dec[16]), .B1(
        n14), .Y(n112) );
  INVX1 U162 ( .A(n113), .Y(n34) );
  AOI22X1 U163 ( .A0(n20), .A1(data_out_enc[15]), .B0(data_out_dec[15]), .B1(
        n14), .Y(n113) );
  INVX1 U164 ( .A(n114), .Y(n35) );
  AOI22X1 U165 ( .A0(n20), .A1(data_out_enc[14]), .B0(data_out_dec[14]), .B1(
        n14), .Y(n114) );
  INVX1 U166 ( .A(n115), .Y(n36) );
  AOI22X1 U167 ( .A0(n21), .A1(data_out_enc[13]), .B0(data_out_dec[13]), .B1(
        n14), .Y(n115) );
  INVX1 U168 ( .A(n116), .Y(n37) );
  AOI22X1 U169 ( .A0(n21), .A1(data_out_enc[12]), .B0(data_out_dec[12]), .B1(
        n14), .Y(n116) );
  INVX1 U170 ( .A(n103), .Y(n24) );
  AOI22X1 U171 ( .A0(n20), .A1(data_out_enc[25]), .B0(data_out_dec[25]), .B1(
        n13), .Y(n103) );
  INVX1 U172 ( .A(n104), .Y(n25) );
  AOI22X1 U173 ( .A0(n20), .A1(data_out_enc[24]), .B0(data_out_dec[24]), .B1(
        n14), .Y(n104) );
  OAI2BB1X1 U174 ( .A0N(ready_Decoder_dec), .A1N(n56), .B0(n129), .Y(N233) );
  NAND3X1 U175 ( .A(\current_state_enc[1] ), .B(n20), .C(ready_Encoder_enc), 
        .Y(n129) );
  OAI32X1 U176 ( .A0(n138), .A1(\current_state_dec[1] ), .A2(n58), .B0(N266), 
        .B1(n98), .Y(n133) );
  OAI32X1 U177 ( .A0(n3), .A1(\current_state_enc[1] ), .A2(n58), .B0(n21), 
        .B1(n96), .Y(n134) );
  INVX1 U178 ( .A(\current_state_enc[1] ), .Y(n96) );
  INVX1 U179 ( .A(n117), .Y(n38) );
  AOI22X1 U180 ( .A0(n21), .A1(data_out_enc[11]), .B0(data_out_dec[11]), .B1(
        n13), .Y(n117) );
  INVX1 U181 ( .A(n118), .Y(n39) );
  AOI22X1 U182 ( .A0(n21), .A1(data_out_enc[10]), .B0(data_out_dec[10]), .B1(
        n13), .Y(n118) );
  INVX1 U183 ( .A(n119), .Y(n40) );
  AOI22X1 U184 ( .A0(n21), .A1(data_out_enc[9]), .B0(data_out_dec[9]), .B1(n13), .Y(n119) );
  INVX1 U185 ( .A(n120), .Y(n41) );
  AOI22X1 U186 ( .A0(n21), .A1(data_out_enc[8]), .B0(data_out_dec[8]), .B1(n13), .Y(n120) );
  INVX1 U187 ( .A(n121), .Y(n42) );
  AOI22X1 U188 ( .A0(n21), .A1(data_out_enc[7]), .B0(data_out_dec[7]), .B1(n13), .Y(n121) );
  INVX1 U189 ( .A(n122), .Y(n43) );
  AOI22X1 U190 ( .A0(n21), .A1(data_out_enc[6]), .B0(data_out_dec[6]), .B1(n13), .Y(n122) );
  INVX1 U191 ( .A(n123), .Y(n44) );
  AOI22X1 U192 ( .A0(n21), .A1(data_out_enc[5]), .B0(data_out_dec[5]), .B1(n13), .Y(n123) );
  INVX1 U193 ( .A(n124), .Y(n45) );
  AOI22X1 U194 ( .A0(n21), .A1(data_out_enc[4]), .B0(data_out_dec[4]), .B1(n13), .Y(n124) );
  INVX1 U195 ( .A(n125), .Y(n46) );
  AOI22X1 U196 ( .A0(n21), .A1(data_out_enc[3]), .B0(data_out_dec[3]), .B1(n13), .Y(n125) );
  INVX1 U197 ( .A(n126), .Y(n52) );
  AOI22X1 U198 ( .A0(n21), .A1(data_out_enc[2]), .B0(data_out_dec[2]), .B1(n13), .Y(n126) );
  INVX1 U199 ( .A(n127), .Y(n59) );
  AOI22X1 U200 ( .A0(n20), .A1(data_out_enc[1]), .B0(data_out_dec[1]), .B1(n13), .Y(n127) );
  INVX1 U201 ( .A(n128), .Y(n64) );
  AOI22X1 U202 ( .A0(n21), .A1(data_out_enc[0]), .B0(data_out_dec[0]), .B1(n13), .Y(n128) );
  INVX1 U203 ( .A(\current_state_dec[1] ), .Y(n98) );
  AND2X2 U204 ( .A(n20), .B(data_out_enc[31]), .Y(n4) );
  AND2X2 U205 ( .A(n21), .B(data_out_enc[30]), .Y(n5) );
  AND2X2 U206 ( .A(n20), .B(data_out_enc[29]), .Y(n6) );
  AND2X2 U207 ( .A(n21), .B(data_out_enc[28]), .Y(n7) );
  AND2X2 U208 ( .A(n20), .B(data_out_enc[27]), .Y(n8) );
  AND2X2 U209 ( .A(n21), .B(data_out_enc[26]), .Y(n9) );
endmodule


module ecc_enc_dec ( clk, reset, PADDR, PENABLE, PSEL, PWDATA, PWRITE, PRDATA, 
        data_out, operation_done, num_of_errors );
  input [19:0] PADDR;
  input [31:0] PWDATA;
  output [31:0] PRDATA;
  output [31:0] data_out;
  output [1:0] num_of_errors;
  input clk, reset, PENABLE, PSEL, PWRITE;
  output operation_done;
  wire   CTRL_ready_Register_Bank;
  wire   [1:0] REG_ENABLE_APB_Slave;
  wire   [31:0] CTRL_Register_Bank;
  wire   [31:0] DATA_IN_Register_Bank;
  wire   [31:0] CODEWORD_WIDTH_Register_Bank;
  wire   [31:0] NOISE_Register_Bank;

  APB_Slave_DATA_WIDTH32 APB_Slave ( .clk(clk), .reset(reset), .PENABLE(
        PENABLE), .PSEL(PSEL), .PWRITE(PWRITE), .REG_ENABLE(
        REG_ENABLE_APB_Slave) );
  Register_Bank_AMBA_WORD32_AMBA_ADDR_WIDTH20 Register_Bank ( .clk(clk), 
        .reset(reset), .PADDR(PADDR), .PWDATA(PWDATA), .REG_ENABLE(
        REG_ENABLE_APB_Slave), .CTRL(CTRL_Register_Bank), .DATA_IN(
        DATA_IN_Register_Bank), .CODEWORD_WIDTH(CODEWORD_WIDTH_Register_Bank), 
        .NOISE(NOISE_Register_Bank), .PRDATA(PRDATA), .CTRL_ready(
        CTRL_ready_Register_Bank) );
  controller_AMBA_WORD32_DATA_WIDTH32 controller ( .clk(clk), .reset(reset), 
        .CTRL(CTRL_Register_Bank), .DATA_IN(DATA_IN_Register_Bank), 
        .CODEWORD_WIDTH(CODEWORD_WIDTH_Register_Bank), .NOISE(
        NOISE_Register_Bank), .CTRL_ready(CTRL_ready_Register_Bank), 
        .data_out(data_out), .operation_done(operation_done), .num_of_errors(
        num_of_errors) );
endmodule

