module testdisplay(
  clk, 
  segA, segB, segC, segD, segE, segF, segG, segDP,
  segA1, segB1, segC1, segD1, segE1, segF1, segG1, segDP1,
	segA2, segB2, segC2, segD2, segE2, segF2, segG2, segDP2,
  segA3, segB3, segC3, segD3, segE3, segF3, segG3, segDP3
  
);
  input clk;
  wire OUT_CLK;
  reg [15:0] data_in = 16'b0; 
  always@(posedge OUT_CLK) data_in <= data_in +1;
  FD2 fd(clk, 1'b0, OUT_CLK);
  output segA, segB, segC, segD, segE, segF, segG, segDP;
  output  segA1, segB1, segC1, segD1, segE1, segF1, segG1, segDP1;
  output  segA2, segB2, segC2, segD2, segE2, segF2, segG2, segDP2;
  output  segA3, segB3, segC3, segD3, segE3, segF3, segG3, segDP3;
  sevenSegment ss1(data_in[3:0], OUT_CLK, segA, segB, segC, segD, segE, segF, segG, segDP);
  sevenSegment ss2(data_in[7:4], OUT_CLK, segA1, segB1, segC1, segD1, segE1, segF1, segG1, segDP1);
  sevenSegment ss3(data_in[11:8], OUT_CLK, segA2, segB2, segC2, segD2, segE2, segF2, segG2, segDP2);
  sevenSegment ss4(data_in[15:12], OUT_CLK, segA3, segB3, segC3, segD3, segE3, segF3, segG3, segDP3);

  
endmodule